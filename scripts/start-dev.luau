local fs = require("@lune/fs")
local process = require("@lune/process")
local task = require("@lune/task")

print("Installing packages")

process.exec("rokit", { "install" }, { stdio = "forward" })

process.exec("wally", { "install" }, { stdio = "forward" })

if not fs.isDir("./ServerPackages") then
	fs.writeDir("./ServerPackages")
end

print("Clearing old build")

if fs.isDir("./build") then
	fs.removeDir("./build")
end

print("Building darklua config")

process.exec("lune", { "run", "scripts/darkluaconfig" }, { stdio = "forward" })

print("Building vscode aliases")

process.exec("lune", { "run", "scripts/alias-builder" }, { stdio = "forward" })

print("Starting darklua watch")

-- get operating system, if mac then run dev.bash, otherwise run below line
if process.os == "macos" then
	task.spawn(process.exec, "./dev.bash", {}, { stdio = "forward" })
else
	task.spawn(process.exec, "./dev.bat", {}, { stdio = "forward" })
end

print("Starting server")

repeat
	task.wait(1)
until fs.isDir("./build") and fs.isDir("./build/services") and fs.isDir("./build/startup")

task.wait(1)

print("Starting rojo")

process.exec("rojo", {
	"serve",
	"build.project.json",
}, { stdio = "forward" })
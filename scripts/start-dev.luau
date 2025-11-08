local fs = require("@lune/fs") :: any
local process = require("@lune/process") :: any
local task = require("@lune/task") :: any

print("Installing packages")

process.create("rokit", { "install" }, { stdio = "forward" })

print("Clearing old build")

if fs.isDir("./build") then
	fs.removeDir("./build")
end

print("Building darklua config")

process.create("lune", { "run", "scripts/darkluaconfig" }, { stdio = "forward" })

print("Building vscode aliases")

process.create("lune", { "run", "scripts/alias-builder" }, { stdio = "forward" })

print("Starting darklua watch")

-- get operating system, if mac then run dev.bash, otherwise run below line
if process.os == "macos" then
	task.spawn(process.create, "./dev.bash", {}, { stdio = "forward" })
else
	task.spawn(process.create, "./dev.bat", {}, { stdio = "forward" })
end

print("Starting server")

repeat
	task.wait()
until fs.isDir("./build") and fs.isDir("./build/services") and fs.isDir("./build/startup")

task.wait()

print("Starting rojo")

process.create("rojo", {
	"serve",
	"build.project.json",
}, { stdio = "forward" })
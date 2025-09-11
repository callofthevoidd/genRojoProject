local RandomModule = require("@server_modules/RandomModule")

local ExampleServiceServer = {}

function ExampleServiceServer.init(self: ExampleServiceServer)
	print("Hello from server!")

	print(`Got a random number (server): {RandomModule.GetRandomNumber({ min = 100, max = 500 })}`)
end

export type ExampleServiceServer = typeof(ExampleServiceServer) & {}

return ExampleServiceServer

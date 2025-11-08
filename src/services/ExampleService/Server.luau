local ExampleServiceServer = {}

function ExampleServiceServer.init(self: ExampleServiceServer)
	print("Hello from server!")
end

export type ExampleServiceServer = typeof(ExampleServiceServer) & {}

return ExampleServiceServer

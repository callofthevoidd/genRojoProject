local AnotherServiceServer = {}

function AnotherServiceServer.init(self: AnotherServiceServer)
	print("hi from AnotherServiceServer!")
end

export type AnotherServiceServer = typeof(AnotherServiceServer) & {}

return AnotherServiceServer

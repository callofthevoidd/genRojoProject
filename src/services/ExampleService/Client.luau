local Utils = require("@services/ExampleService/Utils")

local ExampleServiceClient = {}

function ExampleServiceClient.init(self: ExampleServiceClient)
    print("Hello from client!")

    Utils.GotRandomNumber:Connect(function(range: { max: number, min: number })
        print(`Got a random number on the range of: {range.min} to {range.max}!`)
    end)

    print(`Random number (client): {Utils.getRandomNumber({max = 100, min = 1})}`)
end

export type ExampleServiceClient = typeof(ExampleServiceClient) & {}

return ExampleServiceClient

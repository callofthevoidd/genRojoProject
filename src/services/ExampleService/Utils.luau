local Signal = require("@packages/signal")

local ExampleServiceUtils = {
    GotRandomNumber = Signal.new()
}

function ExampleServiceUtils.getRandomNumber(range: {min: number, max: number})
    assert(range.min, range.max, "Invalid range type.")
    assert(range.min < range.max, "Maximum range must not be less than minimum range.")

    ExampleServiceUtils.GotRandomNumber:Fire(range)

    return math.random(range.min, range.max)
end

return ExampleServiceUtils
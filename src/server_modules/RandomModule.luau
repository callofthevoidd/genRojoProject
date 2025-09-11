local Random = require("@classes/Random")

local RandomModule = {}

function RandomModule.GetRandomNumber(range: { min: number, max: number })
	local rand = Random.new(range)

	local num = rand:Get()

	rand:Destroy()

	return num
end

return RandomModule

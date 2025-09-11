local Random = {}
Random.__index = Random

function Random.new(range: { min: number, max: number }): Random
	local self = setmetatable({}, Random)

	self.number = math.random(range.min, range.max)

	return self
end

function Random.Get(self: Random)
	return self.number
end

function Random.Destroy(self: Random)
	setmetatable(self, nil)
end

export type Random = typeof(Random) & {
	number: number,
}

return Random

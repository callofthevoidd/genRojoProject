local fs = require("@lune/fs") :: any
local serde = require("@lune/serde") :: any

local REQUIRE_ALIASES = require("./ALIASES")

local Luaurc = serde.decode("json", fs.readFile("./.luaurc"))
Luaurc["aliases"] = REQUIRE_ALIASES

fs.writeFile("./.luaurc", serde.encode("json", Luaurc, true))
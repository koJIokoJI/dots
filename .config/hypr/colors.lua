local json = require("cjson")

local path = os.getenv("HOME") .. "/.cache/wal/colors.json"

local f = assert(io.open(path, "r"))
local content = f:read("*a")
f:close()

return json.decode(content)

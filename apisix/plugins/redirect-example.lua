local core = require("apisix.core")
local ngx = ngx

local plugin_name = "redirect-example"
local schema = {
    type = "object",
    properties = {},
}

local _M = {
    version = 0.1,
    proprity = 81,
    name = plugin_name,
    schema = schema,
}

function _M.access(conf, ctx)
    core.log.warn("redirect-example access phase")
    local uri = "https://github.com/apache/apisix"
    core.response.set_header("Location", uri)
    return ngx.HTTP_MOVED_TEMPORARITY
end

return _M

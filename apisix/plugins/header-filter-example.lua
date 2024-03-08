local core = require("apisix.core")
local ngx = ngx

local plugin_name = "header-filter-example"
local schema = {
    type = "object",
    properties = {},
}

local _M = {
    version = 0.1,
    proprity = 80,
    name = plugin_name,
    schema = schema,
}

function _M.header_filter(conf, ctx)
    core.log.warn("header-filter-example header_filter phase")
    core.response.set_header("X-Header-Filter", true)
end

return _M

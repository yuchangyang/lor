local type = type

local version = "0.2.2"
local Route = require("lor.lib.router.route")
local Router = require("lor.lib.router.router")
local Request = require("lor.lib.request")
local Response = require("lor.lib.response")
local Application = require("lor.lib.application")
local Wrap = require("lor.lib.wrap")

LOR_FRAMEWORK_DEBUG = false

local createApplication = function(options)
    if options and options.debug and type(options.debug) == 'boolean' then
        LOR_FRAMEWORK_DEBUG = options.debug
    end

    local app = Application:new()
    app:init(options)

    return app
end

local lor = Wrap:new(createApplication, Router, Route, Request, Response)
lor.version = version

return lor
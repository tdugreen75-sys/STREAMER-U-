--[[
	Main.server.lua
	Foundation bootstrap. Requires and initializes each system's
	Init() function. Keep this file thin — it should only wire
	systems together, never contain system logic itself.
]]

local ServerScriptService = game:GetService("ServerScriptService")
local Systems = ServerScriptService:WaitForChild("Systems")

local IdentityService = require(Systems.Identity.IdentityService)
IdentityService.Init()

print("[StreamerU] Foundation loaded: Identity system online.")

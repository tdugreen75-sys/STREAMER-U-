--[[
	Main.client.lua
	Client bootstrap. Requires client-side system modules so they
	start listening for server events. Keep thin, like the server
	bootstrap.
]]

local playerScripts = script.Parent
require(playerScripts:WaitForChild("IdentityClient"))

print("[StreamerU] Client foundation loaded.")

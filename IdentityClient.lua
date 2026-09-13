--[[
	IdentityClient.lua
	Minimal client-side identity cache. No UI yet — future systems
	(uniform closet, dorms, etc.) can require this module to read
	the local player's identity instead of each adding its own
	remote listener.
]]

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Remotes = require(ReplicatedStorage:WaitForChild("Remotes"))

local ClientIdentity = {
	Type = nil,
	Id = nil,
	DisplayTitle = nil,
}

Remotes.IdentityReady.OnClientEvent:Connect(function(identity)
	ClientIdentity.Type = identity.Type
	ClientIdentity.Id = identity.Id
	ClientIdentity.DisplayTitle = identity.DisplayTitle

	print(string.format("[StreamerU] Identity received: %s (%s)", ClientIdentity.Id, ClientIdentity.Type))
end)

return ClientIdentity

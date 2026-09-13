--[[
	Remotes (init.lua)

	Central registry for RemoteEvents/RemoteFunctions.
	Require this module from both server and client:
	  - On the server it creates the underlying Instances once.
	  - On the client it just waits for and returns the same
	    references.

	No system should ever hardcode a remote name as a raw string
	anywhere else — add it here instead, once.
]]

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")

local Remotes = {}

-- Add new remotes here as systems need them.
-- kind = "Event" or "Function"
local REMOTE_DEFINITIONS = {
	IdentityReady = "Event", -- server -> client, fired once a player's identity is assigned
}

local remotesFolder = script -- this init.lua's own folder IS ReplicatedStorage.Remotes

if RunService:IsServer() then
	for name, kind in pairs(REMOTE_DEFINITIONS) do
		if not remotesFolder:FindFirstChild(name) then
			local instance
			if kind == "Event" then
				instance = Instance.new("RemoteEvent")
			elseif kind == "Function" then
				instance = Instance.new("RemoteFunction")
			else
				error(("Unknown remote kind '%s' for '%s'"):format(tostring(kind), name))
			end
			instance.Name = name
			instance.Parent = remotesFolder
		end
	end
end

setmetatable(Remotes, {
	__index = function(_, key)
		return remotesFolder:WaitForChild(key)
	end,
})

return Remotes

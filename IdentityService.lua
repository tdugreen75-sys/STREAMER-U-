--[[
	IdentityService.lua
	Server-authoritative identity system.

	Responsibilities:
	- Assign every player a Student ID or Staff ID on join
	- Give each player a stable visible ID for the duration of the session
	- Generate a deterministic visible ID without exposing the raw Roblox UserId
	- Expose a small read-only API other systems can require and call

	Explicitly NOT responsible for, in this phase:
	- Saving/loading identity data between sessions
	- Any UI
]]

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local Config = ReplicatedStorage:WaitForChild("Config")
local StudentConfig = require(Config:WaitForChild("StudentConfig"))
local StaffConfig = require(Config:WaitForChild("StaffConfig"))

local Remotes = require(ReplicatedStorage:WaitForChild("Remotes"))

local IdentityService = {}

-- In-memory only. No persistence yet.
local identities = {} -- [UserId] = { Type, Id, DisplayTitle }

-- Creates a stable visible number from the Roblox UserId without displaying
-- the UserId itself. The arithmetic is intentionally simple and deterministic;
-- it is not intended to be cryptographic protection.
local function generateVisibleNumber(userId, salt, minDigits)
	local modulus = 9000000
	local offset = 1000000
	local number = ((userId * 7919 + salt) % modulus) + offset
	return string.format("%0" .. tostring(minDigits) .. "d", number)
end

local function formatId(prefix, userId, salt, minDigits)
	local visibleNumber = generateVisibleNumber(userId, salt, minDigits)
	return string.format("%s-%s", prefix, visibleNumber)
end

local function isStaff(userId)
	return StaffConfig.AuthorizedUserIds[userId] == true
end

local function buildIdentity(player)
	local userId = player.UserId

	if isStaff(userId) then
		return {
			Type = "Staff",
			Id = formatId(
				StaffConfig.IdPrefix,
				userId,
				StaffConfig.IdSalt,
				StaffConfig.IdNumberLength
			),
			DisplayTitle = StaffConfig.DefaultDisplayTitle,
		}
	end

	return {
		Type = "Student",
		Id = formatId(
			StudentConfig.IdPrefix,
			userId,
			StudentConfig.IdSalt,
			StudentConfig.IdNumberLength
		),
		DisplayTitle = StudentConfig.DefaultDisplayTitle,
	}
end

--- Returns the identity table for a player, or nil if not yet assigned.
function IdentityService.Get(player)
	return identities[player.UserId]
end

--- Returns the visible Student/Staff ID for a player, or nil if not assigned.
function IdentityService.GetId(player)
	local identity = identities[player.UserId]
	return identity and identity.Id or nil
end

--- Convenience check other systems (SUPD, Uniforms, Dorms) can call
--- without needing to know the shape of the identity table.
function IdentityService.IsStaff(player)
	local identity = identities[player.UserId]
	return identity ~= nil and identity.Type == "Staff"
end

local function onPlayerAdded(player)
	local identity = buildIdentity(player)
	identities[player.UserId] = identity

	Remotes.IdentityReady:FireClient(player, {
		Type = identity.Type,
		Id = identity.Id,
		DisplayTitle = identity.DisplayTitle,
	})
end

local function onPlayerRemoving(player)
	identities[player.UserId] = nil
end

function IdentityService.Init()
	Players.PlayerAdded:Connect(onPlayerAdded)
	Players.PlayerRemoving:Connect(onPlayerRemoving)

	-- Handle players already present (e.g. Studio Play-Solo / hot reload).
	for _, player in ipairs(Players:GetPlayers()) do
		onPlayerAdded(player)
	end
end

return IdentityService

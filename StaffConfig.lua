--[[
	StaffConfig.lua
	Central settings for staff/faculty identity and permissions.
]]

return {
	IdPrefix = "STF",
	IdNumberLength = 7,
	-- Used to create a stable, non-UserId-looking visible Staff ID.
	-- This is obfuscation for presentation, not a security secret.
	IdSalt = 731429,
	DefaultDisplayTitle = "Staff",

	-- Populate with Roblox UserIds of authorized staff.
	-- Swap for a group-rank check later if you'd rather manage
	-- staff through a Roblox group instead of a hardcoded list.
	AuthorizedUserIds = {
		-- [1234567] = true,
	},
}

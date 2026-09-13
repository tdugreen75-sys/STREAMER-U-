--[[
	StudentConfig.lua
	Central settings for student-facing systems.
	Add new student-related constants here instead of hardcoding
	them inside individual scripts.
]]

return {
	IdPrefix = "STU",
	IdNumberLength = 7,
	-- Used to create a stable, non-UserId-looking visible Student ID.
	-- This is obfuscation for presentation, not a security secret.
	IdSalt = 482917,
	DefaultDisplayTitle = "Student",
}

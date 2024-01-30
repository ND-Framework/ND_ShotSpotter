-- For support join my discord: https://discord.gg/Z9Mxu72zZ6

local alreadyShot = false
local config = lib.load("data.configuration")

-- check if the players location is inside the shot spotter locations, this will only be used in the code when realistic shot spotter is turned on.
local function isInShotSpotterLocation(coords)
    for _, location in pairs(config.realisticShotSpotter) do
        if #(coords - vector3(location.x, location.y, location.z)) < 450.0 then return true end
    end
    return false
end

function triggerShotSpotter(ped)
    local player = NDCore.getPlayer()
    local job = player.job.name
    local coords = GetEntityCoords(ped)
    local suppressed = IsPedCurrentWeaponSilenced(ped)
    local currentWeapon = cache.weapon
    local zoneName = GetLabelText(GetNameOfZone(coords.x, coords.y, coords.z))
    local street = GetStreetNameAtCoord(coords.x, coords.y, coords.z)
    local streetHash = GetStreetNameFromHashKey(street)

    if config.postalResourceName then postal = exports[config.postalResourceName]:getPostal()
    else postal = false end

    if config.realisticShotSpotter and not isInShotSpotterLocation(coords) then return end -- if the player isn't in the realistic shot spotter locations then the shot spotter won't trigger.

    for _, weapon in pairs(config.weaponBlackList) do -- if the player has a blacklisted weapon then the shot spotter won't trigger.
        if weapon == currentWeapon then return end
    end

    if suppressed then return end -- if the player has a suppresor attached to their weapon then the shot spotter won't trigger.

    if config.whitelistedJobs[job] then return end -- if the player has the job then they won't trigger the shotspotter.

    if alreadyShot then return end  -- the alreadyShot variable is used for checking if the player has already shot and to add a cooldown until it turns to false.

    alreadyShot = true
    Wait(config.shotSpotterDelay * 1000)
    TriggerServerEvent('ND_ShotSpotter:Trigger', streetHash, coords, postal, zoneName)
    Wait(config.shotSpotterCooldown * 1000)
    alreadyShot = false
end

--
-- NEED TO FIND BETTER METHOD OF THESE THREADS
-- 

CreateThread(function() -- Check if the player is shooting.
    while true do
        Wait(0)
        local ped = cache.ped
        if IsPedShooting(ped) then
            triggerShotSpotter(ped)
        end
    end
end)

if config.testing then
    CreateThread(function()
        Wait(0)
        for k, v in pairs(config.realisticShotSpotterLocations) do
            k = AddBlipForRadius(v.x, v.y, v.z, 450.0)
            SetBlipAlpha(k, 100)
        end
    end)
end

--
-- NEED TO FIND BETTER METHOD OF THESE THREADS
-- 
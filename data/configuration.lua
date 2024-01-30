return {
    shotSpotterDelay = 10, -- delay (in seconds) when cops will receive a notification after there has been a shooting.
    shotSpotterCooldown = 30, -- Cooldown for the next time a player can trigger it again.

    postalResourceName = 'nearest-postal', -- set to false to disable, the resource name of the nearest postal script, this is used for the export.

    whitelistedJobs = { -- jobs that won't trigger shot spotter
        ["lspd"] = true,
        ["bcso"] = true,
        ["sahp"] = true
    },

    -- Weapon that won't be triggered by the shot spotter.
    weaponBlackList = {
        `weapon_flaregun`,
        `weapon_stungun_mp`,
        `weapon_grenade`,
        `weapon_bzgas`,
        `weapon_molotov`,
        `weapon_stickybomb`,
        `weapon_proxmine`,
        `weapon_snowball`,
        `weapon_pipebomb`,
        `weapon_ball`,
        `weapon_smokegrenade`,
        `weapon_flare`,
        `weapon_petrolcan`,
        `weapon_fireextinguisher`,
        `weapon_hazardcan`,
        `weapon_fertilizercan`
    },

    realisticShotSpotter = { -- set to false to disable, this is if you want to enable the shot spotter only when the player is inside one of the zones below. The zones are in the city and a little around it.
        {x = 653.4214, y = -648.7440, z = 57.1897},
        {x = 1015.9837, y = -255.2573, z = 85.5857},
        {x = 329.9973, y = 288.9604, z = 120.1029},
        {x = -202.7689, y = -327.3490, z = 66.0497},
        {x = 31.3205, y = -875.2959, z = 31.4629},
        {x = 70.1372, y = -1718.3291, z = 34.2056},
        {x = 1196.9178, y = -1624.6641, z = 50.3403},
        {x = -852.9095, y = -1215.8782, z = 9.2463},
        {x = -932.7648, y = -448.8844, z = 42.9436},
        {x = -1713.6848, y = 478.4267, z = 130.3795},
        {x = -596.5602, y = 515.0753, z = 109.675},
        {x = 716.6274, y = -1958.7434, z = 44.7564}
    },

    testing = false -- if you're adding zones above and want to enable the blips on the map to see where the zone is then turn this on, otherwise turn it off.
}
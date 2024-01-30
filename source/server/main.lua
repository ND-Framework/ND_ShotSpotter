-- For support join my discord: https://discord.gg/Z9Mxu72zZ6

lib.versionCheck('ND-Framework/ND_ShotSpotter')

RegisterNetEvent("ND_ShotSpotter:Trigger", function(street, pedCoords, postal, zoneName)
    local mdt = exports["ND_MDT"]
    local location = ""

    if postal then location = postal .. ' ' .. street .. ', ' .. zoneName
    else location = street .. ', ' .. zoneName end

    mdt:createDispatch({
        location = location, 
        callDescription = "Shots fired",
        coords = vec3(pedCoords.x, pedCoords.y, pedCoords.z)
    })
end)

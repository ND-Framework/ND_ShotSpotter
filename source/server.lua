-- For support join my discord: https://discord.gg/Z9Mxu72zZ6

NDCore.Functions.VersionChecker("ND_ShotSpotter", GetCurrentResourceName(), "https://github.com/ND-Framework/ND_ShotSpotter", "https://raw.githubusercontent.com/ND-Framework/ND_ShotSpotter/main/fxmanifest.lua")

RegisterNetEvent("ND_ShotSpotter:Trigger", function(street, pedCoords, postal, zoneName)
    if server_config.discordWebhook then
        local embed = {
            {
                title = "ShotSpotter Alert",
                description = "Gunshots detected on " .. zoneName .. ", " .. street .. "." ,
                fields = {
                    {
                        name = "Location:",
                        value = zoneName .. ", **" .. street .. "**"
                    }
                },
                footer = {
                    icon_url = "https://i.imgur.com/notBtrZ.png",
                    text = "Created by Andyyy#7666"
                },
                thumbnail = {
                    url = "https://i.imgur.com/BTbxJZu.png"
                },
                color = 16722976
            }
        }
        if postal then
            embed[1].description = "Gunshots detected on " .. zoneName .. ", " .. street .. " (" .. postal .. ")."
            embed[1].fields[2] = {
                name = "Postal:",
                value = postal
            }
        end
        PerformHttpRequest(server_config.discordWebhook, function(err, text, headers) end, 'POST', json.encode({username = "ND Shotspotter", embeds = embed}), {["Content-Type"] = "application/json"})
    end
    TriggerClientEvent("ND_ShotSpotter:Report", -1, street, pedCoords, postal)
end)

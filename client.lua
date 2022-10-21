local PlayerData, dragStatus = {}, {}
dragStatus.isDragged = false

QBCore = nil
Citizen.CreateThread(function()
    while QBCore == nil do
        TriggerEvent('QBCore:GetObject', function(obj) QBCore = obj end)
        Citizen.Wait(200)
    end
	PlayerData = QBCore.Functions.GetPlayerData()

end)

RegisterNetEvent('QBCore:Client:OnPlayerLoaded')
AddEventHandler('QBCore:Client:OnPlayerLoaded', function()
    PlayerData = QBCore.Functions.GetPlayerData()
end)

RegisterNetEvent('QBCore:Client:OnJobUpdate')
AddEventHandler('QBCore:Client:OnJobUpdate', function(job)
	PlayerData.job = job
end)

local coreLoaded = false




RegisterNetEvent("snr:toggleFreeMenu")
AddEventHandler("snr:toggleFreeMenu", function(state)
	SetNuiFocus(state, state)
	SendNUIMessage({type = "toggleshow", enable = state})
end)

RegisterNetEvent("snr:setTimeout")
AddEventHandler("snr:setTimeout", function(t)
	SendNUIMessage({type = "settimeout", timeout = tonumber(t * 1000)})
end)


RegisterNUICallback("hidemenu", function(data, cb)
	TriggerEvent("snr:toggleFreeMenu", false)
end)

local delaycollect = false
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(30000)
        delaycollect = false
    end
end)


RegisterNUICallback("collect", function(data, cb)
	if not delaycollect then
        if PlayerData.job and PlayerData.job.name ~= 'unemployed' and PlayerData.job.name == "police" then
		delaycollect = true
		TriggerServerEvent("snr:collect", data.t)
        else
            if PlayerData.job and PlayerData.job.name ~= 'unemployed' and PlayerData.job.name == "ambulance" then
                delaycollect = true
                TriggerServerEvent("snr:collect", data.t)
            else
                if PlayerData.job and PlayerData.job.name ~= 'unemployed' and PlayerData.job.name == "adalet" then
                    TriggerServerEvent("snr:collect", data.t)
                    delaycollect = true
                else
                    if PlayerData.job and PlayerData.job.name ~= 'unemployed' and PlayerData.job.name == "yikamaci" then
                        TriggerServerEvent("snr:collect", data.t)
                        delaycollect = true
                    else
                        if PlayerData.job and PlayerData.job.name ~= 'unemployed' and PlayerData.job.name == "unicorn" then
                            TriggerServerEvent("snr:collect", data.t)
                            delaycollect = true
                        else
                            if PlayerData.job and PlayerData.job.name ~= 'unemployed' and PlayerData.job.name == "teq" then
                                TriggerServerEvent("snr:collect", data.t)
                                delaycollect = true
                            else
                                if PlayerData.job and PlayerData.job.name ~= 'unemployed' and PlayerData.job.name == "limeys" then
                                    TriggerServerEvent("snr:collect", data.t)
                                    delaycollect = true
                                else
                                    if PlayerData.job and PlayerData.job.name ~= 'unemployed' and PlayerData.job.name == "nightclub" then
                                        TriggerServerEvent("snr:collect", data.t)
                                        delaycollect = true
                                    else
                                        if PlayerData.job and PlayerData.job.name ~= 'unemployed' and PlayerData.job.name == "yellowjack" then
                                            TriggerServerEvent("snr:collect", data.t)
                                            delaycollect = true
                                        else
                                            if PlayerData.job and PlayerData.job.name ~= 'unemployed' and PlayerData.job.name == "nakliyeci" then
                                                TriggerServerEvent("snr:collect", data.t)
                                                delaycollect = true
                                            else
                                                if PlayerData.job and PlayerData.job.name ~= 'unemployed' and PlayerData.job.name == "burger" then
                                                    TriggerServerEvent("snr:collect", data.t)
                                                    delaycollect = true
                                                else
                                                    if PlayerData.job and PlayerData.job.name ~= 'unemployed' and PlayerData.job.name == "marketci" then
                                                        TriggerServerEvent("snr:collect", data.t)
                                                        delaycollect = true
                                                    else
                                                        if PlayerData.job and PlayerData.job.name ~= 'unemployed' and PlayerData.job.name == "uwucafe" then
                                                            TriggerServerEvent("snr:collect", data.t)
                                                            delaycollect = true
                                                        else
                                                            if PlayerData.job and PlayerData.job.name ~= 'unemployed' and PlayerData.job.name == "avukat" then
                                                                TriggerServerEvent("snr:collect", data.t)
                                                                delaycollect = true
                                                            else
                                                                if PlayerData.job and PlayerData.job.name ~= 'unemployed' and PlayerData.job.name == "kahve" then
                                                                    TriggerServerEvent("snr:collect", data.t)
                                                                    delaycollect = true
                                                                else
                                                                    if PlayerData.job and PlayerData.job.name ~= 'unemployed' and PlayerData.job.name == "fightclub" then
                                                                        TriggerServerEvent("snr:collect", data.t)
                                                                        delaycollect = true
                                                                    else
                                                                        if PlayerData.job and PlayerData.job.name ~= 'unemployed' and PlayerData.job.name == "diner" then
                                                                            TriggerServerEvent("snr:collect", data.t)
                                                                            delaycollect = true
                                                                        else
                                                                            if PlayerData.job and PlayerData.job.name ~= 'unemployed' and PlayerData.job.name == "news" then
                                                                                TriggerServerEvent("snr:collect", data.t)
                                                                                delaycollect = true
                                                                            else
                                                                                if PlayerData.job and PlayerData.job.name ~= 'unemployed' and PlayerData.job.name == "freq" then
                                                                                    TriggerServerEvent("snr:collect", data.t)
                                                                                    delaycollect = true
                                                                                else
                                                                                    if PlayerData.job and PlayerData.job.name ~= 'unemployed' and PlayerData.job.name == "bahama" then
                                                                                        TriggerServerEvent("snr:collect", data.t)
                                                                                        delaycollect = true
                                                                                    else
                                                                                        if PlayerData.job and PlayerData.job.name ~= 'unemployed' and PlayerData.job.name == "taksi" then
                                                                                            TriggerServerEvent("snr:taksi", data.t)
                                                                                            delaycollect = true
                                                                                        else
                                                                                            if PlayerData.job and PlayerData.job.name == "unemployed" then
                                                                                                TriggerServerEvent("snr:issizpust", data.t)
                                                                                                delaycollect = true
                                                                                            else
                                                                                                if PlayerData.job and PlayerData.job.name ~= 'unemployed' and PlayerData.job.name == "blackmarket" then
                                                                                                    TriggerServerEvent("snr:collect", data.t)
                                                                                                    delaycollect = true
                                                                                                else
                                                                                                    QBCore.Functions.Notify('Devlet çalışanı olmadığın için maaş alamazsın.', 'error', 7500)
                                                                                                end
                                                                                            end
                                                                                        end
                                                                                    end 
                                                                                end 
                                                                            end
                                                                        end
                                                                    end
                                                                end
                                                            end
                                                        end
                                                    end
                                                end
                                            end
                                        end
                                    end
                                end
                            end
                        end
                    end
                end
            end
        end
	else
	end
end)





AddEventHandler('QBCore:Client:OnPlayerLoaded', function(xPlayer)
	TriggerServerEvent("snr:updateTimeout")
end)

RegisterNetEvent("snr:toggleFreeMenu")
AddEventHandler("snr:toggleFreeMenu", function(state)
	SetNuiFocus(state, state)
	SendNUIMessage({type = "toggleshow", enable = state})
end)



Citizen.CreateThread(function(source)
    while true do
		Citizen.Wait(0)
        for k,v in pairs(Config.neredelanbu) do
		local coords = GetEntityCoords(PlayerPedId())
	if GetDistanceBetweenCoords(coords, v.x, v.y, v.z, true) < 2 then

        if IsControlJustPressed(1, 51) then
			TriggerEvent("snr:toggleFreeMenu", source, true)
        end

        if IsControlJustPressed(1, 322) then
            SetNuiFocus(false, false)
            SendNUIMessage({type = 'close'})
        end
    
    end
        end

    end

end)


local NPC = {
	{
        ["aktif"] = true,
        ["kordinat"] = vector3(253.2352, 216.4403, 106.28-1),
        ["npc"] = {
            ["yazi"] = "Devlet Memuru",
            ["h"] = 342.9,
            ["npc-hash"] = 0x2930C1AB,
            ["blip"] = false
        },
        }
}


Citizen.CreateThread(function()
    for i=1, #NPC do
        if NPC[i]["aktif"] then
            if NPC[i]["npc"]["blip"] then -- Blip  
                local dataBlip = NPC[i]["npc"]["blip"]
                local blip = AddBlipForCoord(NPC[i]["kordinat"])
                SetBlipSprite(blip, dataBlip["sprite"])
                SetBlipScale(blip, dataBlip["scale"])
                SetBlipColour(blip, dataBlip["colour"])
                SetBlipAsShortRange(blip, true)

                BeginTextCommandSetBlipName('STRING')
                AddTextComponentSubstringPlayerName(dataBlip["yazi"])
                EndTextCommandSetBlipName(blip)
            end   

            if NPC[i]["aktif"] then  
                exports["tgiann-base"]:pedcreate("snr-devlet"..i, NPC[i]["npc"]["npc-hash"], NPC[i]["kordinat"].x, NPC[i]["kordinat"].y, NPC[i]["kordinat"].z,  NPC[i]["npc"].h)
            end

        end
    end
end)
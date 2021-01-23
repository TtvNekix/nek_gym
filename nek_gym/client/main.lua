local Keys = {
  ["ESC"] = 322, ["F1"] = 288, ["F2"] = 289, ["F3"] = 170, ["F5"] = 166, ["F6"] = 167, ["F7"] = 168, ["F8"] = 169, ["F9"] = 56, ["F10"] = 57, 
  ["~"] = 243, ["1"] = 157, ["2"] = 158, ["3"] = 160, ["4"] = 164, ["5"] = 165, ["6"] = 159, ["7"] = 161, ["8"] = 162, ["9"] = 163, ["-"] = 84, ["="] = 83, ["BACKSPACE"] = 177, 
  ["TAB"] = 37, ["Q"] = 44, ["W"] = 32, ["E"] = 38, ["R"] = 45, ["T"] = 245, ["Y"] = 246, ["U"] = 303, ["P"] = 199, ["["] = 39, ["]"] = 40, ["ENTER"] = 18,
  ["CAPS"] = 137, ["A"] = 34, ["S"] = 8, ["D"] = 9, ["F"] = 23, ["G"] = 47, ["H"] = 74, ["K"] = 311, ["L"] = 182,
  ["LEFTSHIFT"] = 21, ["Z"] = 20, ["X"] = 73, ["C"] = 26, ["V"] = 0, ["B"] = 29, ["N"] = 249, ["M"] = 244, [","] = 82, ["."] = 81,
  ["LEFTCTRL"] = 36, ["LEFTALT"] = 19, ["SPACE"] = 22, ["RIGHTCTRL"] = 70, 
  ["HOME"] = 213, ["PAGEUP"] = 10, ["PAGEDOWN"] = 11, ["DELETE"] = 178,
  ["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173,
  ["NENTER"] = 201, ["N4"] = 108, ["N5"] = 60, ["N6"] = 107, ["N+"] = 96, ["N-"] = 97, ["N7"] = 117, ["N8"] = 61, ["N9"] = 118
}

local arms = { {x = -1202.9837,y = -1565.1718,z = 4.6115} }
local pushup = { {x = -1203.3242,y = -1570.6184,z = 4.6115} }
local yoga = { {x = -1204.7958,y = -1560.1906,z = 4.6115} }
local situps = { {x = -1206.1055,y = -1565.1589,z = 4.6115} }
local gym = { {x = -1195.6551,y = -1577.7689,z = 4.6115} }
local chins = { {x = -1200.1284,y = -1570.9903,z = 4.6115} }

ESX = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end

	blip = AddBlipForCoord(-1201.2257, -1568.8670, 4.6101)
	SetBlipSprite(blip, 311)
	SetBlipDisplay(blip, 4)
	SetBlipScale(blip, 0.6)
	SetBlipColour(blip, 7)
	SetBlipAsShortRange(blip, true)
	BeginTextCommandSetBlipName("STRING")
	AddTextComponentString("Gym")

end)

DrawText3D = function(x, y, z, text)
	SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(true)
    AddTextComponentString(text)
    SetDrawOrigin(x,y,z, 0)
    DrawText(0.0, 0.0)
    local factor = (string.len(text)) / 370
    DrawRect(0.0, 0.0+0.0125, 0.017+ factor, 0.03, 0, 0, 0, 75)
    ClearDrawOrigin()
end

Citizen.CreateThread(function()
	while true do
		local time = 1000
		local plyCoords = GetEntityCoords(PlayerPedId(), false)
			if GetDistanceBetweenCoords(-1202.09, -1567.54, 4.61, plyCoords.x, plyCoords.y, plyCoords.z) < 20 then
				time = 0
				DrawMarker(3, -1202.9837, -1565.1718, 4.6115, 0, 0, 0, 0, 0, 0, 0.301, 0.301, 0.3001, 0, 255, 50, 200, 0, 0, 0, 1)
				DrawMarker(3, -1203.3242, -1570.6184, 4.6115, 0, 0, 0, 0, 0, 0, 0.301, 0.301, 0.3001, 0, 255, 50, 200, 0, 0, 0, 1)
				DrawMarker(3, -1204.7958, -1560.1906, 4.6115, 0, 0, 0, 0, 0, 0, 0.301, 0.301, 0.3001, 0, 255, 50, 200, 0, 0, 0, 1)
				DrawMarker(3, -1206.1055, -1565.1589, 4.6115, 0, 0, 0, 0, 0, 0, 0.301, 0.301, 0.3001, 0, 255, 50, 200, 0, 0, 0, 1)
				DrawMarker(3, -1195.6551, -1577.7689, 4.6115, 0, 0, 0, 0, 0, 0, 0.301, 0.301, 0.3001, 0, 153, 255, 255, 0, 0, 0, 1)
				DrawMarker(3, -1200.1284, -1570.9903, 4.6115, 0, 0, 0, 0, 0, 0, 0.301, 0.301, 0.3001, 0, 255, 50, 200, 0, 0, 0, 1)
			end

        for k in pairs(gym) do
		
            local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, gym[k].x, gym[k].y, gym[k].z)

            if dist <= 0.5 then
				DrawText3D(gym[k].x, gym[k].y, gym[k].z, 'Presiona [E] para abrir la ~b~tienda del gimnasio~w~')
				
				if IsControlJustPressed(0, Keys['E']) then
					OpenGymShopMenu()
				end			
            end
		end
		for k in pairs(arms) do

            local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, arms[k].x, arms[k].y, arms[k].z)

            if dist <= 0.5 then
				DrawText3D(arms[k].x, arms[k].y, arms[k].z, 'Presiona [E] para hacer ~g~brazos')
				
				if IsControlJustPressed(0, Keys['E']) then
					
						ESX.ShowNotification("Preparando el ~g~ejercicio~w~...")
						Citizen.Wait(1000)					
					
							local playerPed = PlayerPedId()
							TaskStartScenarioInPlace(playerPed, "world_human_muscle_free_weights", 0, true)
							Citizen.Wait(30000)
							exports["gamz-skillsystem"]:UpdateSkill("Strength", 2)
							ClearPedTasksImmediately(playerPed)
				end			
            end
		end
		for k in pairs(chins) do

            local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, chins[k].x, chins[k].y, chins[k].z)

            if dist <= 0.5 then
				DrawText3D(chins[k].x, chins[k].y, chins[k].z, 'Presiona [E] para hacer ~g~abdominales')
				
				if IsControlJustPressed(0, Keys['E']) then
					
						ESX.ShowNotification("Preparando el ~g~ejercicio~w~...")
						Citizen.Wait(1000)					
							local playerPed = PlayerPedId()
							TaskStartScenarioInPlace(playerPed, "prop_human_muscle_chin_ups", 0, true)
							Citizen.Wait(30000)
							exports["gamz-skillsystem"]:UpdateSkill("Strength", 2)
							exports["gamz-skillsystem"]:UpdateSkill("Capacidad Pulmonar", 0.5)
							ClearPedTasksImmediately(playerPed)
				end			
            end
		end
		for k in pairs(pushup) do

            local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, pushup[k].x, pushup[k].y, pushup[k].z)

            if dist <= 0.5 then
				DrawText3D(pushup[k].x, pushup[k].y, pushup[k].z, 'Presiona [E] para hacer ~g~flexiones')
				
				if IsControlJustPressed(0, Keys['E']) then
					
						ESX.ShowNotification("Preparando el  ~g~ejercicio~w~...")
						Citizen.Wait(1000)					
									
							local playerPed = PlayerPedId()
							TaskStartScenarioInPlace(playerPed, "world_human_push_ups", 0, true)
							Citizen.Wait(30000)
							exports["gamz-skillsystem"]:UpdateSkill("Strength", 2)
							exports["gamz-skillsystem"]:UpdateSkill("Stamina", 1)
							ClearPedTasksImmediately(playerPed)
				end			
            end
		end
		for k in pairs(yoga) do

            local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, yoga[k].x, yoga[k].y, yoga[k].z)

            if dist <= 0.5 then
				DrawText3D(yoga[k].x, yoga[k].y, yoga[k].z, 'Presiona [E] para hacer ~g~yoga')
				
				if IsControlJustPressed(0, Keys['E']) then
					
						ESX.ShowNotification("Preparando el ~g~ejercicio~w~...")
						Citizen.Wait(1000)						
						local playerPed = PlayerPedId()
						TaskStartScenarioInPlace(playerPed, "world_human_yoga", 0, true)
						Citizen.Wait(30000)
						exports["gamz-skillsystem"]:UpdateSkill("Lung Capacity", 1)
						ClearPedTasksImmediately(playerPed)
				end			
            end
		end
		for k in pairs(situps) do

            local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, situps[k].x, situps[k].y, situps[k].z)

            if dist <= 0.5 then
				DrawText3D(situps[k].x, situps[k].y, situps[k].z, "Presiona [E] para hacer ~g~flexiones")
				
				if IsControlJustPressed(0, Keys['E']) then

						ESX.ShowNotification("Preparando el ~g~ejercicio~w~...")
						Citizen.Wait(1000)					
					
							local playerPed = PlayerPedId()
							TaskStartScenarioInPlace(playerPed, "world_human_sit_ups", 0, true)
							Citizen.Wait(30000)
							exports["gamz-skillsystem"]:UpdateSkill("Strength", 2)
							ClearPedTasksImmediately(playerPed)
				end			
            end
        end
			Citizen.Wait(time)
    end
end)

OpenGymShopMenu = function()
    ESX.UI.Menu.CloseAll()

    ESX.UI.Menu.Open(
        'default', GetCurrentResourceName(), 'gym_shop_menu',
        {
            title    = 'Gimnasio - Tienda',
            elements = {
				{label = 'Protein Shake ($6)', value = 'protein_shake'},
				{label = 'Sportlunch ($2)', value = 'sportlunch'},
				{label = 'Powerade ($4)', value = 'powerade'},
            }
        },
        function(data, menu)
            if data.current.value == 'protein_shake' then
				TriggerServerEvent('nek_gym:addItem', data.current.value)
            elseif data.current.value == 'sportlunch' then
				TriggerServerEvent('nek_gym:addItem', data.current.value)
            elseif data.current.value == 'powerade' then
				TriggerServerEvent('nek_gym:addItem', data.current.value)
            end
        end,
        function(data, menu)
            menu.close()
        end
    )
end


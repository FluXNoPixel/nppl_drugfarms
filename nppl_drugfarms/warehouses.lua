ESX                 = nil
local PlayerData    = {}
local weedkeysQTE = 0
local methkeysQTE = 0
local cokekeysQTE = 0
local opiumkeysQTE = 0

Citizen.CreateThread(function ()
  while ESX == nil do
    TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
    Citizen.Wait(0)
 	PlayerData = ESX.GetPlayerData()
  end
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
  PlayerData = xPlayer
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
  PlayerData.job = job
end)

Citizen.CreateThread(function()
	while true do
		Wait(0)
		
		local playerCoords = GetEntityCoords(GetPlayerPed(-1), true)
		local playerPed = GetPlayerPed(-1)
		local coords    = GetEntityCoords(playerPed)
		-- Weed check 
		if GetDistanceBetweenCoords(coords, 2308.96, 4885.97, 41.81, true) < 20.0 then
			DrawMarker(27, 2308.96,4885.97,41.81-0.95, 0, 0, 0, 0, 0, 0, 2.0, 2.0, 2.0, 13, 232, 255, 155, 0, 0, 2, 0, 0, 0, 0)
		end
		if GetDistanceBetweenCoords(playerCoords.x, playerCoords.y, playerCoords.z, 2308.96,4885.97,41.81, true) <= 1.5 then
			if IsControlJustPressed(0, 38) then -- uses 'E' to interact
				loadWeed()
			end
		end 

		-- Launder check 
		if GetDistanceBetweenCoords(coords, 190.17,2456.9,55.7, true) < 20.0 then
			DrawMarker(1, 190.17,2456.9,55.7-1.0, 0, 0, 0, 0, 0, 0, 2.0, 3.0, 2.0, 13, 232, 255, 155, 0, 0, 2, 0, 0, 0, 0)
		end
		if GetDistanceBetweenCoords(playerCoords.x, playerCoords.y, playerCoords.z, 190.17,2456.9,55.7-1.0, true) <= 5.0 then
			if IsControlJustPressed(0, 38) then
				loadLaunder()
			end
		end	

		-- Meth check 
		if GetDistanceBetweenCoords(coords, 511.49, -1951.14, 24.99, true) < 20.0 then
			DrawMarker(27, 511.49,-1951.14,24.99-0.97, 0, 0, 0, 0, 0, 0, 2.0, 2.0, 2.0, 13, 232, 255, 155, 0, 0, 2, 0, 0, 0, 0)
		end
		if GetDistanceBetweenCoords(playerCoords.x, playerCoords.y, playerCoords.z, 511.49,-1951.14,24.99, true) <= 1.5 then
			if IsControlJustPressed(0, 38) then
				loadMeth()
			end
		end	

		-- Coke check 
		if GetDistanceBetweenCoords(coords, 221.72, 111.78, 93.47, true) < 20.0 then
			DrawMarker(27, 221.72,111.78,93.47-1.0001, 0, 0, 0, 0, 0, 0, 2.0, 2.0, 2.0, 13, 232, 255, 155, 0, 0, 2, 0, 0, 0, 0)
		end
		if GetDistanceBetweenCoords(playerCoords.x, playerCoords.y, playerCoords.z, 221.72,111.78,93.47, true) <= 1.5 then
			if IsControlJustPressed(0, 38) then
				loadCoke()
			end 
		end	

		-- Biker check  
		if GetDistanceBetweenCoords(coords, -1320.64, -1263.76, 4.59, true) < 20.0 then
			DrawMarker(27, -1320.64,-1263.76,4.59-1.0001, 0, 0, 0, 0, 0, 0, 2.0, 2.0, 2.0, 13, 232, 255, 155, 0, 0, 2, 0, 0, 0, 0)
		end
		if GetDistanceBetweenCoords(playerCoords.x, playerCoords.y, playerCoords.z, -1320.64,-1263.76,4.59, true) <= 1.5 then
			if IsControlJustPressed(0, 38) then
					loadBiker()
			end
		end	

		-- weed exit 
		if GetDistanceBetweenCoords(coords, 1065.430, -3182.969, -39.163, true) < 20.0 then
			DrawMarker(27, 1065.430, -3182.969, -39.163-0.95, 0, 0, 0, 0, 0, 0, 2.0, 2.0, 2.0, 13, 232, 255, 155, 0, 0, 2, 0, 0, 0, 0)
		end
		if GetDistanceBetweenCoords(playerCoords.x, playerCoords.y, playerCoords.z, 1065.430, -3182.969, -39.163, true) <= 5.0 then
			if IsControlJustPressed(0, 38) then
				DoScreenFadeOut(1000)
				Citizen.Wait(1500)
				
				SetEntityCoords(GetPlayerPed(-1), 2307.67,4887.68,41.81)
				
				Citizen.Wait(1000)
				DoScreenFadeIn(1000)
			end
		end
		
		-- coke exit 
		if GetDistanceBetweenCoords(coords, 1088.803, -3188.257, -38.993, true) < 20.0 then
			DrawMarker(27, 1088.803, -3188.257, -38.993-0.95, 0, 0, 0, 0, 0, 0, 2.0, 2.0, 2.0, 13, 232, 255, 155, 0, 0, 2, 0, 0, 0, 0)
		end
		if GetDistanceBetweenCoords(playerCoords.x, playerCoords.y, playerCoords.z, 1088.803, -3188.257, -38.993, true) <= 1.5 then
			if IsControlJustPressed(0, 38) then
				DoScreenFadeOut(1000)
				Citizen.Wait(1500)

				SetEntityCoords(GetPlayerPed(-1), 221.72,111.78,93.47)
				Citizen.Wait(1000)
				DoScreenFadeIn(1000)
			end
		end
		
		-- meth exit
		if GetDistanceBetweenCoords(coords, 996.933, -3200.605, -36.394, true) < 20.0 then
			DrawMarker(27, 996.933, -3200.605, -36.394-0.95, 0, 0, 0, 0, 0, 0, 2.0, 2.0, 2.0, 13, 232, 255, 155, 0, 0, 2, 0, 0, 0, 0)
		end
		if GetDistanceBetweenCoords(playerCoords.x, playerCoords.y, playerCoords.z, 996.933, -3200.605, -36.394, true) <= 1.5 then
			if IsControlJustPressed(0, 38) then
				DoScreenFadeOut(1000) 
				Citizen.Wait(1500)
				
				SetEntityCoords(GetPlayerPed(-1), 513.02,-1950.66,24.99)
				Citizen.Wait(1000)
				DoScreenFadeIn(1000)
			end
		end	 
		
		-- launder exit
	
	if GetDistanceBetweenCoords(playerCoords.x, playerCoords.y, playerCoords.z, 190.17, 2456.9, 55.7, true) <= 2.0 then
			if IsControlJustPressed(0, 38) then
				DoScreenFadeOut(1000)
				Citizen.Wait(1500)

				SetEntityCoords(GetPlayerPed(-1), 190.17,2456.9,55.7, 125.059)
				Citizen.Wait(1000)
				DoScreenFadeIn(1000)				
			end
		end	
		-- biker exit 
	if GetDistanceBetweenCoords(coords, 996.88189697266, -3157.9697265625, -38.907146453858, true) < 20.0 then
		DrawMarker(27, 996.88189697266,-3157.9697265625,-38.907146453858-0.95, 0, 0, 0, 0, 0, 0, 2.0, 2.0, 2.0, 13, 232, 255, 155, 0, 0, 2, 0, 0, 0, 0)
	end
	if GetDistanceBetweenCoords(playerCoords.x, playerCoords.y, playerCoords.z, 996.88189697266,-3157.9697265625,-38.907146453858, true) <= 2.0 then
			if IsControlJustPressed(0, 38) then
				DoScreenFadeOut(1000) 
				Citizen.Wait(1500) 

				SetEntityCoords(GetPlayerPed(-1), 964.48321533204, -1027.0417480468, 40.847507476806-1.0)
				Citizen.Wait(1000)
				DoScreenFadeIn(1000)				
			end
		end 
	end
end)

function loadWeed()
		local ped = GetPlayerPed(-1)
		local playerCoords = GetEntityCoords(GetPlayerPed(-1), true)
		DoScreenFadeOut(1000)
		Citizen.Wait(1500)
		SetEntityCoords(GetPlayerPed(-1), 1063.445, -3183.618, -39.164)
		DoScreenFadeIn(1000)
end


function loadLaunder()
		local ped = GetPlayerPed(-1)
		local playerCoords = GetEntityCoords(GetPlayerPed(-1), true)
		DoScreenFadeOut(1000)
		Citizen.Wait(1500)
		SetEntityCoords(GetPlayerPed(-1), 1118.683, -3193.319, -40.391)
		DoScreenFadeIn(1000)
end

function loadMeth()
		local ped = GetPlayerPed(-1)
		local playerCoords = GetEntityCoords(GetPlayerPed(-1), true)
		DoScreenFadeOut(1000)
		Citizen.Wait(1500)
		SetEntityCoords(GetPlayerPed(-1), 996.8969116211,-3200.6459960938,-36.39372253418)
		DoScreenFadeIn(1000)
end

function loadCoke()
		local ped = GetPlayerPed(-1)
		local playerCoords = GetEntityCoords(GetPlayerPed(-1), true)
		DoScreenFadeOut(1000)
		Citizen.Wait(1500)
		SetEntityCoords(GetPlayerPed(-1), 1088.803, -3188.257, -38.993)
		DoScreenFadeIn(1000)
end

function loadBiker()
		local ped = GetPlayerPed(-1)
		local playerCoords = GetEntityCoords(GetPlayerPed(-1), true)
		DoScreenFadeOut(1000)
		Citizen.Wait(1500)
		SetEntityCoords(GetPlayerPed(-1), 996.97509765625,-3157.9213867188,-38.907146453858)
		DoScreenFadeIn(1000)
end
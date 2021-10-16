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

local PlayerData                = {}
local GUI                       = {}
local HasAlreadyEnteredMarker   = false
local LastStation               = nil
local LastPart                  = nil
local LastPartNum               = nil
local LastEntity                = nil
local CurrentAction             = nil
local CurrentActionMsg          = ''
local CurrentActionData         = {}
local Licenses          = {}

ESX                             = nil
GUI.Time                        = 0

Citizen.CreateThread(function()
  while ESX == nil do
    TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
    Citizen.Wait(0)
  end
end)

function OpenCloakroomMenu()
  -- Para ponerlo para todos
  --[[local elements = {
    {label = _U('citizen_wear'), value = 'citizen_wear'},
    {label = _U('sam'), value = 'sam'}
  }]]
  local ownedLicenses = {}

	for i=1, #Licenses, 1 do
		ownedLicenses[Licenses[i].type] = true
	end

	local elements = {}

	if ownedLicenses['vip'] then
    table.insert(elements, {label = _U('citizen_wear'), value = 'citizen_wear'})
    --table.insert(elements, {label = _U('sam'), value = 'sam'})
    --table.insert(elements, {label = _U('lana'), value = 'lana'})
    --table.insert(elements, {label = _U('fergie'), value = 'fergie'})
    --table.insert(elements, {label = _U('scofield'), value = 'scofield'})
    --table.insert(elements, {label = _U('arnold'), value = 'arnold'})
    table.insert(elements, {label = _U('dante'), value = 'dante'})
    --table.insert(elements, {label = _U('willsmith'), value = 'willsmith'})
    table.insert(elements, {label = _U('ig_tommy'), value = 'ig_tommy'})
    table.insert(elements, {label = _U('mbappe'), value = 'mbappe'})
    table.insert(elements, {label = _U('s_m_m_fiboffice_01'), value = 's_m_m_fiboffice_01'})
    table.insert(elements, {label = _U('s_m_m_fiboffice_02'), value = 's_m_m_fiboffice_02'})
    table.insert(elements, {label = _U('u_m_m_filmdirector'), value = 'u_m_m_filmdirector'})
    table.insert(elements, {label = _U('u_m_o_finguru_01'), value = 'u_m_o_finguru_01'})
    table.insert(elements, {label = _U('s_m_y_fireman_01'), value = 's_m_y_fireman_01'})
    table.insert(elements, {label = _U('a_f_y_fitness_01'), value = 'a_f_y_fitness_01'})
    table.insert(elements, {label = _U('a_f_y_fitness_02'), value = 'a_f_y_fitness_02'})
  end

  ESX.UI.Menu.CloseAll()

    ESX.UI.Menu.Open(
      'default', GetCurrentResourceName(), 'cloakroom',
      {
        title    = _U('cloakroom'),
        align    = 'top-left',
        elements = elements,
        },

        function(data, menu)

      menu.close()

      --Taken from SuperCoolNinja
      if data.current.value == 'citizen_wear' then
        ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jobSkin)
          local model = nil

            model = GetHashKey("mp_m_freemode_01")

          RequestModel(model)
          while not HasModelLoaded(model) do
            RequestModel(model)
            Citizen.Wait(1)
          end

          SetPlayerModel(PlayerId(), model)
          SetModelAsNoLongerNeeded(model)

          TriggerEvent('skinchanger:loadSkin', skin)
          TriggerEvent('esx:restoreLoadout')
        end)
      else
        ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jobSkin)

          local model = nil
  
			    --if skin.sex == 0 then
            if data.current.value == 'sam' then
			        model = GetHashKey("sam")-------------editar
            elseif data.current.value == 'lana' then
              model = GetHashKey("lana")
            elseif data.current.value == 'fergie' then
              model = GetHashKey("fergie")
            elseif data.current.value == 'scofield' then
              model = GetHashKey("scofield")
            elseif data.current.value == 'arnold' then
              model = GetHashKey("arnold")
            elseif data.current.value == 'dante' then
              model = GetHashKey("dante")
            elseif data.current.value == 'willsmith' then
              model = GetHashKey("willsmith")
            elseif data.current.value == 'mbappe' then
              model = GetHashKey("mbappe")
            elseif data.current.vale == 's_m_m_fiboffice_01' then
              model = GetHashKey("s_m_m_fiboffice_01")
            elseif data.current.value == 's_m_m_fiboffice_02' then
              model = GetHashKey("s_m_m_fiboffice_02")
            elseif data.current.value == 'u_m_m_filmdirector' then
              model = GetHashKey("u_m_m_filmdirector")
            elseif data.current.value == 'u_m_o_finguru_01' then
              model = GetHashKey("u_m_o_finguru_01")
            elseif data.current.value == 's_m_y_fireman_01' then
              model = GetHashKey("s_m_y_fireman_01")
            elseif data.current.value == 'a_f_y_fitness_01' then
              model = GetHashKey("a_f_y_fitness_01")
            elseif data.current.value == 'a_f_y_fitness_02' then
              model = GetHashKey("a_f_y_fitness_02")
            end

			    --else
			      --model = GetHashKey("sam")-------------editar
			    --end
  
			    RequestModel(model)
			    while not HasModelLoaded(model) do
			      RequestModel(model)
			      Citizen.Wait(1)
			    end
  
			    SetPlayerModel(PlayerId(), model)
			    SetModelAsNoLongerNeeded(model)
  
			    TriggerEvent('skinchanger:loadSkin', skin)
			    TriggerEvent('esx:restoreLoadout')

        end)

      end

      CurrentAction     = 'menu_cloakroom'
      CurrentActionMsg  = _U('open_cloackroom')
      CurrentActionData = {}

    end,
    function(data, menu)

      menu.close()

      CurrentAction     = 'menu_cloakroom'
      CurrentActionMsg  = _U('open_cloackroom')
      CurrentActionData = {}
    end
  )

end

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
  PlayerData = xPlayer
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
  PlayerData.job = job
end)

RegisterNetEvent('esx_dmvschool:loadLicenses')
AddEventHandler('esx_dmvschool:loadLicenses', function(licenses)
	Licenses = licenses
end)

AddEventHandler('custom_peds:hasEnteredMarker', function(station, part, partNum)

  if part == 'Cloakroom' then
    CurrentAction     = 'menu_cloakroom'
    CurrentActionMsg  = _U('open_cloackroom')
    CurrentActionData = {}
  end

end)

AddEventHandler('custom_peds:hasExitedMarker', function(station, part, partNum)
  ESX.UI.Menu.CloseAll()
  CurrentAction = nil
end)

AddEventHandler('custom_peds:hasEnteredEntityZone', function(entity)

  local playerPed = GetPlayerPed(-1)

  if GetEntityModel(entity) == GetHashKey('p_ld_stinger_s') then

    local playerPed = GetPlayerPed(-1)
    local coords    = GetEntityCoords(playerPed)

    if IsPedInAnyVehicle(playerPed,  false) then

      local vehicle = GetVehiclePedIsIn(playerPed)

      for i=0, 7, 1 do
        SetVehicleTyreBurst(vehicle,  i,  true,  1000)
      end

    end

  end

end)

AddEventHandler('custom_peds:hasExitedEntityZone', function(entity)

  if CurrentAction == 'remove_entity' then
    CurrentAction = nil
  end

end)

-- Create blips
Citizen.CreateThread(function()
  for k,v in pairs(Config.CustomPeds) do

    local blip = AddBlipForCoord(v.Blip.Pos.x, v.Blip.Pos.y, v.Blip.Pos.z)

    SetBlipSprite (blip, v.Blip.Sprite)
    SetBlipDisplay(blip, v.Blip.Display)
    SetBlipScale  (blip, v.Blip.Scale)
    SetBlipColour (blip, v.Blip.Colour)
    SetBlipAsShortRange(blip, true)

    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString(_U('map_blip'))
    EndTextCommandSetBlipName(blip)

  end
end)

-- Display markers
Citizen.CreateThread(function()
  while true do

    Wait(0)

    --local ownedLicenses = {}

    --for i=1, #Licenses, 1 do
      --ownedLicenses[Licenses[i].type] = true
    --end
  
    --if ownedLicenses['vip'] then
    
      local playerPed = GetPlayerPed(-1)
      local coords    = GetEntityCoords(playerPed)

      for k,v in pairs(Config.CustomPeds) do

        for i=1, #v.Cloakrooms, 1 do
          if GetDistanceBetweenCoords(coords,  v.Cloakrooms[i].x,  v.Cloakrooms[i].y,  v.Cloakrooms[i].z,  true) < Config.DrawDistance then
            DrawMarker(Config.MarkerType, v.Cloakrooms[i].x, v.Cloakrooms[i].y, v.Cloakrooms[i].z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, Config.MarkerSize.x, Config.MarkerSize.y, Config.MarkerSize.z, Config.MarkerColor.r, Config.MarkerColor.g, Config.MarkerColor.b, 100, false, true, 2, false, false, false, false)
          end
        end
      end
    --end
  end
end)

-- Enter / Exit marker events
Citizen.CreateThread(function()

  while true do

    Wait(0)

    --local ownedLicenses = {}

    --for i=1, #Licenses, 1 do
      --ownedLicenses[Licenses[i].type] = true
    --end
  
    --if ownedLicenses['vip'] then

      local playerPed      = GetPlayerPed(-1)
      local coords         = GetEntityCoords(playerPed)
      local isInMarker     = false
      local currentStation = nil
      local currentPart    = nil
      local currentPartNum = nil

      for k,v in pairs(Config.CustomPeds) do

        for i=1, #v.Cloakrooms, 1 do
          if GetDistanceBetweenCoords(coords,  v.Cloakrooms[i].x,  v.Cloakrooms[i].y,  v.Cloakrooms[i].z,  true) < Config.MarkerSize.x then
            isInMarker     = true
            currentStation = k
            currentPart    = 'Cloakroom'
            currentPartNum = i
          end
        end
      end

      local hasExited = false

      if isInMarker and not HasAlreadyEnteredMarker or (isInMarker and (LastStation ~= currentStation or LastPart ~= currentPart or LastPartNum ~= currentPartNum) ) then

        if
          (LastStation ~= nil and LastPart ~= nil and LastPartNum ~= nil) and
          (LastStation ~= currentStation or LastPart ~= currentPart or LastPartNum ~= currentPartNum)
        then
          TriggerEvent('custom_peds:hasExitedMarker', LastStation, LastPart, LastPartNum)
          hasExited = true
        end

        HasAlreadyEnteredMarker = true
        LastStation             = currentStation
        LastPart                = currentPart
        LastPartNum             = currentPartNum

        TriggerEvent('custom_peds:hasEnteredMarker', currentStation, currentPart, currentPartNum)
      end

      if not hasExited and not isInMarker and HasAlreadyEnteredMarker then

        HasAlreadyEnteredMarker = false

        TriggerEvent('custom_peds:hasExitedMarker', LastStation, LastPart, LastPartNum)
      end
    --end
  end
end)

-- Key Controls
Citizen.CreateThread(function()
  while true do

    Citizen.Wait(0)

    if CurrentAction ~= nil then

      SetTextComponentFormat('STRING')
      AddTextComponentString(CurrentActionMsg)
      DisplayHelpTextFromStringLabel(0, 0, 1, -1)

      if IsControlPressed(0,  Keys['E']) and (GetGameTimer() - GUI.Time) > 150 then

        if CurrentAction == 'menu_cloakroom' then
          OpenCloakroomMenu()
        end

        CurrentAction = nil
        GUI.Time      = GetGameTimer()

      end
    end
  end
end)

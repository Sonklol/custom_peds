<div align="center">
<img src="https://github.com/Sonklol/Automatic-GameServer/blob/main/cap.png?raw=true"/>
</div>
<br>
Script creado de cero por Sonk
Discord: Sonk#2333

## REQUISITOS
es_extended o similar
<br>
esx_license

## PARA METER VIPS
Solo hay que ver el archivo sql.sql y editar AQUI SE PONE EL IDENTIFIER DEL USUARIO como pide
<br>
El menú funciona con esx_license

## PARA METER PEDS AL MENÚ

Entramos al archivo client/cl_main.lua
Vamos a trabajar sobre la  function OpenCloakroomMenu() de la línea 35

Buscamos "if ownedLicenses['vip'] then" (línea 49) y para añadir un ped debajo de esa línea escribimos:
     table.insert(elements, {label = _U('nombre_ped'), value = 'nombre_ped'})

El siguiente paso será copiar de la línea 94-138 y las pondremos justo debajo
      if data.current.value == 'mafia_wear' then

        ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jobSkin)

          if skin.sex == 0 then
            TriggerEvent('skinchanger:loadClothes', skin, jobSkin.skin_male)
          else
            TriggerEvent('skinchanger:loadClothes', skin, jobSkin.skin_female)
          end

        end)

      end

      if data.current.value == 'mafia_wear' then

        ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jobSkin)

        if skin.sex == 0 then

          local model = GetHashKey("G_M_M_ArmBoss_01")

          RequestModel(model)
          while not HasModelLoaded(model) do
            RequestModel(model)
            Citizen.Wait(0)
          end

          SetPlayerModel(PlayerId(), model)
          SetModelAsNoLongerNeeded(model)
      else
          local model = GetHashKey("G_M_M_ArmBoss_01")

          RequestModel(model)
          while not HasModelLoaded(model) do
            RequestModel(model)
            Citizen.Wait(0)
          end

          SetPlayerModel(PlayerId(), model)
          SetModelAsNoLongerNeeded(model)
          end

        end)
      end

En la cual mafia_wear será 'nombre_ped' (antes puesto) y 'G_M_M_ArmBoss_01' será el nombre de nuestro ped descargado.

local QBCore = exports['qb-core']:GetCoreObject()

local sandeyPD = PolyZone:Create({
  vector2(1855.5780029297, 3715.6665039063),
  vector2(1869.5487060547, 3691.9497070313),
  vector2(1845.6706542969, 3677.7521972656),
  vector2(1838.2454833984, 3689.8500976563),
  vector2(1814.8332519531, 3676.6376953125),
  vector2(1807.5723876953, 3687.8139648438)
}, {
  name="sandey pfix",
  --minZ = 33.336406707764,
  --maxZ = 33.974632263184
})


local mrpdd = PolyZone:Create({
  vector2(409.51190185546, -1032.9421386718),
  vector2(409.47610473632, -959.80780029296),
  vector2(494.15768432618, -961.47967529296),
  vector2(491.83029174804, -1024.4572753906)
}, {
  name="mrpdfixcar",
  debugPoly=false
  --minZ = 27.480201721192,
  --maxZ = 29.924489974976
})

local davisdepartment = PolyZone:Create({
  vector2(361.88000488281, -1566.5294189453),
  vector2(339.02420043945, -1600.7395019531),
  vector2(410.92190551758, -1660.6140136719),
  vector2(423.35162353516, -1645.2258300781),
  vector2(423.87152099609, -1632.9893798828),
  vector2(423.15017700195, -1628.1899414063),
  vector2(418.43881225586, -1624.3087158203),
  vector2(393.06433105469, -1603.4250488281),
  vector2(360.83938598633, -1574.8121337891)
}, {
  name="davispfix",
  --minZ = 29.141609191895,
  --maxZ = 29.304542541504
})

local emsmainf = PolyZone:Create({
  vector2(295.88827514648, -552.7124633789),
  vector2(273.46002197266, -611.26281738282),
  vector2(353.3683166504, -637.52111816406),
  vector2(409.51345825196, -545.12408447266)
}, {
  name="emsmain",
  --minZ = 28.604206085206,
  --maxZ = 43.402759552002
  debugPoly=false
})

local apartments = PolyZone:Create({
  vector2(-251.8582458496, -1010.6431884766),
  vector2(-364.11499023438, -969.3433227539),
  vector2(-363.52926635742, -862.64532470704),
  vector2(-207.47663879394, -908.64825439454),
  vector2(-282.66491699218, -918.96392822266),
  vector2(-229.7749633789, -948.62811279296)
}, {
  name="apartmentspolicefixcar",
  --minZ = 29.212438583374,
  --maxZ = 33.67423248291
  debugPoly=false
})

RegisterCommand("pfix", function()
	local mrpdcoords= false
	local emscoords= false
	local apartmentscoords= false
	local davispdcoords = false
  local sandeycoords= false
	local plyPed = PlayerPedId()
	local coord = GetEntityCoords(plyPed)
	mrpdcoords= mrpdd:isPointInside(coord)
  sandeycoords= sandeyPD:isPointInside(coord)
	emscoords= emsmainf:isPointInside(coord)
	apartmentscoords= apartments:isPointInside(coord)
	davispdcoords= davisdepartment:isPointInside(coord)
	if mrpdcoords or emscoords or apartmentscoords or davispdcoords or sandeycoords then
		QBCore.Functions.GetPlayerData(function(PlayerData)
		PlayerJob = PlayerData.job
		if PlayerData.job.name == "police" then
			QBCore.Functions.Progressbar("police_fix", "Fixing car..", 1500, false, true, {
			disableMovement = true,
			disableCarMovement = true,
			disableMouse = false,
			disableCombat = true,
			}, {}, {}, {}, function()
			end, false)
			Citizen.Wait(2000)
			local vehicle = GetVehiclePedIsIn(plyPed, false)
			SetVehicleEngineHealth(vehicle, 9999)
			SetVehiclePetrolTankHealth(vehicle, 9999)
			SetVehicleFixed(vehicle)
		else
		QBCore.Functions.Notify("Only cops can fix", "error", 3000)
		end

		end)
	else
	QBCore.Functions.Notify("Go to an area that supports vehicle repair", "error", 3000)
	end
end, false)
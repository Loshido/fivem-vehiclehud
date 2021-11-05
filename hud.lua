CreateThread(function()
  while true do Wait(0)
      local vehicle = GetVehiclePedIsIn(PlayerPedId()) -- get the vehicle
      if vehicle ~= 0 then
		local fuellvl = GetVehicleFuelLevel(vehicle)      -- get the vehicle fuel level
        local fuelHeight = (0.173 * fuellvl) / 100        -- calcul the size of the bar according to the fuel level
		local rpm = GetVehicleCurrentRpm(vehicle)         -- take the rpm of the vehicle
		local temp = GetVehicleEngineTemperature(vehicle) -- take the temperature of the vehicle

        DrawRect(0.010, 0.885, 0.005, 0.173, 40, 40, 40, 150)  -- Full fuel bar (black)
		if fuellvl > 75 then -- Essence
			DrawRect(0.010, 0.885 + (0.173 - fuelHeight) / 2, 0.005, fuelHeight, 0, 209, 3, 255) -- Green color of the fuel level
		elseif fuellvl > 50 and  fuellvl < 75 then
			DrawRect(0.010, 0.885 + (0.173 - fuelHeight) / 2, 0.005, fuelHeight, 209, 143, 0, 255) -- Orange color of the fuel level
		else
			DrawRect(0.010, 0.885 + (0.173 - fuelHeight) / 2, 0.005, fuelHeight, 141, 33, 0, 255) -- Red / brown color of the fuel level
		end

		if temp > 120 then -- 120° - 100° -- Temperature 
			DrawRect(0.0075, 0.980, 0.010, 0.007, 255, 0, 0, 255)
		elseif temp > 100 and temp <120 then -- 120° - 100°
			DrawRect(0.0075, 0.980, 0.010, 0.007, 255, 77, 0, 255)
		elseif temp < 100 and temp > 80 then -- 100° - 80°
			DrawRect(0.0075, 0.980, 0.010, 0.007, 255, 173, 0, 255)
		end

		if GetVehicleHandbrake(vehicle) then -- Handbrake
			DrawRect(0.0075, 0.990, 0.010, 0.005, 255, 255, 255, 255)
		end

		if IsHornActive(vehicle) then -- Horn
			DrawRect(0.017, 0.985, 0.005, 0.020, 255, 255, 255, 255)
		end

		 DrawRect(0.005,0.885,0.005,0.173,40,40,40,150) -- RPM bar full
		 DrawRect(0.005 ,0.885+(0.173-rpm/7)/2,0.005,(rpm/7),255,255,255,255) -- RPM Bar in white
     else
        Wait(500)
     end
  end
end)

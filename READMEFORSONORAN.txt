In order for this script to work, you must do the following if you are using Sonoran Radio:

In [sonoranradio]/sonoranradio/lua/cl_main.lua, replace line 313 to 374 with this:


function Radio:Talking(toggle)
	exports.RadioAnimationCommand.animation(isTalking)
	local inVeh = IsPedInAnyVehicle(GetPlayerPed(-1), false)
	if self.TalkAnim then
		if toggle and not inVeh then
			if self.Open then
				RequestAnimDict('cellphone@')
				while not HasAnimDictLoaded('cellphone@') do
					Wait(5)
				end
				TaskPlayAnim(PlayerPedId(), 'cellphone@', 'cellphone_text_to_call', 8.0, 0.0, -1, 50, 0, false, false, false)

				-- Wait(300)
				-- RequestAnimDict("cellphone@str")
				-- while not HasAnimDictLoaded("cellphone@str") do Wait(5) end
				-- TaskPlayAnim(PlayerPedId(), "cellphone@str","cellphone_call_listen_a", 8.0, 0.0, -1, 50, 0, false, false, false)

				isTalking = true
				exports.RadioAnimationCommand.animation(isTalking)
			else
				RequestAnimDict('random@arrests')
				while not HasAnimDictLoaded('random@arrests') do
					Wait(5)
				end
				TaskPlayAnim(PlayerPedId(), 'random@arrests', 'generic_radio_chatter', 8.0, 0.0, -1, 49, 0, 0, 0, 0)
				isTalking = true
				exports.RadioAnimationCommand.animation(isTalking)
			end
		else
			if self.Open then
				-- cellphone@cellphone_call_to_text
				-- cellphone@cellphone_text_read_base
				--

				-- StopAnimTask(PlayerPedId(), "cellphone@","cellphone_text_to_call", 4.0)
				if inVeh then
					return
				end
				-- Citizen.Wait(700)
				RequestAnimDict('cellphone@')
				while not HasAnimDictLoaded('cellphone@') do
					Wait(5)
				end
				-- TaskPlayAnim(PlayerPedId(), "cellphone@", "cellphone_text_in", 4.0, -1, -1, 50, 0, false, false, false)
				TaskPlayAnim(PlayerPedId(), 'cellphone@', 'cellphone_call_to_text', 4.0, -1, -1, 50, 0, false, false, false)
				isTalking = false
				exports.RadioAnimationCommand.animation(isTalking)
			else
				StopAnimTask(PlayerPedId(), 'random@arrests', 'generic_radio_chatter', -4.0)
				isTalking = false
				exports.RadioAnimationCommand.animation(isTalking)
			end
		end
	else
		if isTalking then
			StopAnimTask(PlayerPedId(), 'cellphone@str', 'cellphone_call_listen_a', -4.0)
			StopAnimTask(PlayerPedId(), 'random@arrests', 'generic_radio_chatter', -4.0)
			isTalking = false
			exports.RadioAnimationCommand.animation(isTalking)
		end
	end
end

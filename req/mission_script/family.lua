local difficulty = Global.game_settings and Global.game_settings.difficulty or "normal"
local difficulty_index = tweak_data:difficulty_to_index(difficulty)

	if difficulty_index <= 5 then
		ponr_value = 360
	elseif difficulty_index == 6 or difficulty_index == 7 or difficulty_index == 8 then
		ponr_value = 480
	end	

return {
	--Pro Job PONR 
	[101095] = {
		ponr = ponr_value
	},
	-- restores unused sniper spawn
	[100370] = {
		values = {
			enabled = true
		}
	},
	--disable the bad van escape spots
	[100754] = {
		values = {
			enabled = false
		}
	},
	[100755] = {
		values = {
			enabled = false
		}
	},
	--Disable the SWAT Turret
	[102124] = {
		values = {
			enabled = false
		}
	}
}	
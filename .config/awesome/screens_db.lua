local naughty = require("naughty")

local defaultOutput = 'eDP1'

outputMapping = {
    ['DP-1'] = 'DP1',
    ['DP-2'] = 'DP2',
    ['DP-3'] = 'DP3',
    ['VGA-1'] = 'VGA1',
    ['LVDS-1'] = 'LVDS1',
    ['HDMI-1'] = 'HDMI1',
    ['HDMI-2'] = 'HDMI2',
    ['eDP-1'] = 'eDP1',
    ['eDP-2'] = 'eDP2',
}

screens = {
	['default'] = {
		['connected'] = function (xrandrOutput)
            if xrandrOutput ~= defaultOutput then
                return '--output ' .. xrandrOutput .. ' --auto --same-as ' .. defaultOutput
            end
            return nil
		end,
		['disconnected'] = function (xrandrOutput)
            if xrandrOutput ~= defaultOutput then
                return '--output ' .. xrandrOutput .. ' --off --output ' .. defaultOutput .. ' --auto'
            end
            return nil
		end
	},
	['HDMI-1'] = {
		['connected'] = function (xrandrOutput)
			if xrandrOutput ~= defaultOutput then
				return 'xrandr --output HDMI-1 --auto --rotate left --right-of eDP-1'
			end
			return nil
		end,
	}
}
--	['88206192010'] = { -- HDMI-A-1
--		['connected'] = function (xrandrOutput)
--			if xrandrOutput ~= defaultOutput then
--				return '--output ' .. xrandrOutput .. ' --auto --same-as ' .. defaultOutput
--			end
--			return nil
--		end,
--		['disconnected'] = function (xrandrOutput)
--			if xrandrOutput ~= defaultOutput then
--			return '--output ' .. xrandrOutput .. ' --off --output ' .. defaultOutput .. ' --auto'
--			end
--			return nil
--		end
--	}
--	['400000'] = { -- /sys/class/drm/card0/card0-eDP-1
--		['connected'] = function (xrandrOutput)
--			if xrandrOutput ~= defaultOutput then
--				return '--output ' .. xrandrOutput .. ' --auto --same-as ' .. defaultOutput
--			end
--			return nil
--		end,
--		['disconnected'] = function (xrandrOutput)
--			if xrandrOutput ~= defaultOutput then
--			return '--output ' .. xrandrOutput .. ' --off --output ' .. defaultOutput .. ' --auto'
--			end
--			return nil
--		end
--	}

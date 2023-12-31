local path = minetest.get_modpath(minetest.get_current_modname()) .. "/"

-- Check for translation method
local S

if minetest.get_translator ~= nil then
	S = minetest.get_translator("mobs_jam") -- 5.x translation function
else
	if minetest.get_modpath("intllib") then
		dofile(minetest.get_modpath("intllib").."/init.lua")
		if intllib.make_gettext_pair then
			S = intllib.make_gettext_pair() -- new gettext method
		else
			S = intllib.Getter() -- old text file method
		end
	else -- boilerplate function
		S = function(str, ...)
			local args = {...}
			return str:gsub("@%d+", function(match)
				return args[tonumber(match:sub(2))]
			end)
		end
	end
end

mobs.intllib_animal = S


-- Check for custom mob spawn file
local input = io.open(path .. "spawn.lua", "r")

if input then
	mobs.custom_spawn_animal = true
	input:close()
	input = nil
end


if not minetest.get_modpath("mobs_animal") then
dofile(path .. "chicken.lua") -- JKmurray
dofile(path .. "cow.lua") -- KrupnoPavel
dofile(path .. "rat.lua") -- PilzAdam
dofile(path .. "sheep.lua") -- PilzAdam
dofile(path .. "warthog.lua") -- KrupnoPavel
dofile(path .. "bee.lua") -- KrupnoPavel
dofile(path .. "bunny.lua") -- ExeterDad
dofile(path .. "kitten.lua") -- Jordach/BFD
dofile(path .. "penguin.lua") -- D00Med
dofile(path .. "panda.lua") -- AspireMint
end

if not minetest.get_modpath("mobs_doomed") or not minetest.get_modpath("dmobs") then
dofile(path .. "fox.lua") -- D00Med
dofile(path .. "owl.lua") -- D00Med
dofile(path .. "tortoise.lua") -- D00Med
end

if not minetest.get_modpath("mobs_monster") then
dofile(path .. "fire_spirit.lua") -- tenplus1
dofile(path .. "oerkki.lua") -- Pavel_S and PilzAdam (WTFPL)
dofile(path .. "lava_flan.lua") -- Lava Flan by Zeg9 (additional textures by JurajVajda)
end

-- Load custom spawning
if mobs.custom_spawn_animal then
	dofile(path .. "spawn.lua")
end


-- Lucky Blocks
if minetest.get_modpath("lucky_block") then
	dofile(path .. "lucky_block.lua")
end


print ("[MOD] Mobs JAM (reduced animals mobs) loaded")


local dropstor

dropstor = {{name = "default:stick", chance = 1, min = 1, max = 1},}

if minetest.get_modpath("farming") then
	dropstor = {
		{name = "default:stick", chance = 1, min = 1, max = 1},
		{name = "farming:string", chance = 2, min = 0, max = 1},
	}
end

mobs:register_mob(":mobs_doomed:tortoise", {
	type = "animal",
	passive = false,
	reach = 1,
	damage = 2,
	attack_type = "dogfight",
	hp_min = 6,
	hp_max = 12,
	armor = 130,
	collisionbox = {-0.2, 0, -0.2, 0.2, 0.3, 0.2},
	visual = "mesh",
	mesh = "mobs_tortoise.b3d",
	textures = {
		{"mobs_tortoise.png"},
	},
	blood_texture = "mobs_blood.png",
	visual_size = {x=1, y=1},
	makes_footstep_sound = true,
	walk_velocity = 0.5,
	run_velocity = 1,
	jump = false,
	jump_height = 0.5,
	floats = true,
	drops = dropstor,
	water_damage = 0,
	lava_damage = 2,
	fire_damage = 2,
	light_damage = 0,
	fall_damage = 1,
	fall_speed = -10,
	fear_height = 4,
	follow = {
		{"default:papyrus"},
		{"default:leaves"}
	},
	view_range = 14,
	animation = {
		speed_normal = 6,
		speed_run = 10,
		walk_start = 23,
		walk_end = 43,
		stand_start = 1,
		stand_end = 20,
		run_start = 23,
		run_end = 43,

	},
	on_rightclick = function(self, clicker)

		if mobs:feed_tame(self, clicker, 8, true, true) then
			return
		end

		mobs:capture_mob(self, clicker, 0, 50, 80, false, nil)
	end,
})


mobs:register_egg(":mobs_doomed:tortoise", "Tortoise", "default_grass.png", 1)

	mobs:spawn({name = ":mobs_doomed:tortoise", nodes = {"default:water_source", "group:sand"}, neighbor = {},
		min_light = 5, max_light = 10, interval = 300, chance = 8000, active_object_count = 2, min_height = -100, max_height = 500})

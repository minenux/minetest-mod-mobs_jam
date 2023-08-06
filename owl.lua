local follow = {}

-- detect common minetest famous mobs
if minetest.get_modpath("farming") then
	table.insert(follow, "farming:seed_wheat")
	table.insert(follow, "farming:seed_cotton")
end
if minetest.get_modpath("butterflies") then
	table.insert(follow, "butterflies:butterfly_red")
	table.insert(follow, "butterflies:butterfly_violet")
	table.insert(follow, "butterflies:butterfly_white")
end
if minetest.get_modpath("fireflies") then
	table.insert(follow, "fireflies:firefly")
end
if minetest.get_modpath("mobs_animal") then
	table.insert(follow, "mobs_animal:rat")
	table.insert(follow, "mobs_animal:bee")
	table.insert(follow, "mobs_animal:bunny")
	table.insert(follow, "mobs_animal:chicken")
	table.insert(follow, "mobs_animal:muttom_raw")
end
-- compatibility with those made specially for other games
if minetest.get_modpath("mobs_bugslive") then
	table.insert(follow, "mobs_bugslive:bug")
end
if minetest.get_modpath("mobs_butterfly") then
	table.insert(follow, "mobs_butterfly:butterfly")
end
if minetest.get_modpath("mobs_fish") then
	table.insert(follow, "mobs_fish:tropical")
	table.insert(follow, "mobs_fish:clownfish")
end
if minetest.get_modpath("mobs_better_rat") then
	table.insert(follow, "mobs_better_rat:rat")
end
if minetest.get_modpath("mobs_bat") then
	table.insert(follow, "mobs_bat:bat")
end
if minetest.get_modpath("mobs_birds") then
	table.insert(follow, "mobs_birds:bird_sm")
end

mobs:register_mob(":mobs_doomed:owl", {
	type = "animal",
	passive = true,
	hp_min = 12,
	hp_max = 22,
	armor = 130,
	collisionbox = {-0.3, -0.5, -0.3, 0.2, 0.2, 0.2},
	visual = "mesh",
	mesh = "mobs_owl.b3d",
	textures = {
		{"mobs_owl.png"},
	},
	blood_texture = "mobs_blood.png",
	visual_size = {x=2, y=2},
	makes_footstep_sound = false,
	walk_velocity = 0,
	run_velocity = 0,
	jump = false,
	drops = {
		{name = "mobs:meat_raw", chance = 1, min = 1, max = 1},
	},
	water_damage = 2,
	lava_damage = 2,
	fire_damage = 2,
	light_damage = 0,
	view_range = 1,
	follow=follow,
	do_custom = function(self)
	local daytime = minetest.get_timeofday()*24000 
	if daytime <=6000 then
	self.object:set_properties({
						textures = {"mobs_owl_awake.png"},
						mesh = "mobs_owl.b3d",
					})
	elseif daytime >=6000 then
	self.object:set_properties({
						textures = {"mobs_owl.png"},
						mesh = "mobs_owl.b3d",
					})
	end
	end,
	on_rightclick = function(self, clicker)
		if mobs:feed_tame(self, clicker, 8, true, true) then return end
		if mobs:protect(self, clicker) then return end
		mobs:capture_mob(self, clicker, 0, 50, 5, false, nil)
	end,
	animation = {
		speed_normal = 1,
		walk_start = 1,
		walk_end = 50,
	},
})


mobs:register_egg(":mobs_doomed:owl", "Owl", "default_tree.png", 1)

	mobs:spawn({name = ":mobs_doomed:owl", nodes = {"group:tree"}, neighbor = {},
		min_light = 0, max_light = 7, interval = 300, chance = 16000, active_object_count = 2, min_height = 0, max_height = 2000})

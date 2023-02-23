local mod = get_mod("Dark-Elf-Dagger")
mod:dofile("scripts/mods/Dark-Elf-Dagger/string_dict")

local menu = {
	name = "Dark-Elf-Dagger",
	description = "Dark-Elf-Dagger",
	is_togglable = false,
}

local shield_sub_choice = {
	setting_id = nil,
	type = "dropdown",
	default_value = "default",
	title = nil,
	tooltip = "choose_skin",
	options = {
		{text = "default",   value = "default"},
	},
	sub_widgets = {},
}

menu.options = {}
menu.options.widgets = {
	{
		setting_id = "weapons",
		type = "dropdown",
		default_value = 1,
		title = "choose_wep",
		tooltip = "choose_wep",
		options = {
			{text = "choose_wep",   value = 1},
			{text = "elf_daggers",   value = 2, show_widgets = {}},
			{text = "elf_swords",   value = 3, show_widgets = {}},
			{text = "elf_dual_swords",   value = 4, show_widgets = {}},
			{text = "elf_sword_dagger",   value = 5, show_widgets = {}},
		},
		sub_widgets = {},
	},
}

local num_skins = 0

--elf long bow
for _,skin in ipairs(mod.elf_bow_skins) do
	local widget = table.clone(shield_sub_choice, true)
	widget.setting_id = skin
	widget.title = skin
	local x = 1
	for Amoury_key,skin_name in pairs(mod.elf_bows[skin]) do
		local choice = {text = Amoury_key,   value = Amoury_key}
		table.insert(widget.options, choice)
	end
	num_skins = num_skins + 1
	table.insert(menu.options.widgets[1].options[2].show_widgets, num_skins)
	table.insert(menu.options.widgets[1].sub_widgets, widget)
end

--sword skins
for _,skin in ipairs(mod.elf_sword_skins) do
	local widget = table.clone(shield_sub_choice, true)
	widget.setting_id = skin
	widget.title = skin
	local x = 1
	for Amoury_key,skin_name in pairs(mod.elf_swords[skin]) do
		local choice = {text = Amoury_key,   value = Amoury_key}
		table.insert(widget.options, choice)
	end
	num_skins = num_skins + 1
	table.insert(menu.options.widgets[1].options[3].show_widgets, num_skins)
	table.insert(menu.options.widgets[1].sub_widgets, widget)
end

--dual sword skins
for _,skin in ipairs(mod.elf_dual_sword_skins) do
	local widget = table.clone(shield_sub_choice, true)
	widget.setting_id = skin
	widget.title = skin
	local x = 1
	for Amoury_key,skin_name in pairs(mod.elf_dual_swords[skin]) do
		local choice = {text = Amoury_key,   value = Amoury_key}
		table.insert(widget.options, choice)
	end
	num_skins = num_skins + 1
	table.insert(menu.options.widgets[1].options[4].show_widgets, num_skins)
	table.insert(menu.options.widgets[1].sub_widgets, widget)
end

--sword and dagger skins
for _,skin in ipairs(mod.elf_sword_dagger_skins) do
	local widget = table.clone(shield_sub_choice, true)
	widget.setting_id = skin
	widget.title = skin
	local x = 1
	for Amoury_key,skin_name in pairs(mod.elf_sword_dagger[skin]) do
		local choice = {text = Amoury_key,   value = Amoury_key}
		table.insert(widget.options, choice)
	end
	num_skins = num_skins + 1
	table.insert(menu.options.widgets[1].options[5].show_widgets, num_skins)
	table.insert(menu.options.widgets[1].sub_widgets, widget)
end

return menu
local mod = get_mod("Dark-Elf-Dagger")

mod:dofile("scripts/mods/Dark-Elf-Dagger/string_dict")

local mod_text_ids = {
	mod_description = {
		en = "Dark-Elf-Dagger description",
	},
	choose_skin = {
		en = "Choose active skin"
	},
	choose_wep = {
		en = "Choose Weapon",
	},
	elf_daggers = {
		en = "Elf Dual Daggers",
	},
	elf_dual_swords = {
		en = "Elf Dual Swords",
	},
	elf_swords = {
		en = "Elf Swords",
	},
	elf_sword_dagger = {
		en = "Elf Sword and Dagger",
	},
	default = {
		en = "default",
	}
}

for id,text in pairs(mod.name_strings_id) do
	if not mod_text_ids[id] then
		mod_text_ids[id] = {}
	end
	mod_text_ids[id]['zh'] = text
	mod_text_ids[id]['en'] = text
	mod_text_ids[id]['fr'] = text
	mod_text_ids[id]['de'] = text
	mod_text_ids[id]['it'] = text
	mod_text_ids[id]['pl'] = text
	mod_text_ids[id]['br-pt'] = text
	mod_text_ids[id]['ru'] = text
	mod_text_ids[id]['es'] = text
end


local game_localize = Managers.localizer
for _,skin in pairs(mod.vanilla_game_strings) do
	local skin_name = tostring(skin).."_name"
	if not mod_text_ids[skin] then
		mod_text_ids[skin] = {}
	end
	local translation = game_localize:_base_lookup(ItemMasterList[skin].display_name)--game_localize:_base_lookup(skin_name) or game_localize:_base_lookup("display_name_"..tostring(skin)) or game_localize:_base_lookup(tostring(skin))
	mod_text_ids[skin]['zh'] = translation
	mod_text_ids[skin]['en'] = translation
	mod_text_ids[skin]['fr'] = translation
	mod_text_ids[skin]['de'] = translation
	mod_text_ids[skin]['it'] = translation
	mod_text_ids[skin]['pl'] = translation
	mod_text_ids[skin]['br-pt'] = translation
	mod_text_ids[skin]['ru'] = translation
	mod_text_ids[skin]['es'] = translation
end


return mod_text_ids
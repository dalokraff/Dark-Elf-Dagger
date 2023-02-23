local mod = get_mod("Dark-Elf-Dagger")
mod:dofile("scripts/mods/Dark-Elf-Dagger/skin_list")

local desc_strings = {
    Kerillian_Dark_Elf_Dagger = "Dagger for Dark Elves",
}

local name_strings = {}

--these mod name tables are spilt up so the keys can be used by vmf widgets
--the order of shields only matters for vmf menu and it is displayed as the reverse

mod.elf_bows = {
    we_dual_dagger_skin_01 = {
        Kerillian_Dark_Elf_Dagger_left = "Dark Elf Dagger left",
        Kerillian_Dark_Elf_Dagger_right = "Dark Elf Dagger right",
        Kerillian_Dark_Elf_Dagger_runed_left = "Dark Elf Rune Dagger left",
        Kerillian_Dark_Elf_Dagger_runed_right = "Dark Elf Rune Dagger right",
    },
    we_dual_dagger_skin_02 = {
        Kerillian_Dark_Elf_Dagger_left = "Dark Elf Dagger left",
        Kerillian_Dark_Elf_Dagger_right = "Dark Elf Dagger right",
        Kerillian_Dark_Elf_Dagger_runed_left = "Dark Elf Rune Dagger left",
        Kerillian_Dark_Elf_Dagger_runed_right = "Dark Elf Rune Dagger right",
    },
    we_dual_dagger_skin_03 = {
        Kerillian_Dark_Elf_Dagger_left = "Dark Elf Dagger left",
        Kerillian_Dark_Elf_Dagger_right = "Dark Elf Dagger right",
        Kerillian_Dark_Elf_Dagger_runed_left = "Dark Elf Rune Dagger left",
        Kerillian_Dark_Elf_Dagger_runed_right = "Dark Elf Rune Dagger right",
    },
    we_dual_dagger_skin_04 = {
        Kerillian_Dark_Elf_Dagger_left = "Dark Elf Dagger left",
        Kerillian_Dark_Elf_Dagger_right = "Dark Elf Dagger right",
        Kerillian_Dark_Elf_Dagger_runed_left = "Dark Elf Rune Dagger left",
        Kerillian_Dark_Elf_Dagger_runed_right = "Dark Elf Rune Dagger right",
    },
    we_dual_dagger_skin_05 = {
        Kerillian_Dark_Elf_Dagger_left = "Dark Elf Dagger left",
        Kerillian_Dark_Elf_Dagger_right = "Dark Elf Dagger right",
        Kerillian_Dark_Elf_Dagger_runed_left = "Dark Elf Rune Dagger left",
        Kerillian_Dark_Elf_Dagger_runed_right = "Dark Elf Rune Dagger right",
    },
    we_dual_dagger_skin_06 = {
        Kerillian_Dark_Elf_Dagger_left = "Dark Elf Dagger left",
        Kerillian_Dark_Elf_Dagger_right = "Dark Elf Dagger right",
        Kerillian_Dark_Elf_Dagger_runed_left = "Dark Elf Rune Dagger left",
        Kerillian_Dark_Elf_Dagger_runed_right = "Dark Elf Rune Dagger right",
    },
    we_dual_dagger_skin_07 = {
        Kerillian_Dark_Elf_Dagger_left = "Dark Elf Dagger left",
        Kerillian_Dark_Elf_Dagger_right = "Dark Elf Dagger right",
        Kerillian_Dark_Elf_Dagger_runed_left = "Dark Elf Rune Dagger left",
        Kerillian_Dark_Elf_Dagger_runed_right = "Dark Elf Rune Dagger right",
    },
}

mod.elf_swords = {
    we_sword_skin_01 = {
        Kerillian_Dark_Elf_Sword_right = "Dark Elf Sword",
        Kerillian_Dark_Elf_Sword_runed_right = "Dark Elf Rune Sword right", 
    },
}

mod.elf_dual_swords = {
    we_dual_sword_skin_01 = {
        Kerillian_Dark_Elf_Sword_left = "Dark Elf Sword left",
        Kerillian_Dark_Elf_Sword_right = "Dark Elf Sword right",
        Kerillian_Dark_Elf_Sword_runed_left = "Dark Elf Rune Sword left",
        Kerillian_Dark_Elf_Sword_runed_right = "Dark Elf Rune Sword right", 
    },
    we_dual_sword_skin_02 = {
        Kerillian_Dark_Elf_Sword_left = "Dark Elf Sword left",
        Kerillian_Dark_Elf_Sword_right = "Dark Elf Sword right",
        Kerillian_Dark_Elf_Sword_runed_left = "Dark Elf Rune Sword left",
        Kerillian_Dark_Elf_Sword_runed_right = "Dark Elf Rune Sword right", 
    },
    we_dual_sword_skin_02_runed_01 = {
        Kerillian_Dark_Elf_Sword_left = "Dark Elf Sword left",
        Kerillian_Dark_Elf_Sword_right = "Dark Elf Sword right",
        Kerillian_Dark_Elf_Sword_runed_left = "Dark Elf Rune Sword left",
        Kerillian_Dark_Elf_Sword_runed_right = "Dark Elf Rune Sword right", 
    },
    we_dual_sword_skin_04_runed_01 = {
        Kerillian_Dark_Elf_Sword_left = "Dark Elf Sword left",
        Kerillian_Dark_Elf_Sword_right = "Dark Elf Sword right",
        Kerillian_Dark_Elf_Sword_runed_left = "Dark Elf Rune Sword left",
        Kerillian_Dark_Elf_Sword_runed_right = "Dark Elf Rune Sword right", 
    },
    we_dual_sword_skin_05 = {
        Kerillian_Dark_Elf_Sword_left = "Dark Elf Sword left",
        Kerillian_Dark_Elf_Sword_right = "Dark Elf Sword right",
        Kerillian_Dark_Elf_Sword_runed_left = "Dark Elf Rune Sword left",
        Kerillian_Dark_Elf_Sword_runed_right = "Dark Elf Rune Sword right", 
    },
    we_dual_sword_skin_05_runed_01 = {
        Kerillian_Dark_Elf_Sword_left = "Dark Elf Sword left",
        Kerillian_Dark_Elf_Sword_right = "Dark Elf Sword right",
        Kerillian_Dark_Elf_Sword_runed_left = "Dark Elf Rune Sword left",
        Kerillian_Dark_Elf_Sword_runed_right = "Dark Elf Rune Sword right", 
    },
    we_dual_sword_skin_05_runed_02 = {
        Kerillian_Dark_Elf_Sword_left = "Dark Elf Sword left",
        Kerillian_Dark_Elf_Sword_right = "Dark Elf Sword right",
        Kerillian_Dark_Elf_Sword_runed_left = "Dark Elf Rune Sword left",
        Kerillian_Dark_Elf_Sword_runed_right = "Dark Elf Rune Sword right", 
    },
    we_dual_sword_skin_06 = {
        Kerillian_Dark_Elf_Sword_left = "Dark Elf Sword left",
        Kerillian_Dark_Elf_Sword_right = "Dark Elf Sword right",
        Kerillian_Dark_Elf_Sword_runed_left = "Dark Elf Rune Sword left",
        Kerillian_Dark_Elf_Sword_runed_right = "Dark Elf Rune Sword right", 
    },
    we_dual_sword_skin_07 = {
        Kerillian_Dark_Elf_Sword_left = "Dark Elf Sword left",
        Kerillian_Dark_Elf_Sword_right = "Dark Elf Sword right",
        Kerillian_Dark_Elf_Sword_runed_left = "Dark Elf Rune Sword left",
        Kerillian_Dark_Elf_Sword_runed_right = "Dark Elf Rune Sword right", 
    },
}

mod.elf_sword_dagger = {
    we_dual_sword_dagger_skin_01 = {
        Kerillian_Dark_Elf_Dagger_left = "Dark Elf Dagger left",
        Kerillian_Dark_Elf_Sword_right = "Dark Elf Sword right",
        Kerillian_Dark_Elf_Sword_runed_right = "Dark Elf Rune Sword right", 
        Kerillian_Dark_Elf_Dagger_runed_left = "Dark Elf Rune Dagger left",
    },
    we_dual_sword_dagger_skin_01_runed_01 = {
        Kerillian_Dark_Elf_Dagger_left = "Dark Elf Dagger left",
        Kerillian_Dark_Elf_Sword_right = "Dark Elf Sword right",
        Kerillian_Dark_Elf_Sword_runed_right = "Dark Elf Rune Sword right", 
        Kerillian_Dark_Elf_Dagger_runed_left = "Dark Elf Rune Dagger left",
    },
    we_dual_sword_dagger_skin_01_runed_02 = {
        Kerillian_Dark_Elf_Dagger_left = "Dark Elf Dagger left",
        Kerillian_Dark_Elf_Sword_right = "Dark Elf Sword right",
        Kerillian_Dark_Elf_Sword_runed_right = "Dark Elf Rune Sword right", 
        Kerillian_Dark_Elf_Dagger_runed_left = "Dark Elf Rune Dagger left",
    },
    we_dual_sword_dagger_skin_02 = {
        Kerillian_Dark_Elf_Dagger_left = "Dark Elf Dagger left",
        Kerillian_Dark_Elf_Sword_right = "Dark Elf Sword right",
        Kerillian_Dark_Elf_Sword_runed_right = "Dark Elf Rune Sword right",
        Kerillian_Dark_Elf_Dagger_runed_left = "Dark Elf Rune Dagger left", 
    },
    we_dual_sword_dagger_skin_02_runed_01 = {
        Kerillian_Dark_Elf_Dagger_left = "Dark Elf Dagger left",
        Kerillian_Dark_Elf_Sword_right = "Dark Elf Sword right",
        Kerillian_Dark_Elf_Sword_runed_right = "Dark Elf Rune Sword right", 
        Kerillian_Dark_Elf_Dagger_runed_left = "Dark Elf Rune Dagger left",
    },
    we_dual_sword_dagger_skin_04_runed_01 = {
        Kerillian_Dark_Elf_Dagger_left = "Dark Elf Dagger left",
        Kerillian_Dark_Elf_Sword_right = "Dark Elf Sword right",
        Kerillian_Dark_Elf_Sword_runed_right = "Dark Elf Rune Sword right", 
        Kerillian_Dark_Elf_Dagger_runed_left = "Dark Elf Rune Dagger left",
    },
    we_dual_sword_dagger_skin_05 = {
        Kerillian_Dark_Elf_Dagger_left = "Dark Elf Dagger left",
        Kerillian_Dark_Elf_Sword_right = "Dark Elf Sword right",
        Kerillian_Dark_Elf_Sword_runed_right = "Dark Elf Rune Sword right",
        Kerillian_Dark_Elf_Dagger_runed_left = "Dark Elf Rune Dagger left", 
    },
    we_dual_sword_dagger_skin_05_runed_01 = {
        Kerillian_Dark_Elf_Dagger_left = "Dark Elf Dagger left",
        Kerillian_Dark_Elf_Sword_right = "Dark Elf Sword right",
        Kerillian_Dark_Elf_Sword_runed_right = "Dark Elf Rune Sword right", 
        Kerillian_Dark_Elf_Dagger_runed_left = "Dark Elf Rune Dagger left",
    },
    we_dual_sword_dagger_skin_06 = {
        Kerillian_Dark_Elf_Dagger_left = "Dark Elf Dagger left",
        Kerillian_Dark_Elf_Sword_right = "Dark Elf Sword right",
        Kerillian_Dark_Elf_Sword_runed_right = "Dark Elf Rune Sword right", 
        Kerillian_Dark_Elf_Dagger_runed_left = "Dark Elf Rune Dagger left",
    },
    we_dual_sword_dagger_skin_07 = {
        Kerillian_Dark_Elf_Dagger_left = "Dark Elf Dagger left",
        Kerillian_Dark_Elf_Sword_right = "Dark Elf Sword right",
        Kerillian_Dark_Elf_Sword_runed_right = "Dark Elf Rune Sword right", 
        Kerillian_Dark_Elf_Dagger_runed_left = "Dark Elf Rune Dagger left",
    },
}

--merges all the upbove tables together to be used for another mod table that is sent to the localization hook

for k,weapon in pairs(mod.elf_bows) do
    for variant,name in pairs(weapon) do 
        name_strings[variant] = name
    end
end

for k,weapon in pairs(mod.elf_swords) do
    for variant,name in pairs(weapon) do 
        name_strings[variant] = name
    end
end

for k,weapon in pairs(mod.elf_dual_swords) do
    for variant,name in pairs(weapon) do 
        name_strings[variant] = name
    end
end

for k,weapon in pairs(mod.elf_sword_dagger) do
    for variant,name in pairs(weapon) do 
        name_strings[variant] = name
    end
end

--copies the name_strings table to be used in a mod table for the vmf menu localization
mod.name_strings_id = {}
for k,v in pairs(name_strings) do
    mod.name_strings_id[k] = v
end


local desc = {}
local name = {}
-- local skin_table = table.clone(WeaponSkins.skins)
local skin_table = table.clone(ItemMasterList, true)

for skin, data in pairs(mod.SKIN_CHANGED) do
    local description = skin_table[skin].description
    local heiss = skin_table[skin].display_name
    
    desc[description] = skin
    name[heiss] = skin
end

mod.dict = {}
mod.helper_dict = {}
for k,v in pairs(desc) do
    mod.dict[k] = table.clone(desc_strings, true)
end
for k,v in pairs(name) do
    mod.dict[k] = table.clone(name_strings, true)
end

for k,v in pairs(desc) do
    mod.helper_dict[k] = v
end
for k,v in pairs(name) do
    mod.helper_dict[k] = v
end
local mod = get_mod("Dark-Elf-Dagger")

mod.SKIN_LIST = {
    Kerillian_Dark_Elf_Dagger_left = {
        kind = "unit",
        swap_skin = nil,
        new_units = {
            "units/pDagger/pDagger",
            "units/pDagger/pDagger_3p",
        },
        swap_hand = "left_hand_unit",
    },
    Kerillian_Dark_Elf_Dagger_right = {
        kind = "unit",
        swap_skin = nil,
        new_units = {
            "units/pDagger/pDagger",
            "units/pDagger/pDagger_3p",
        },
        swap_hand = "right_hand_unit",
    },
    Kerillian_Dark_Elf_Dagger_runed_left = {
        kind = "unit",
        swap_skin = nil,
        new_units = {
            "units/pDagger/pDagger_runed",
            "units/pDagger/pDagger_runed_3p",
        },
        swap_hand = "left_hand_unit",
    },
    Kerillian_Dark_Elf_Dagger_runed_right = {
        kind = "unit",
        swap_skin = nil,
        new_units = {
            "units/pDagger/pDagger_runed",
            "units/pDagger/pDagger_runed_3p",
        },
        swap_hand = "right_hand_unit",
    },
    Kerillian_Dark_Elf_Sword_left = {
        kind = "unit",
        swap_skin = nil,
        new_units = {
            "units/Sword/SM_Dark_Elf_Sword",
            "units/Sword/SM_Dark_Elf_Sword_3p",
        },
        swap_hand = "left_hand_unit",
    },
    Kerillian_Dark_Elf_Sword_right = {
        kind = "unit",
        swap_skin = nil,
        new_units = {
            "units/Sword/SM_Dark_Elf_Sword",
            "units/Sword/SM_Dark_Elf_Sword_3p",
        },
        swap_hand = "right_hand_unit",
    },
    Kerillian_Dark_Elf_Sword_runed_left = {
        kind = "unit",
        swap_skin = nil,
        new_units = {
            "units/Sword/SM_Dark_Elf_Sword_runed",
            "units/Sword/SM_Dark_Elf_Sword_runed_3p",
        },
        swap_hand = "left_hand_unit",
    },
    Kerillian_Dark_Elf_Sword_runed_right = {
        kind = "unit",
        swap_skin = nil,
        new_units = {
            "units/Sword/SM_Dark_Elf_Sword_runed",
            "units/Sword/SM_Dark_Elf_Sword_runed_3p",
        },
        swap_hand = "right_hand_unit",
    },
}

local skin_table_weapons = table.clone(WeaponSkins.skins)
local skin_table_items = table.clone(ItemMasterList, true)
local skins_to_change = {}

--these mod tables are used split up so the vmf widgets can easily group the skins by weapon type

mod.elf_bow_skins = {
    "we_dual_dagger_skin_01",
    "we_dual_dagger_skin_02",
    "we_dual_dagger_skin_03",
    "we_dual_dagger_skin_04",
    "we_dual_dagger_skin_05",
    "we_dual_dagger_skin_06",
    "we_dual_dagger_skin_07",
}

mod.elf_sword_skins = {
    "we_sword_skin_01",
}

mod.elf_dual_sword_skins = {
    "we_dual_sword_skin_01",
    "we_dual_sword_skin_02",
    "we_dual_sword_skin_02_runed_01",
    "we_dual_sword_skin_04_runed_01",
    "we_dual_sword_skin_05",
    "we_dual_sword_skin_05_runed_01",
    "we_dual_sword_skin_05_runed_02",
    "we_dual_sword_skin_06",
    "we_dual_sword_skin_07",
}

mod.elf_sword_dagger_skins = {
    "we_dual_sword_dagger_skin_01",
    "we_dual_sword_dagger_skin_01_runed_01",
    "we_dual_sword_dagger_skin_01_runed_02",
    "we_dual_sword_dagger_skin_02",
    "we_dual_sword_dagger_skin_02_runed_01",
    "we_dual_sword_dagger_skin_04_runed_01",
    "we_dual_sword_dagger_skin_05",
    "we_dual_sword_dagger_skin_05_runed_01",
    "we_dual_sword_dagger_skin_06",
    "we_dual_sword_dagger_skin_07",
}

table.append(skins_to_change, mod.elf_bow_skins)
table.append(skins_to_change, mod.elf_dual_sword_skins)
table.append(skins_to_change, mod.elf_sword_dagger_skins)

--this mod table is used for the vmf menu localization
mod.vanilla_game_strings = table.clone(skins_to_change, true)

mod.SKIN_CHANGED = {}

for _,skin in pairs(skins_to_change) do
    local unit = nil
    if skin_table_weapons[skin] then
        unit = skin_table_weapons[skin].left_hand_unit
    elseif skin_table_items[skin] then
        unit = skin_table_items[skin].unit
    end
 
    
    local tisch = {
        changed_texture = false,
        changed_model = false,
        unit = unit,
        cosmetic_table = Cosmetics[skin]
    }
    mod.SKIN_CHANGED[skin] = table.clone(tisch, true)
end

mod.has_old_texture = false

return
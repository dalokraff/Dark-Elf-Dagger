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
}

local skin_table_weapons = table.clone(WeaponSkins.skins)
local skin_table_items = table.clone(ItemMasterList, true)
local skins_to_change = {}

--these mod tables are used split up so the vmf widgets can easily group the skins by weapon type

mod.elf_bow_skins = {
    "we_dual_dagger_skin_02",
}

table.append(skins_to_change, mod.elf_bow_skins)

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
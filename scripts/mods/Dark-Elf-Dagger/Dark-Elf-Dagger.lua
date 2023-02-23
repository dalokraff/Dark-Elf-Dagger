local mod = get_mod("Dark-Elf-Dagger")

mod:dofile("scripts/mods/Dark-Elf-Dagger/utils/hooks")

-- Your mod code goes here.
-- https://vmf-docs.verminti.de

mod.tisch = {
	{
		name = "dagger",
		path = "units/pDagger/pDagger",
		path_3p = "units/pDagger/pDagger_3p",
		swap_skin = "we_dual_dagger_skin_02",
		swap_hand = "right_hand_unit",
		swap_hand2 = "left_hand_unit",
		wpn_path = "units/weapons/player/wpn_we_dagger_01_t2/wpn_we_dagger_01_t2",
		wpn_path_3p = "units/weapons/player/wpn_we_dagger_01_t2/wpn_we_dagger_01_t2_3p"
	},
	{
		name = "sword",
		path = "units/Sword/SM_Dark_Elf_Sword",
		path_3p = "units/Sword/SM_Dark_Elf_Sword_3p",
		swap_skin = "we_dual_sword_skin_02",
		swap_hand = "right_hand_unit",
		swap_hand2 = "left_hand_unit",
		wpn_path = "units/weapons/player/wpn_we_sword_01_t2/wpn_we_sword_01_t2",
		wpn_path_3p = "units/weapons/player/wpn_we_sword_01_t2/wpn_we_sword_01_t2_3p"
	}
}


--thesse tables are used as queues that get filled and flushed as skins and their respective units are changed
mod.level_queue = {}
mod.preview_queue = {}
mod.current_skin = {}


--on mod update:
--the level_queue and previe_queue are checked to see if the respective worlds have any units that need to be retextured
--the SKIN_CHANGED table is updated with info from the vmf menu about which skins are currently being used by which weapons
function mod.update()
    local flush_preview = false
    local flush_level = false

    for skin,tisch in pairs(mod.SKIN_CHANGED) do
        if Managers.world:has_world("level_world") then
            local Armoury_key = mod:get(skin)
            mod.re_apply_illusion(Armoury_key, skin, tisch.unit)
        end
    end
    for unit,tisch in pairs(mod.level_queue) do
        if Managers.world:has_world("level_world") then
            local world = Managers.world:world("level_world")
            local Armoury_key = tisch.Armoury_key
            local skin = tisch.skin
            mod.SKIN_LIST[Armoury_key].swap_skin = skin or mod.SKIN_LIST[Armoury_key].swap_skin
            mod.apply_new_skin_from_texture(Armoury_key, world, skin, unit)
            flush_level = true
        end  
    end
    for unit,tisch in pairs(mod.preview_queue) do
        if Managers.world:has_world("character_preview") then
            local world = Managers.world:world("character_preview")
            local Armoury_key = tisch.Armoury_key
            local skin = tisch.skin
            if Armoury_key ~= "default" and mod.SKIN_LIST[Armoury_key] then
                mod.SKIN_LIST[Armoury_key].swap_skin = skin or mod.SKIN_LIST[Armoury_key].swap_skin
                mod.apply_new_skin_from_texture(Armoury_key, world, skin, unit)
            end
            flush_preview = true
        end
    end

    if flush_level then 
        mod.level_queue = {}
    end
    if flush_preview then 
        mod.preview_queue = {}
    end
    
    
end
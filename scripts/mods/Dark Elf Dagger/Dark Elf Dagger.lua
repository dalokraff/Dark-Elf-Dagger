local mod = get_mod("Dark Elf Dagger")

Managers.package:load("units/weapons/player/wpn_empire_handgun_02_t2/wpn_empire_handgun_02_t2_3p", "global")
Managers.package:load("units/weapons/player/wpn_empire_handgun_02_t2/wpn_empire_handgun_02_t2", "global")

Managers.package:load("units/weapons/player/wpn_emp_sword_02_t1/wpn_emp_sword_02_t1_3p", "global")
Managers.package:load("units/weapons/player/wpn_emp_sword_02_t1/wpn_emp_sword_02_t1", "global")

Managers.package:load("units/weapons/player/wpn_we_dagger_01_t1/wpn_we_dagger_01_t1_runed_01", "global")
Managers.package:load("units/weapons/player/wpn_we_dagger_01_t1/wpn_we_dagger_01_t1_runed_01_3p", "global")



-- Your mod code goes here.
-- https://vmf-docs.verminti.de

mod.tisch = {
	{
		name = "dagger",
		path = "units/pDagger/pDagger",
		path_3p = "units/pDagger/pDagger_3p",
		--path = "units/BeiZhou2H",
		--path_3p = "units/BeiZhou2H_3p",
		swap_skin = "we_dual_dagger_skin_02",
		swap_hand = "right_hand_unit",
		swap_hand2 = "left_hand_unit",
		wpn_path = "units/weapons/player/wpn_we_dagger_01_t2/wpn_we_dagger_01_t2",
		wpn_path_3p = "units/weapons/player/wpn_we_dagger_01_t2/wpn_we_dagger_01_t2_3p"
	},
	{
		name = "sword",
		path = "units/pDagger/pSword",
		path_3p = "units/pDagger/pSword_3p",
		--path = "units/BeiZhou2H",
		--path_3p = "units/BeiZhou2H_3p",
		swap_skin = "we_dual_sword_skin_02",
		swap_hand = "right_hand_unit",
		swap_hand2 = "left_hand_unit",
		wpn_path = "units/weapons/player/wpn_we_sword_01_t2/wpn_we_sword_01_t2",
		wpn_path_3p = "units/weapons/player/wpn_we_sword_01_t2/wpn_we_sword_01_t2_3p"
	}
}

for i=1, #mod.tisch do 
		
	NetworkLookup.inventory_packages[mod.tisch[i].path_3p] = NetworkLookup.inventory_packages[mod.tisch[i].wpn_path_3p]
	NetworkLookup.inventory_packages[NetworkLookup.inventory_packages[mod.tisch[i].wpn_path_3p]] = mod.tisch[i].path_3p
	NetworkLookup.inventory_packages[mod.tisch[i].path] = NetworkLookup.inventory_packages[mod.tisch[i].wpn_path]
	NetworkLookup.inventory_packages[NetworkLookup.inventory_packages[mod.tisch[i].wpn_path]] = mod.tisch[i].path
end

mod:dofile("scripts/mods/Dark Elf Dagger/hooks")

mod.on_enabled = function()
    
    for i=1, #mod.tisch do
    	NetworkLookup.inventory_packages[mod.tisch[i].path_3p] = NetworkLookup.inventory_packages[mod.tisch[i].wpn_path_3p]
    	NetworkLookup.inventory_packages[NetworkLookup.inventory_packages[mod.tisch[i].wpn_path_3p]] = mod.tisch[i].path_3p
    	NetworkLookup.inventory_packages[mod.tisch[i].path] = NetworkLookup.inventory_packages[mod.tisch[i].wpn_path]
    	NetworkLookup.inventory_packages[NetworkLookup.inventory_packages[mod.tisch[i].wpn_path]] = mod.tisch[i].path
        WeaponSkins.skins[mod.tisch[i].swap_skin][mod.tisch[i].swap_hand] = mod.tisch[i].path
        WeaponSkins.skins[mod.tisch[i].swap_skin][mod.tisch[i].swap_hand2] = mod.tisch[i].path
    end
    WeaponSkins.skins['we_dual_sword_dagger_skin_02'][mod.tisch[2].swap_hand] = mod.tisch[2].path
    WeaponSkins.skins['we_dual_sword_dagger_skin_02'][mod.tisch[1].swap_hand2] = mod.tisch[1].path
    
    
    local player = Managers.player:local_player()
    local player_unit = player.player_unit    
    local inventory_extension = ScriptUnit.extension(player_unit, "inventory_system")
    local career_extension = ScriptUnit.extension(player_unit, "career_system")
    local career_name = career_extension:career_name()
    local item_one = BackendUtils.get_loadout_item(career_name, "slot_melee")
    local item_two = BackendUtils.get_loadout_item(career_name, "slot_ranged")
        
    for k,v in pairs (mod.tisch) do
        if (item_one.skin == v.swap_skin) or (item_two.skin == v.swap_skin) or (item_one.skin == 'we_dual_sword_dagger_skin_02') or (item_two.skin == 'we_dual_sword_dagger_skin_02') then
            BackendUtils.set_loadout_item(item_two.backend_id, career_name, "slot_ranged")
            inventory_extension:create_equipment_in_slot("slot_ranged", item_two.backend_id)
            BackendUtils.set_loadout_item(item_one.backend_id, career_name, "slot_melee")
            inventory_extension:create_equipment_in_slot("slot_melee", item_one.backend_id)
        end
    end
    
end

mod.on_disabled = function()
    
    for i=1, #mod.tisch do
        NetworkLookup.inventory_packages[mod.tisch[i].wpn_path_3p] = NetworkLookup.inventory_packages[mod.tisch[i].path_3p]
        NetworkLookup.inventory_packages[NetworkLookup.inventory_packages[mod.tisch[i].path_3p]] = mod.tisch[i].wpn_path_3p
        NetworkLookup.inventory_packages[mod.tisch[i].wpn_path] = NetworkLookup.inventory_packages[mod.tisch[i].path]
        NetworkLookup.inventory_packages[NetworkLookup.inventory_packages[mod.tisch[i].path]] = mod.tisch[i].wpn_path
        WeaponSkins.skins[mod.tisch[i].swap_skin][mod.tisch[i].swap_hand] = mod.tisch[i].wpn_path
        WeaponSkins.skins[mod.tisch[i].swap_skin][mod.tisch[i].swap_hand2] = mod.tisch[i].wpn_path
    end
    
    WeaponSkins.skins['we_dual_sword_dagger_skin_02'][mod.tisch[2].swap_hand] = mod.tisch[2].wpn_path
    WeaponSkins.skins['we_dual_sword_dagger_skin_02'][mod.tisch[1].swap_hand2] = mod.tisch[1].wpn_path
    
    local player = Managers.player:local_player()
    local player_unit = player.player_unit    
    local inventory_extension = ScriptUnit.extension(player_unit, "inventory_system")
    local career_extension = ScriptUnit.extension(player_unit, "career_system")
    local career_name = career_extension:career_name()
    local item_one = BackendUtils.get_loadout_item(career_name, "slot_melee")
    local item_two = BackendUtils.get_loadout_item(career_name, "slot_ranged")
    
    for k,v in pairs (mod.tisch) do
        if (item_one.skin == v.swap_skin) or (item_two.skin == v.swap_skin) or (item_one.skin == 'we_dual_sword_dagger_skin_02') or (item_two.skin == 'we_dual_sword_dagger_skin_02') then
            BackendUtils.set_loadout_item(item_two.backend_id, career_name, "slot_ranged")
            inventory_extension:create_equipment_in_slot("slot_ranged", item_two.backend_id)
            BackendUtils.set_loadout_item(item_one.backend_id, career_name, "slot_melee")
            inventory_extension:create_equipment_in_slot("slot_melee", item_one.backend_id)
        end
    end
end
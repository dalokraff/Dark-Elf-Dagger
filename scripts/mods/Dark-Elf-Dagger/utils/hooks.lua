local mod = get_mod("Dark-Elf-Dagger")
mod:dofile("scripts/mods/Dark-Elf-Dagger/utils/funcs")

local unit_sound_map = require("scripts/mods/Loremasters-Armoury/unit_sounds/unit_sound_map")

--this hook is used to populate the level_world queue; get's the units to change with what custom illusion should be applied to that unit
mod:hook(SimpleInventoryExtension, "_get_no_wield_required_property_and_trait_buffs", function (func, self, backend_id)
    local data_melee = self.recently_acquired_list["slot_melee"]
    local data_range = self.recently_acquired_list["slot_ranged"]

    for skin,bools in pairs(mod.SKIN_CHANGED) do
        if bools.changed_texture then
            local Armoury_key_melee = mod:get(skin)
            local Armoury_key_range = mod:get(skin)

            if data_melee then
                if skin == data_melee.skin then
                    local hand_key = mod.SKIN_LIST[Armoury_key_melee].swap_hand
                    local p1 = hand_key:gsub("_hand",""):gsub("unit", "unit_1p")
                    local p3 = hand_key:gsub("_hand",""):gsub("unit", "unit_3p")
                    local unit_1p = data_melee[p1]
                    local unit_3p = data_melee[p3]
                    
                    
                    mod.level_queue[unit_1p] = {
                        Armoury_key = Armoury_key_melee,
                        skin = skin,
                    }
                    mod.level_queue[unit_3p] = {
                        Armoury_key = Armoury_key_melee,
                        skin = skin,
                    }
                end
            end

            if data_range then
                if skin == data_range.skin then
                    local hand_key = mod.SKIN_LIST[Armoury_key_range].swap_hand
                    local p1 = hand_key:gsub("_hand",""):gsub("unit", "unit_1p")
                    local p3 = hand_key:gsub("_hand",""):gsub("unit", "unit_3p")
                    local unit_1p = data_range[p1]
                    local unit_3p = data_range[p3]
                    
                    
                    mod.level_queue[unit_1p] = {
                        Armoury_key = Armoury_key_range,
                        skin = skin,
                    }
                    mod.level_queue[unit_3p] = {
                        Armoury_key = Armoury_key_range,
                        skin = skin,
                    }
                end
            end

        end
    end


    return func(self, backend_id)
end)


mod:hook(AttachmentUtils, 'link', function (func, world, source, target, node_linking)
    local unit_name = nil
    if Unit.has_data(target, 'unit_name') then
        unit_name = Unit.get_data(target, 'unit_name')
    end
    for skin,tisch in pairs(mod.SKIN_CHANGED) do
        local Armoury_key = mod:get(skin)
        if tisch.changed_texture then
            if mod.SKIN_LIST[Armoury_key].new_units then
                if unit_name == mod.SKIN_LIST[Armoury_key].new_units[1] then
                    
                    mod.SKIN_CHANGED[skin].changed_texture = true
                    mod.level_queue[target] = {
                        Armoury_key = Armoury_key,
                        skin = skin,
                    }
                end
            end
            if mod.SKIN_LIST[Armoury_key].fps_units then
                if unit_name == mod.SKIN_LIST[Armoury_key].fps_units[1] then
                    mod.level_queue[target] = {
                        Armoury_key = Armoury_key,
                        skin = skin,
                    }
                end
            end
        end
    end
 
    return func(world, source, target, node_linking)
end)

--this hook is used to populate the character_preview queue; gets the unit loaded in the preview if it's of the correct skin. correct hand and in the correct slot
local slot_dict = {
    "melee",
    "ranged",
}
slot_dict[6] = "hat", --hat is 6th in the HeroPreviewer's self._item_info_by_slot table, even though the other options are nil
mod:hook_safe(HeroPreviewer, "_spawn_item_unit",  function (self, unit, item_slot_type, item_template, unit_attachment_node_linking, scene_graph_links, material_settings) 
    local player = Managers.player:local_player()
    if player then
        local player_unit = player.player_unit    
        local inventory_extension = ScriptUnit.extension(player_unit, "inventory_system")
        local career_extension = ScriptUnit.extension(player_unit, "career_system")
        if career_extension then
            if career_extension.career_name then
                local career_name = career_extension:career_name()
                for slot_order,units in pairs(self._equipment_units) do
                    local slot = slot_dict[slot_order]
                    
                    if slot then
                        if self._item_info_by_slot[slot] then 
                            local item = BackendUtils.get_loadout_item(career_name, "slot_"..slot)
                            if item_slot_type == "melee" or  item_slot_type == "ranged" then
                                if item.skin then 
                                    local skin = item.skin
                                    local Armoury_key = mod:get(skin)
                                    local skin_list = mod.SKIN_LIST[Armoury_key]
                                    if skin_list then
                                        local hand = skin_list.swap_hand
                                        local hand_key = hand:gsub("_hand_unit", "")
                                        local unit = units[hand_key]

                                        if unit then
                                            mod.preview_queue[unit] = {
                                                Armoury_key = Armoury_key,
                                                skin = skin,
                                            }
                                        end
                                    end
                                end
                            elseif item_slot_type == "hat" then
                                if item.key then
                                    local skin = item.key
                                    local Armoury_key = mod:get(skin)
                                    if unit then
                                        mod.preview_queue[unit] = {
                                            Armoury_key = Armoury_key,
                                            skin = skin,
                                        }
                                    end
                                end
                            end
                        end
                    end
                end
            end
        end
    end
    


end)


mod:hook_safe(HeroPreviewer, "post_update",  function (self, dt) 
    local unit = self.mesh_unit
    if self._hero_loading_package_data then
        local skin_data = self._hero_loading_package_data.skin_data
        local skin_name = skin_data.name
        local Armoury_key = mod:get(skin_name)
        if mod.SKIN_CHANGED[skin_name] then
            if mod.SKIN_CHANGED[skin_name].changed_texture and unit then
                mod.preview_queue[unit] = {
                    Armoury_key = Armoury_key,
                    skin = skin_name,
                }
            end
        end
    end
end)

--the name of pacakges to count as loaded are taken from the string_dict file
local pacakge_tisch = {}
for k,v in pairs(mod.SKIN_LIST) do
    if v.kind == "unit" then
        local package = v.new_units[1]
        pacakge_tisch[package] = package
        pacakge_tisch[package.."_3p"] = package.."_3p"
    end
    
end

mod:hook(PackageManager, "load",
         function(func, self, package_name, reference_name, callback,
                  asynchronous, prioritize)
    if package_name ~= pacakge_tisch[package_name] and package_name ~= pacakge_tisch[package_name.."_3p"] then
        func(self, package_name, reference_name, callback, asynchronous,
             prioritize)
    end
	
end)

mod:hook(PackageManager, "unload",
         function(func, self, package_name, reference_name)
    if package_name ~= pacakge_tisch[package_name] and package_name ~= pacakge_tisch[package_name.."_3p"] then
        func(self, package_name, reference_name)
    end
	
end)

mod:hook(PackageManager, "has_loaded",
         function(func, self, package, reference_name)
    if package == pacakge_tisch[package] or package == pacakge_tisch[package.."_3p"] then
        return true
    end
	
    return func(self, package, reference_name)
end)

--replaces item skin name and descritpion
mod:hook(LocalizationManager, "_base_lookup", function (func, self, text_id)
    local word = mod.dict[text_id]
    local skin = mod.helper_dict[text_id]
    local Armoury_key = mod:get(skin)

    if word then    
        if mod.SKIN_CHANGED[skin].changed_texture or mod.SKIN_CHANGED[skin].changed_model then
            return word[Armoury_key]
        end
    end
    
	return func(self, text_id)
end)


local hijack_mod = get_mod("Material-Hijack")
mod:hook(BuffExtension, "add_buff", function (func, self,template_name, params)
    if template_name == "traits_melee_attack_speed_on_crit_proc" then
        local player_unit = params.attacker_unit
        local player = Managers.player:local_player()
        if player_unit == player.player_unit then
            for unit, anim_texture_extension in pairs(hijack_mod.texture_animations) do
                local unit_name = Unit.get_data(unit, "unit_name")
                if string.find(unit_name, "SM_Dark_Elf_Sword") or string.find(unit_name, "pDagger") then
                    local tisch = anim_texture_extension.loop_on_spawn
                    for k,v in pairs(tisch) do
                        v.emis_colors = true
                    end 
                    local tisch = anim_texture_extension.frame_numbers
                    for k,v in pairs(tisch) do
                        v.loops = 0
                    end 
                    -- anim_texture_extension.loop_on_spawn["Ruby"]["emis_colors"] = true
                    -- anim_texture_extension.frame_numbers["Ruby"]["emis_colors"]["loops"] = 0
                end
            end
        end
    end
    
    return func(self, template_name, params)
end)

-- local hijack_mod = get_mod("Material-Hijack")
-- for unit, anim_texture_extension in pairs(hijack_mod.texture_animations) do
--     local unit_name = Unit.get_data(unit, "unit_name")
--     if string.find(unit_name, "SM_Dark_Elf_Sword") then
--         local tisch = anim_texture_extension.loop_on_spawn
--         for k,v in pairs(tisch) do
--             v.emis_colors = true
--             v.loops = 0
--         end
--     end
-- end

-- mod:hook(WwiseWorld, "trigger_event", function(func, self, event, ...)
--     local params = ...
--     if params then
--         if Unit.alive(pa)
--     end
--     return func(self, event, ...)
-- end)


mod:hook_safe(Unit, "animation_event", function(unit, event, ...)

    local inventory_extension = ScriptUnit.extension(unit, "inventory_system")
    if inventory_extension then
        local slot_data = inventory_extension:get_wielded_slot_data()
        if slot_data then
            local left_hand =  slot_data.left_hand_unit_name
            local right_hand = slot_data.right_hand_unit_name


            if right_hand then
                local sound_table = unit_sound_map[right_hand]
                if sound_table then
                    local sound_event = sound_table[event]
                    if sound_event then
                        if not sound_event.delay then
                            local world = Managers.world:world("level_world")
                            local wwise_world = Wwise.wwise_world(world)
                            local sound_id = WwiseWorld.trigger_event(wwise_world, sound_event.name, slot_data.right_unit_1p)
                        else 
                            local time = mod.time + sound_event.delay 
                            mod.delayed_sounds[sound_event.name] = {
                                time = time, 
                                unit = slot_data.right_unit_1p
                            }
                        end
                    end
                end
            end

            if left_hand then
                local sound_table = unit_sound_map[left_hand]
                if sound_table then
                    local sound_event = sound_table[event]
                    if sound_event then
                        if not sound_event.delay then
                            local world = Managers.world:world("level_world")
                            local wwise_world = Wwise.wwise_world(world)
                            local sound_id = WwiseWorld.trigger_event(wwise_world, sound_event.name, slot_data.left_unit_1p)
                        else 
                            local time = mod.time + sound_event.delay 
                            mod.delayed_sounds[sound_event.name] = {
                                time = time, 
                                unit = slot_data.left_unit_1p
                            }
                        end
                    end
                end
            end
        end
    end

end)
local mod = get_mod("Dark-Elf-Dagger")

--functios for replacing textures from highjacked materials 
local tests = {
    'blood_metallic',
    'blood_intensity',
    'blood_color',
}

-- local function check_unit_slots(material, slot_name, texture_path, unit)
--     if slot_name == nil then 
--         mod:error("Slot "..tostring(slot_name).." not found in "..tostring(unit))
--     else
--         Material.set_texture(material, slot_name, texture_path)
--     end
-- end

-- local function replace_textures(unit)
    
-- 	if Unit.has_data(unit, "mat_to_use") then
--         local mat = Unit.get_data(unit, "mat_to_use")
--         local mat_slots = {}
--         local colors = {}
--         local normals = {}
--         local MABs = {}
--         local emis_colors = {}
--         local emis_details = {}
--         for i=1, 20, 1 do
--             if Unit.has_data(unit, "mat_slots", "slot"..tostring(i)) then 
--                 mat_slots[i] = Unit.get_data(unit, "mat_slots", "slot"..tostring(i))
--             end
--             if Unit.has_data(unit, "colors", "slot"..tostring(i)) then 
--                 colors[i] = Unit.get_data(unit, "colors", "slot"..tostring(i))
               
--             end
--             if Unit.has_data(unit, "normals", "slot"..tostring(i)) then 
--                 normals[i] = Unit.get_data(unit, "normals", "slot"..tostring(i))
                
--             end
--             if Unit.has_data(unit, "MABs", "slot"..tostring(i)) then 
--                 MABs[i] = Unit.get_data(unit, "MABs", "slot"..tostring(i))
                
--             end
--             if Unit.has_data(unit, "emis_colors", "slot"..tostring(i)) then 
--                 emis_colors[i] = Unit.get_data(unit, "emis_colors", "slot"..tostring(i))
                
--             end
--             if Unit.has_data(unit, "emis_details", "slot"..tostring(i)) then 
--                 emis_details[i] = Unit.get_data(unit, "emis_details", "slot"..tostring(i))
                
--             end
--         end
        
--         local color_slot = Unit.get_data(unit, "color_slot")
--         local norm_slot = Unit.get_data(unit, "norm_slot")
--         local MAB_slot = Unit.get_data(unit, "MAB_slot")
--         local emis_col_slot = Unit.get_data(unit, "emis_col_slot")
--         local emis_det_slot = Unit.get_data(unit, "emis_det_slot")

--         local num_meshes = Unit.num_meshes(unit)
--         for index, mat_slot in pairs(mat_slots) do 
--             Unit.set_material(unit, mat_slot, mat)
--             for i = 0, num_meshes - 1, 1 do
--                 local mesh = Unit.mesh(unit, i)
--                 local num_mats = Mesh.num_materials(mesh)
--                 for j = 0, num_mats - 1, 1 do
--                     local mat = Mesh.material(mesh, j)
--                     check_unit_slots(mat, color_slot, colors[index], unit)
--                     check_unit_slots(mat, norm_slot, normals[index], unit)
--                     check_unit_slots(mat, MAB_slot, MABs[index], unit)
--                     check_unit_slots(mat, emis_col_slot, emis_colors[index], unit)
--                     check_unit_slots(mat, emis_det_slot, emis_details[index], unit)

--                     Material.set_texture(mat, 'texture_map_744bd6ea', "textures/TEX_Dark_Elf_Dagger_B")
--                     for _,text in pairs(tests) do 
--                         Material.set_texture(mat, text, "textures/TEX_Dark_Elf_Dagger_B")
--                     end

--                 end
--             end
--         end
--     end 
-- end

-- mod:hook(GearUtils, "create_equipment",
-- function(func, world, slot_name, item_data, unit_1p, unit_3p, is_bot, unit_template, extra_extension_data, ammo_percent, override_item_template, override_item_units)
--     replace_textures(unit_1p)
--     replace_textures(unit_3p)
--     return func(world, slot_name, item_data, unit_1p, unit_3p, is_bot, unit_template, extra_extension_data, ammo_percent, override_item_template, override_item_units)
-- end)

-- mod:hook(UnitSpawner, 'create_unit_extensions', function (func, self, world, unit, unit_template_name, extension_init_data)
--     replace_textures(unit)
--     return func(self, world, unit, unit_template_name, extension_init_data)
-- end)

-- mod:hook(HeroPreviewer, '_spawn_item_unit', function (func, self, unit, item_slot_type, item_template, unit_attachment_node_linking, scene_graph_links, material_settings)
--     replace_textures(unit)
--     return func(self, unit, item_slot_type, item_template, unit_attachment_node_linking, scene_graph_links, material_settings)
-- end)


--functions for loading package
local load_func = function(func, self, package_name, reference_name, callback, asynchronous, prioritize, path)
    if package_name ~= path and package_name ~= path.."_3p" then
        func(self, package_name, reference_name, callback, asynchronous,
            prioritize)
    end
end

local unload_func = function(func, self, package_name, reference_name, path)
    if package_name ~= path and package_name ~= path.."_3p" then
        func(self, package_name, reference_name)
    end
end

local has_load_func = function(func, self, package, reference_name, path)
    if (package == path or package == path.."_3p") then
        return true
    end
end

mod:hook(PackageManager, "load", function(func, self, package_name, reference_name, callback, asynchronous, prioritize)
    if package_name ~= mod.tisch[1].path and package_name ~= mod.tisch[1].path.."_3p" and package_name ~= mod.tisch[2].path and package_name ~= mod.tisch[2].path.."_3p" then
        func(self, package_name, reference_name, callback, asynchronous,
            prioritize)
    end
end)

mod:hook(PackageManager, "unload", function(func, self, package_name, reference_name)
    if package_name ~= mod.tisch[1].path and package_name ~= mod.tisch[1].path.."_3p" and package_name ~= mod.tisch[2].path and package_name ~= mod.tisch[2].path.."_3p" then
        func(self, package_name, reference_name)
    end
end)

mod:hook(PackageManager, "has_loaded", function(func, self, package, reference_name)
    if (package == mod.tisch[1].path or package == mod.tisch[1].path.."_3p") or (package == mod.tisch[2].path or package == mod.tisch[2].path.."_3p") then
        return true
    end
	
    return func(self, package, reference_name)
end)


--commands for spawning in just the models 
local function spawn_package_to_player (package_name)
	local player = Managers.player:local_player()
	local world = Managers.world:world("level_world")
  
	if world and player and player.player_unit then
	  local player_unit = player.player_unit
  
	  local position = Unit.local_position(player_unit, 0) + Vector3(0, 0, 1)
	  local rotation = Unit.local_rotation(player_unit, 0)
	  local unit = World.spawn_unit(world, package_name, position, rotation)
  
	  mod:chat_broadcast(#NetworkLookup.inventory_packages + 1)
	  return unit
	end
  
	return nil
end

-- mod:command("spawn_dagger", "", function()
--     local unit = spawn_package_to_player("units/pDagger/pDagger_3p")
--     replace_textures(unit)
-- end)
-- mod:command("spawn_sword", "", function()
--     local unit = spawn_package_to_player("units/pDagger/pSword_3p")
--     replace_textures(unit)
-- end)
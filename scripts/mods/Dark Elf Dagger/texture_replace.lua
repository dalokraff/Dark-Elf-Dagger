local function check_unit_slots(material, slot_name, texture_path, unit)
    if slot_name == nil then 
        mod:error("Slot "..tostring(slot_name).." not found in "..tostring(unit))
    else
        Material.set_texture(material, slot_name, texture_path)
    end
end

local function replace_textures(unit)
	if Unit.has_data(unit, "mat_to_use") then
        local mat = Unit.get_data(unit, "mat_to_use")
        local mat_slots = {}
        local colors = {}
        local normals = {}
        local MABs = {}
        local emis_colors = {}
        local emis_details = {}
        for i=1, 20, 1 do
            if Unit.has_data(unit, "mat_slots", "slot"..tostring(i)) then 
                mat_slots[i] = Unit.get_data(unit, "mat_slots", "slot"..tostring(i))
            end
            if Unit.has_data(unit, "colors", "slot"..tostring(i)) then 
                colors[i] = Unit.get_data(unit, "colors", "slot"..tostring(i))   
            end
            if Unit.has_data(unit, "normals", "slot"..tostring(i)) then 
                normals[i] = Unit.get_data(unit, "normals", "slot"..tostring(i))     
            end
            if Unit.has_data(unit, "MABs", "slot"..tostring(i)) then 
                MABs[i] = Unit.get_data(unit, "MABs", "slot"..tostring(i))   
            end
            if Unit.has_data(unit, "emis_colors", "slot"..tostring(i)) then 
                emis_colors[i] = Unit.get_data(unit, "emis_colors", "slot"..tostring(i))               
            end
            if Unit.has_data(unit, "emis_details", "slot"..tostring(i)) then 
                emis_details[i] = Unit.get_data(unit, "emis_details", "slot"..tostring(i))              
            end
        end
        local color_slot = Unit.get_data(unit, "color_slot")
        local norm_slot = Unit.get_data(unit, "norm_slot")
        local MAB_slot = Unit.get_data(unit, "MAB_slot")
        local emis_col_slot = Unit.get_data(unit, "emis_col_slot")
        local emis_det_slot = Unit.get_data(unit, "emis_det_slot")
        local num_meshes = Unit.num_meshes(unit)
        for index, mat_slot in pairs(mat_slots) do 
            Unit.set_material(unit, mat_slot, mat)
            for i = 0, num_meshes - 1, 1 do
                local mesh = Unit.mesh(unit, i)
                local num_mats = Mesh.num_materials(mesh)
                for j = 0, num_mats - 1, 1 do
                    local mat = Mesh.material(mesh, j)
                    check_unit_slots(mat, color_slot, colors[index], unit)
                    check_unit_slots(mat, norm_slot, normals[index], unit)
                    check_unit_slots(mat, MAB_slot, MABs[index], unit)
                    check_unit_slots(mat, emis_col_slot, emis_colors[index], unit)
                    check_unit_slots(mat, emis_det_slot, emis_details[index], unit)
                end
            end
        end
    end 
end

mod:hook(GearUtils, "create_equipment",
function(func, world, slot_name, item_data, unit_1p, unit_3p, is_bot, unit_template, extra_extension_data, ammo_percent, override_item_template, override_item_units)
    replace_textures(unit_1p)
    replace_textures(unit_3p)
    return func(world, slot_name, item_data, unit_1p, unit_3p, is_bot, unit_template, extra_extension_data, ammo_percent, override_item_template, override_item_units)
end)

mod:hook(UnitSpawner, 'create_unit_extensions', function (func, self, world, unit, unit_template_name, extension_init_data)
    replace_textures(unit)
    return func(self, world, unit, unit_template_name, extension_init_data)
end)

mod:hook(HeroPreviewer, '_spawn_item_unit', function (func, self, unit, item_slot_type, item_template, unit_attachment_node_linking, scene_graph_links, material_settings)
    replace_textures(unit)
    return func(self, unit, item_slot_type, item_template, unit_attachment_node_linking, scene_graph_links, material_settings)
end)
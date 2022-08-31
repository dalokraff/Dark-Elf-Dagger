return {
	run = function()
		fassert(rawget(_G, "new_mod"), "`Dark-Elf-Dagger` mod must be lower than Vermintide Mod Framework in your launcher's load order.")

		new_mod("Dark-Elf-Dagger", {
			mod_script       = "scripts/mods/Dark-Elf-Dagger/Dark-Elf-Dagger",
			mod_data         = "scripts/mods/Dark-Elf-Dagger/Dark-Elf-Dagger_data",
			mod_localization = "scripts/mods/Dark-Elf-Dagger/Dark-Elf-Dagger_localization",
		})
	end,
	packages = {
		"resource_packages/Dark-Elf-Dagger/Dark-Elf-Dagger",
	},
}

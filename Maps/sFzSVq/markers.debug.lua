{
	{
		Groups = false,
		LootTableIds = {
			"LargeContainer",
		},
		handle = 81641472,
		map = "sFzSVq",
		name = 'InventoryItemSpawn#472 "Fridge"',
		path = "InventoryItemSpawn ",
		type = "InventoryItemSpawn",
	},
	{
		BanterGroups = {
			"Banters_Civilians",
			"Banters_Local_IlleMorat",
		},
		Groups = {
			"AmbietLife_North",
		},
		handle = 1040227347,
		map = "sFzSVq",
		name = "AmbientZone#347 (AmbietLife_North)",
		path = "AmbientZone ",
		type = "AmbientZone",
	},
	{
		BanterTriggerEffects = {
			PlaceObj('PlayBanterEffect', {
				Banters = {
					"IlleMoratInt_DrawingBoard_success",
				},
				banterSequentialWaitFor = "BanterLineStart",
				searchInMap = true,
				searchInMarker = false,
			}),
			PlaceObj('PlayBanterEffect', {
				Banters = {
					"IlleMoratInt_DrawingBoard_failure",
				},
				banterSequentialWaitFor = "BanterLineStart",
				searchInMap = true,
				searchInMarker = false,
			}),
		},
		Groups = {
			"Drawingboard_Examine",
		},
		handle = 1086630573,
		items = {
			{
				editor_view_abridged = "IlleMorat_DrawingboardDone = true",
				filter_type = "quest",
				reference_id = "CursedForestSideQuests",
				type = "QuestSetVariableBool",
				var = "IlleMorat_DrawingboardDone",
			},
			{
				editor_view_abridged = "Play banter(s): IlleMoratInt_DrawingBoard_success",
				filter_type = "banter",
				reference_id = "IlleMoratInt_DrawingBoard_success",
				type = "PlayBanterEffect",
			},
			{
				editor_view_abridged = "Play banter(s): IlleMoratInt_DrawingBoard_failure",
				filter_type = "banter",
				reference_id = "IlleMoratInt_DrawingBoard_failure",
				type = "PlayBanterEffect",
			},
		},
		map = "sFzSVq",
		name = 'CustomInteractable#573 "Examine" (Drawingboard_Examine)',
		path = "CustomInteractable ",
		type = "CustomInteractable",
	},
	{
		BanterGroups = {
			"SharedOverheard_Civilians",
		},
		Groups = {
			"Overheard_Civilian",
		},
		handle = 1088075036,
		map = "sFzSVq",
		name = "Position#036 (Overheard_Civilian)",
		path = "Position ",
		type = "Position",
	},
	{
		BanterGroups = {
			"SharedOverheard_Civilians",
		},
		Groups = {
			"Overheard_Civilian",
		},
		handle = 1101513165,
		map = "sFzSVq",
		name = "Position#165 (Overheard_Civilian)",
		path = "Position ",
		type = "Position",
	},
	{
		BanterGroups = {
			"Banters_Civilians",
			"Banters_Local_IlleMorat",
		},
		Groups = {
			"AmbietLife_Trashpit",
		},
		handle = 1120387543,
		map = "sFzSVq",
		name = "AmbientZone#543 (AmbietLife_Trashpit)",
		path = "AmbientZone ",
		type = "AmbientZone",
	},
	{
		BanterTriggerEffects = {
			PlaceObj('PlayBanterEffect', {
				Banters = {
					"IlleMoratInt_ Jacuzzi_success",
				},
				banterSequentialWaitFor = "BanterLineStart",
				searchInMap = true,
				searchInMarker = false,
			}),
			PlaceObj('PlayBanterEffect', {
				Banters = {
					"IlleMoratInt_ Jacuzzi_failure",
				},
				banterSequentialWaitFor = "BanterLineStart",
				searchInMap = true,
				searchInMarker = false,
			}),
		},
		Groups = {
			"JacuzziExamine",
		},
		handle = 1186439086,
		items = {
			{
				editor_view_abridged = "IlleMorat_JacuzziDone = true",
				filter_type = "quest",
				reference_id = "CursedForestSideQuests",
				type = "QuestSetVariableBool",
				var = "IlleMorat_JacuzziDone",
			},
			{
				editor_view_abridged = "Play banter(s): IlleMoratInt_ Jacuzzi_success",
				filter_type = "banter",
				reference_id = "IlleMoratInt_ Jacuzzi_success",
				type = "PlayBanterEffect",
			},
			{
				editor_view_abridged = "Play banter(s): IlleMoratInt_ Jacuzzi_failure",
				filter_type = "banter",
				reference_id = "IlleMoratInt_ Jacuzzi_failure",
				type = "PlayBanterEffect",
			},
		},
		map = "sFzSVq",
		name = 'CustomInteractable#086 "Examine" (JacuzziExamine)',
		path = "CustomInteractable ",
		type = "CustomInteractable",
	},
	{
		BanterTriggerEffects = {
			PlaceObj('PlayBanterEffect', {
				Banters = {
					"IlleMoratInt_ TrapDoor_noIntel",
				},
				banterSequentialWaitFor = "BanterLineStart",
				searchInMap = true,
				searchInMarker = false,
			}),
		},
		Groups = {
			"TrapDoor_Examine",
		},
		handle = 1228066198,
		items = {
			{
				editor_view_abridged = "Play banter(s): IlleMoratInt_ TrapDoor_noIntel",
				filter_type = "banter",
				reference_id = "IlleMoratInt_ TrapDoor_noIntel",
				type = "PlayBanterEffect",
			},
		},
		map = "sFzSVq",
		name = 'CustomInteractable#198 "Examine" (TrapDoor_Examine)',
		path = "CustomInteractable ",
		type = "CustomInteractable",
	},
	{
		BanterTriggerEffects = {
			PlaceObj('PlayBanterEffect', {
				Banters = {
					"Stall_Gunpowder",
				},
				banterSequentialWaitFor = "BanterStart",
				searchInMap = true,
				searchInMarker = false,
			}),
		},
		Groups = false,
		handle = 1250806620,
		items = {
			{
				editor_view_abridged = "Play banter(s): Stall_Gunpowder",
				filter_type = "banter",
				reference_id = "Stall_Gunpowder",
				type = "PlayBanterEffect",
			},
		},
		map = "sFzSVq",
		name = 'CustomInteractable#620 "Examine"',
		path = "CustomInteractable ",
		type = "CustomInteractable",
	},
	{
		Groups = {
			"LegionActor2",
		},
		handle = 1257172008,
		items = {
			{
				editor_view_abridged = "if not IlleMorat_FirstEnter",
				filter_type = "quest",
				reference_id = "Beast",
				type = "QuestIsVariableBool",
				var = set({
	IlleMorat_FirstEnter = false,
}),
			},
		},
		map = "sFzSVq",
		name = "DefenderPriority#008 (LegionActor2)",
		path = "DefenderPriority ",
		type = "DefenderPriority",
	},
	{
		BanterTriggerEffects = {
			PlaceObj('PlayBanterEffect', {
				Banters = {
					"IlleMoratInt_LightPylon_turnon",
				},
				banterSequentialWaitFor = "BanterLineStart",
				searchInMap = true,
				searchInMarker = false,
			}),
			PlaceObj('PlayBanterEffect', {
				Banters = {
					"IlleMoratInt_LightPylon_not_night",
				},
				banterSequentialWaitFor = "BanterLineStart",
				searchInMap = true,
				searchInMarker = false,
			}),
		},
		Groups = {
			"LightPilon_Toggle",
		},
		handle = 1316388736,
		items = {
			{
				editor_view_abridged = "if LightPylonSuccess",
				filter_type = "quest",
				reference_id = "Beast",
				type = "QuestIsVariableBool",
				var = set( "LightPylonSuccess" ),
			},
			{
				editor_view_abridged = "if not BeastEffigyOn",
				filter_type = "quest",
				reference_id = "Beast",
				type = "QuestIsVariableBool",
				var = set({
	BeastEffigyOn = false,
}),
			},
			{
				editor_view_abridged = "BeastEffigyOn = true",
				filter_type = "quest",
				reference_id = "Beast",
				type = "QuestSetVariableBool",
				var = "BeastEffigyOn",
			},
			{
				editor_view_abridged = "Play banter(s): IlleMoratInt_LightPylon_turnon",
				filter_type = "banter",
				reference_id = "IlleMoratInt_LightPylon_turnon",
				type = "PlayBanterEffect",
			},
			{
				editor_view_abridged = "Play banter(s): IlleMoratInt_LightPylon_not_night",
				filter_type = "banter",
				reference_id = "IlleMoratInt_LightPylon_not_night",
				type = "PlayBanterEffect",
			},
		},
		map = "sFzSVq",
		name = 'CustomInteractable#736 "Turn On" (LightPilon_Toggle)',
		path = "CustomInteractable ",
		type = "CustomInteractable",
	},
	{
		BanterGroups = {
			"SharedOverheard_Enemies",
		},
		Groups = {
			"Overheard_Enemies",
		},
		handle = 1434858034,
		map = "sFzSVq",
		name = "Position#034 (Overheard_Enemies)",
		path = "Position ",
		type = "Position",
	},
	{
		BanterTriggerEffects = {
			PlaceObj('PlayBanterEffect', {
				Banters = {
					"IlleMoratInt_EffigyOn",
				},
				banterSequentialWaitFor = "BanterLineStart",
				searchInMap = true,
				searchInMarker = false,
			}),
			PlaceObj('PlayBanterEffect', {
				Banters = {
					"IlleMoratInt_EffigyOff",
				},
				banterSequentialWaitFor = "BanterLineStart",
				searchInMap = true,
				searchInMarker = false,
			}),
		},
		Groups = {
			"EffigyExamine",
		},
		handle = 1510590706,
		items = {
			{
				editor_view_abridged = "if BeastEffigyOn",
				filter_type = "quest",
				reference_id = "Beast",
				type = "QuestIsVariableBool",
				var = set( "BeastEffigyOn" ),
			},
			{
				editor_view_abridged = "Play banter(s): IlleMoratInt_EffigyOn",
				filter_type = "banter",
				reference_id = "IlleMoratInt_EffigyOn",
				type = "PlayBanterEffect",
			},
			{
				editor_view_abridged = "Play banter(s): IlleMoratInt_EffigyOff",
				filter_type = "banter",
				reference_id = "IlleMoratInt_EffigyOff",
				type = "PlayBanterEffect",
			},
		},
		map = "sFzSVq",
		name = 'CustomInteractable#706 "Examine" (EffigyExamine)',
		path = "CustomInteractable ",
		type = "CustomInteractable",
	},
	{
		BanterTriggerEffects = {
			PlaceObj('PlayBanterEffect', {
				Banters = {
					"IlleMoratInt_ TrapDoor_success",
				},
				banterSequentialWaitFor = "BanterLineStart",
				searchInMap = true,
				searchInMarker = false,
			}),
			PlaceObj('PlayBanterEffect', {
				Banters = {
					"IlleMoratInt_ TrapDoor_failure",
				},
				banterSequentialWaitFor = "BanterLineStart",
				searchInMap = true,
				searchInMarker = false,
			}),
		},
		Groups = {
			"TrapdoorSkillCheck",
		},
		handle = 1578358143,
		items = {
			{
				editor_view_abridged = "IlleMorat_TrapDoorDone = true",
				filter_type = "quest",
				reference_id = "CursedForestSideQuests",
				type = "QuestSetVariableBool",
				var = "IlleMorat_TrapDoorDone",
			},
			{
				editor_view_abridged = "Play banter(s): IlleMoratInt_ TrapDoor_success",
				filter_type = "banter",
				reference_id = "IlleMoratInt_ TrapDoor_success",
				type = "PlayBanterEffect",
			},
			{
				editor_view_abridged = "Play banter(s): IlleMoratInt_ TrapDoor_failure",
				filter_type = "banter",
				reference_id = "IlleMoratInt_ TrapDoor_failure",
				type = "PlayBanterEffect",
			},
		},
		map = "sFzSVq",
		name = 'CustomInteractable#143 "Search" (TrapdoorSkillCheck)',
		path = "CustomInteractable ",
		type = "CustomInteractable",
	},
	{
		BanterTriggerEffects = {
			PlaceObj('PlayBanterEffect', {
				Banters = {
					"IlleMoratInt_LightPylon_success",
				},
				banterSequentialWaitFor = "BanterLineStart",
				searchInMap = true,
				searchInMarker = false,
			}),
			PlaceObj('PlayBanterEffect', {
				Banters = {
					"IlleMoratInt_LightPylon_failure",
				},
				banterSequentialWaitFor = "BanterLineStart",
				searchInMap = true,
				searchInMarker = false,
			}),
		},
		Groups = {
			"LightPilon_SkillCheck",
		},
		handle = 1660719051,
		items = {
			{
				editor_view_abridged = "LightPylonSuccess = true",
				filter_type = "quest",
				reference_id = "Beast",
				type = "QuestSetVariableBool",
				var = "LightPylonSuccess",
			},
			{
				editor_view_abridged = "Play banter(s): IlleMoratInt_LightPylon_success",
				filter_type = "banter",
				reference_id = "IlleMoratInt_LightPylon_success",
				type = "PlayBanterEffect",
			},
			{
				editor_view_abridged = "Play banter(s): IlleMoratInt_LightPylon_failure",
				filter_type = "banter",
				reference_id = "IlleMoratInt_LightPylon_failure",
				type = "PlayBanterEffect",
			},
		},
		map = "sFzSVq",
		name = 'CustomInteractable#051 "Activate" (LightPilon_SkillCheck)',
		path = "CustomInteractable ",
		type = "CustomInteractable",
	},
	{
		BanterGroups = {
			"SharedOverheard_Civilians",
		},
		Groups = {
			"Overheard_Civilian",
		},
		handle = 1685646199,
		map = "sFzSVq",
		name = "Position#199 (Overheard_Civilian)",
		path = "Position ",
		type = "Position",
	},
	{
		BanterTriggerEffects = {
			PlaceObj('BanterHasPlayed', {
				Banters = {
					"Stall_Gunpowder",
				},
			}),
		},
		Groups = false,
		handle = 1767908779,
		items = {
			{
				editor_view_abridged = "if Vendor_GeneralOneDay_03_CD:VendorTracker has passed.",
				filter_type = "quest",
				reference_id = "VendorTracker",
				type = "QuestHasTimerPassed",
			},
			{
				editor_view_abridged = "Set quest timer in VendorTracker:Vendor_GeneralOneDay_03_CD for after 24 h",
				filter_type = "quest",
				reference_id = "VendorTracker",
				type = "QuestSetVariableTimer",
				var = "Vendor_GeneralOneDay_03_CD",
			},
			{
				editor_view_abridged = "If any of banter(s) played: Stall_Gunpowder",
				filter_type = "banter",
				reference_id = "Stall_Gunpowder",
				type = "BanterHasPlayed",
			},
		},
		map = "sFzSVq",
		name = 'CustomInteractable#779 "Buy Gunpowder for $300"',
		path = "CustomInteractable ",
		type = "CustomInteractable",
	},
	{
		BanterGroups = {
			"Banters_Civilians",
			"Banters_Local_IlleMorat",
		},
		Groups = {
			"AmbietLife_Shacks",
		},
		handle = 1890051478,
		map = "sFzSVq",
		name = "AmbientZone#478 (AmbietLife_Shacks)",
		path = "AmbientZone ",
		type = "AmbientZone",
	},
}
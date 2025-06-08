{
	{
		Groups = false,
		LootTableIds = {
			"SmallContainer",
		},
		handle = 137191424,
		map = "FinalStandD7",
		name = 'InventoryItemSpawn#424 "BAG"',
		path = "InventoryItemSpawn ",
		type = "InventoryItemSpawn",
	},
	{
		Groups = false,
		LootTableIds = {
			"SmallContainer",
		},
		handle = 145031168,
		map = "FinalStandD7",
		name = 'InventoryItemSpawn#168 "CONTAINER"',
		path = "InventoryItemSpawn ",
		type = "InventoryItemSpawn",
	},
	{
		Groups = false,
		LootTableIds = {
			"LargeContainer",
		},
		handle = 183828480,
		map = "FinalStandD7",
		name = 'InventoryItemSpawn#480 "CONTAINER"',
		path = "InventoryItemSpawn ",
		type = "InventoryItemSpawn",
	},
	{
		Groups = false,
		LootTableIds = {
			"SmallContainer",
		},
		handle = 381083648,
		map = "FinalStandD7",
		name = 'InventoryItemSpawn#648 "PILE"',
		path = "InventoryItemSpawn ",
		type = "InventoryItemSpawn",
	},
	{
		Groups = false,
		LootTableIds = {
			"LargeContainer",
		},
		handle = 484728832,
		map = "FinalStandD7",
		name = 'InventoryItemSpawn#832 "CONTAINER"',
		path = "InventoryItemSpawn ",
		type = "InventoryItemSpawn",
	},
	{
		Groups = false,
		LootTableIds = {
			"SmallContainer",
		},
		handle = 560136192,
		map = "FinalStandD7",
		name = 'InventoryItemSpawn#192 "CONTAINER"',
		path = "InventoryItemSpawn ",
		type = "InventoryItemSpawn",
	},
	{
		Groups = false,
		LootTableIds = {
			"SmallContainer_Exceptional",
		},
		handle = 978501632,
		map = "FinalStandD7",
		name = 'InventoryItemSpawn#632 "PILE"',
		path = "InventoryItemSpawn ",
		type = "InventoryItemSpawn",
	},
	{
		BanterTriggerEffects = {
			PlaceObj('PlayBanterEffect', {
				Banters = {
					"Reaction_Tex_Movie_Rambo",
				},
			}),
		},
		Groups = {
			"TexMoviePoster_Rambo",
		},
		handle = 1024564462,
		items = {
			{
				editor_view_abridged = "Play banter(s): Reaction_Tex_Movie_Rambo",
				filter_type = "banter",
				reference_id = "Reaction_Tex_Movie_Rambo",
				type = "PlayBanterEffect",
			},
		},
		map = "FinalStandD7",
		name = "Logic#462 (TexMoviePoster_Rambo)",
		path = "Logic ",
		type = "Logic",
	},
	{
		BanterGroups = {
			"Banters_Civilians",
			"Banters_Local_Pantagruel",
		},
		Groups = {
			"WorkingGirlActor2",
		},
		handle = 1097631616,
		items = {},
		map = "FinalStandD7",
		name = "UnitMarker#616 (WorkingGirlActor2)",
		path = "UnitMarker ",
		type = "UnitMarker",
	},
	{
		BanterGroups = {
			"Banters_Civilians",
			"Banters_Local_Pantagruel",
		},
		Groups = {
			"AL_RedLights",
		},
		handle = 1112550129,
		map = "FinalStandD7",
		name = "AmbientZone#129 (AL_RedLights)",
		path = "AmbientZone ",
		type = "AmbientZone",
	},
	{
		BanterGroups = {
			"Banters_Civilians",
			"Banters_Local_Pantagruel",
		},
		Groups = {
			"AL_TestZone",
		},
		handle = 1114804448,
		map = "FinalStandD7",
		name = "AmbientZone#448 (AL_TestZone)",
		path = "AmbientZone ",
		type = "AmbientZone",
	},
	{
		BanterGroups = {
			"Banters_Civilians",
			"Banters_Local_Pantagruel",
		},
		Groups = {
			"AL_Square",
		},
		handle = 1163028035,
		map = "FinalStandD7",
		name = "AmbientZone#035 (AL_Square)",
		path = "AmbientZone ",
		type = "AmbientZone",
	},
	{
		BanterGroups = {
			"SharedOverheard_Civilians",
		},
		Groups = {
			"Overheard_Civilian",
		},
		handle = 1189127104,
		map = "FinalStandD7",
		name = "Position#104 (Overheard_Civilian)",
		path = "Position ",
		type = "Position",
	},
	{
		Groups = {
			"InvestigateCrimeScene_IntelMarker",
		},
		handle = 1212704619,
		items = {
			{
				editor_view_abridged = "if not CrimeSceneChecked and InvestigateCrimeScene",
				filter_type = "quest",
				reference_id = "Smiley",
				type = "QuestIsVariableBool",
				var = set({
	CrimeSceneChecked = false,
	InvestigateCrimeScene = true,
}),
			},
		},
		map = "FinalStandD7",
		name = "Intel#619 (InvestigateCrimeScene_IntelMarker)",
		path = "Intel ",
		type = "Intel",
	},
	{
		Groups = false,
		handle = 1410689076,
		items = {
			{
				editor_view_abridged = "MoveThugs = true",
				filter_type = "quest",
				reference_id = "PantagruelLostAndFound",
				type = "QuestSetVariableBool",
				var = "MoveThugs",
			},
		},
		map = "FinalStandD7",
		name = "Position#076",
		path = "Position ",
		type = "Position",
	},
	{
		BanterGroups = {
			"SharedOverheard_Enemies",
		},
		Groups = {
			"Overheard_Enemies",
		},
		handle = 1503630778,
		map = "FinalStandD7",
		name = "Position#778 (Overheard_Enemies)",
		path = "Position ",
		type = "Position",
	},
	{
		BanterTriggerEffects = {
			PlaceObj('PlayBanterEffect', {
				Banters = {
					"Pantagruel_Examine_SignScarletLily",
				},
				banterSequentialWaitFor = "BanterStart",
				searchInMap = true,
				searchInMarker = false,
			}),
		},
		Groups = false,
		handle = 1523062886,
		items = {
			{
				editor_view_abridged = "Play banter(s): Pantagruel_Examine_SignScarletLily",
				filter_type = "banter",
				reference_id = "Pantagruel_Examine_SignScarletLily",
				type = "PlayBanterEffect",
			},
		},
		map = "FinalStandD7",
		name = 'CustomInteractable#886 "Examine"',
		path = "CustomInteractable ",
		type = "CustomInteractable",
	},
	{
		BanterGroups = {
			"Banters_Civilians",
			"Banters_Local_Pantagruel",
		},
		Groups = {
			"AL_RedLights",
		},
		handle = 1589065312,
		map = "FinalStandD7",
		name = "AmbientZone#312 (AL_RedLights)",
		path = "AmbientZone ",
		type = "AmbientZone",
	},
	{
		BanterGroups = {
			"SharedOverheard_Civilians",
		},
		Groups = {
			"Overheard_Civilian",
		},
		handle = 1657796107,
		map = "FinalStandD7",
		name = "Position#107 (Overheard_Civilian)",
		path = "Position ",
		type = "Position",
	},
	{
		BanterGroups = {
			"Banters_Civilians",
			"Banters_Local_Pantagruel",
		},
		Groups = {
			"WorkingGirlActor1",
		},
		handle = 1708673443,
		items = {},
		map = "FinalStandD7",
		name = "UnitMarker#443 (WorkingGirlActor1)",
		path = "UnitMarker ",
		type = "UnitMarker",
	},
	{
		BanterGroups = {
			"SharedOverheard_Enemies",
		},
		Groups = {
			"Overheard_Enemies",
		},
		handle = 1792185441,
		map = "FinalStandD7",
		name = "Position#441 (Overheard_Enemies)",
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
		handle = 1895503549,
		map = "FinalStandD7",
		name = "Position#549 (Overheard_Civilian)",
		path = "Position ",
		type = "Position",
	},
}
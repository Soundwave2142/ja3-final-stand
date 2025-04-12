{
	{
		Groups = false,
		LootTableIds = {
			"RimvilleGlobeLoot",
		},
		handle = 282337280,
		items = {
			{
				editor_view_abridged = "if RimvilleGlobe_Opened",
				filter_type = "quest",
				reference_id = "FleatownGeneral",
				type = "QuestIsVariableBool",
				var = set( "RimvilleGlobe_Opened" ),
			},
		},
		map = "HHhAPrv",
		name = 'InventoryItemSpawn#280 "SECRET STASH"',
		path = "InventoryItemSpawn ",
		type = "InventoryItemSpawn",
	},
	{
		Groups = false,
		LootTableIds = {
			"LargeContainer_Exceptional",
		},
		handle = 512483328,
		map = "HHhAPrv",
		name = 'InventoryItemSpawn#328 "Locker"',
		path = "InventoryItemSpawn ",
		type = "InventoryItemSpawn",
	},
	{
		Groups = {
			"12Chairs_ChairMarker",
		},
		handle = 1162093880,
		items = {
			{
				editor_view_abridged = "NearChair = true",
				filter_type = "quest",
				reference_id = "TheTwelveChairs",
				type = "QuestSetVariableBool",
				var = "NearChair",
			},
			{
				editor_view_abridged = "NearChair = false",
				filter_type = "quest",
				reference_id = "TheTwelveChairs",
				type = "QuestSetVariableBool",
				var = "NearChair",
			},
		},
		map = "HHhAPrv",
		name = 'CustomInteractable#880 "Examine" (12Chairs_ChairMarker)',
		path = "CustomInteractable ",
		type = "CustomInteractable",
	},
	{
		BanterTriggerEffects = {
			PlaceObj('PlayBanterEffect', {
				Banters = {
					"RimvilleGlobeLock_success",
				},
				banterSequentialWaitFor = "BanterLineStart",
				searchInMap = true,
				searchInMarker = false,
			}),
			PlaceObj('PlayBanterEffect', {
				Banters = {
					"RimvilleGlobeLock_failure",
				},
				banterSequentialWaitFor = "BanterStart",
				searchInMap = true,
				searchInMarker = false,
			}),
		},
		Groups = {
			"GlobeStash",
		},
		handle = 1237444012,
		items = {
			{
				editor_view_abridged = "if RimvilleGlobe_Given",
				filter_type = "quest",
				reference_id = "FleatownGeneral",
				type = "QuestIsVariableBool",
				var = set( "RimvilleGlobe_Given" ),
			},
			{
				editor_view_abridged = "RimvilleGlobe_Opened = true",
				filter_type = "quest",
				reference_id = "FleatownGeneral",
				type = "QuestSetVariableBool",
				var = "RimvilleGlobe_Opened",
			},
			{
				editor_view_abridged = "Play banter(s): RimvilleGlobeLock_success",
				filter_type = "banter",
				reference_id = "RimvilleGlobeLock_success",
				type = "PlayBanterEffect",
			},
			{
				editor_view_abridged = "Play banter(s): RimvilleGlobeLock_failure",
				filter_type = "banter",
				reference_id = "RimvilleGlobeLock_failure",
				type = "PlayBanterEffect",
			},
		},
		map = "HHhAPrv",
		name = 'CustomInteractable#012 "Examine" (GlobeStash)',
		path = "CustomInteractable ",
		type = "CustomInteractable",
	},
}
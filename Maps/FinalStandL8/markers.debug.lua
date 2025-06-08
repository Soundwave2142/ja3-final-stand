{
	{
		Groups = false,
		LootTableIds = {
			"SmallContainer",
		},
		handle = 314605568,
		map = "FinalStandL8",
		name = 'InventoryItemSpawn#568 "Shelf"',
		path = "InventoryItemSpawn ",
		type = "InventoryItemSpawn",
	},
	{
		BanterTriggerEffects = {
			PlaceObj('BanterHasPlayed', {
				Banters = {
					"PortCacao_interactable_HiddenStash",
				},
			}),
		},
		Groups = false,
		LootTableIds = {
			"RuinsTreasureRandom",
		},
		handle = 342106112,
		items = {
			{
				editor_view_abridged = "FredericStashRobbed = true",
				filter_type = "quest",
				reference_id = "PortCacaoSideQuests",
				type = "QuestSetVariableBool",
				var = "FredericStashRobbed",
			},
			{
				editor_view_abridged = "If any of banter(s) played: PortCacao_interactable_HiddenStash",
				filter_type = "banter",
				reference_id = "PortCacao_interactable_HiddenStash",
				type = "BanterHasPlayed",
			},
		},
		map = "FinalStandL8",
		name = 'InventoryItemSpawn#112 "SECRET STASH"',
		path = "InventoryItemSpawn ",
		type = "InventoryItemSpawn",
	},
	{
		Groups = false,
		LootTableIds = {
			"SmallContainer",
		},
		handle = 456327168,
		map = "FinalStandL8",
		name = 'InventoryItemSpawn#168 "PILE"',
		path = "InventoryItemSpawn ",
		type = "InventoryItemSpawn",
	},
	{
		BanterTriggerEffects = {
			PlaceObj('BanterHasPlayed', {
				Banters = {
					"PortCacao_interactable_MoneyLoot",
				},
			}),
		},
		Groups = {
			"MoneyPiles",
		},
		LootTableIds = {
			"PilesOfCash",
		},
		handle = 469106688,
		items = {
			{
				editor_view_abridged = "If any of banter(s) played: PortCacao_interactable_MoneyLoot",
				filter_type = "banter",
				reference_id = "PortCacao_interactable_MoneyLoot",
				type = "BanterHasPlayed",
			},
		},
		map = "FinalStandL8",
		name = 'InventoryItemSpawn#688 "PILE" (MoneyPiles)',
		path = "InventoryItemSpawn ",
		type = "InventoryItemSpawn",
	},
	{
		Groups = false,
		LootTableIds = {
			"SmallContainer_Exceptional",
		},
		handle = 852410368,
		map = "FinalStandL8",
		name = 'InventoryItemSpawn#368 "Shelf"',
		path = "InventoryItemSpawn ",
		type = "InventoryItemSpawn",
	},
	{
		Groups = false,
		handle = 1009550551,
		items = {
			{
				editor_view_abridged = "if TCE_LiberatedPortCacao",
				filter_type = "quest",
				reference_id = "PortCacaoSideQuests",
				type = "QuestIsTCEState",
				var = "TCE_LiberatedPortCacao",
			},
		},
		map = "FinalStandL8",
		name = "DefenderPriority#551",
		path = "DefenderPriority ",
		type = "DefenderPriority",
	},
	{
		BanterGroups = {
			"SharedOverheard_Civilians",
		},
		Groups = {
			"Overheard_Civilians",
		},
		handle = 1028997451,
		map = "FinalStandL8",
		name = "Position#451 (Overheard_Civilians)",
		path = "Position ",
		type = "Position",
	},
	{
		BanterTriggerEffects = {
			PlaceObj('PlayBanterEffect', {
				Banters = {
					"PortCacao_interactable_JunkShop_deal01",
					"PortCacao_interactable_JunkShop_deal02",
					"PortCacao_interactable_JunkShop_deal03",
					"PortCacao_interactable_JunkShop_success01",
					"PortCacao_interactable_JunkShop_success02",
					"PortCacao_interactable_JunkShop_success03",
				},
				banterSequentialWaitFor = "BanterStart",
				searchInMap = true,
				searchInMarker = false,
			}),
			PlaceObj('PlayBanterEffect', {
				Banters = {
					"PortCacao_interactable_JunkShop_failure01",
					"PortCacao_interactable_JunkShop_failure02",
					"PortCacao_interactable_JunkShop_failure03",
				},
				searchInMap = true,
				searchInMarker = false,
			}),
		},
		Groups = {
			"SpecialParts",
		},
		handle = 1246818904,
		items = {
			{
				editor_view_abridged = "if JunkShop_SpecialParts_CD:VendorTracker has passed.",
				filter_type = "quest",
				reference_id = "VendorTracker",
				type = "QuestHasTimerPassed",
			},
			{
				editor_view_abridged = "Set quest timer in VendorTracker:JunkShop_SpecialParts_CD for after 240 h",
				filter_type = "quest",
				reference_id = "VendorTracker",
				type = "QuestSetVariableTimer",
				var = "JunkShop_SpecialParts_CD",
			},
			{
				editor_view_abridged = "Play banter(s): PortCacao_interactable_JunkShop_deal01, PortCacao_interactable_JunkShop_deal02, PortCacao_interactable_JunkShop_deal03, PortCacao_interactable_JunkShop_success01, PortCacao_interactable_JunkShop_success02, PortCacao_interactable_JunkShop_success03",
				filter_type = "banter",
				reference_id = "PortCacao_interactable_JunkShop_deal01",
				type = "PlayBanterEffect",
			},
			{
				editor_view_abridged = "Play banter(s): PortCacao_interactable_JunkShop_deal01, PortCacao_interactable_JunkShop_deal02, PortCacao_interactable_JunkShop_deal03, PortCacao_interactable_JunkShop_success01, PortCacao_interactable_JunkShop_success02, PortCacao_interactable_JunkShop_success03",
				filter_type = "banter",
				reference_id = "PortCacao_interactable_JunkShop_deal02",
				type = "PlayBanterEffect",
			},
			{
				editor_view_abridged = "Play banter(s): PortCacao_interactable_JunkShop_deal01, PortCacao_interactable_JunkShop_deal02, PortCacao_interactable_JunkShop_deal03, PortCacao_interactable_JunkShop_success01, PortCacao_interactable_JunkShop_success02, PortCacao_interactable_JunkShop_success03",
				filter_type = "banter",
				reference_id = "PortCacao_interactable_JunkShop_deal03",
				type = "PlayBanterEffect",
			},
			{
				editor_view_abridged = "Play banter(s): PortCacao_interactable_JunkShop_deal01, PortCacao_interactable_JunkShop_deal02, PortCacao_interactable_JunkShop_deal03, PortCacao_interactable_JunkShop_success01, PortCacao_interactable_JunkShop_success02, PortCacao_interactable_JunkShop_success03",
				filter_type = "banter",
				reference_id = "PortCacao_interactable_JunkShop_success01",
				type = "PlayBanterEffect",
			},
			{
				editor_view_abridged = "Play banter(s): PortCacao_interactable_JunkShop_deal01, PortCacao_interactable_JunkShop_deal02, PortCacao_interactable_JunkShop_deal03, PortCacao_interactable_JunkShop_success01, PortCacao_interactable_JunkShop_success02, PortCacao_interactable_JunkShop_success03",
				filter_type = "banter",
				reference_id = "PortCacao_interactable_JunkShop_success02",
				type = "PlayBanterEffect",
			},
			{
				editor_view_abridged = "Play banter(s): PortCacao_interactable_JunkShop_deal01, PortCacao_interactable_JunkShop_deal02, PortCacao_interactable_JunkShop_deal03, PortCacao_interactable_JunkShop_success01, PortCacao_interactable_JunkShop_success02, PortCacao_interactable_JunkShop_success03",
				filter_type = "banter",
				reference_id = "PortCacao_interactable_JunkShop_success03",
				type = "PlayBanterEffect",
			},
			{
				editor_view_abridged = "Play banter(s): PortCacao_interactable_JunkShop_failure01, PortCacao_interactable_JunkShop_failure02, PortCacao_interactable_JunkShop_failure03",
				filter_type = "banter",
				reference_id = "PortCacao_interactable_JunkShop_failure01",
				type = "PlayBanterEffect",
			},
			{
				editor_view_abridged = "Play banter(s): PortCacao_interactable_JunkShop_failure01, PortCacao_interactable_JunkShop_failure02, PortCacao_interactable_JunkShop_failure03",
				filter_type = "banter",
				reference_id = "PortCacao_interactable_JunkShop_failure02",
				type = "PlayBanterEffect",
			},
			{
				editor_view_abridged = "Play banter(s): PortCacao_interactable_JunkShop_failure01, PortCacao_interactable_JunkShop_failure02, PortCacao_interactable_JunkShop_failure03",
				filter_type = "banter",
				reference_id = "PortCacao_interactable_JunkShop_failure03",
				type = "PlayBanterEffect",
			},
		},
		map = "FinalStandL8",
		name = 'CustomInteractable#904 "Trade Money Bag for Special Parts" (SpecialParts)',
		path = "CustomInteractable ",
		type = "CustomInteractable",
	},
	{
		Groups = false,
		handle = 1311383933,
		items = {
			{
				editor_view_abridged = "if TCE_LiberatedPortCacao",
				filter_type = "quest",
				reference_id = "PortCacaoSideQuests",
				type = "QuestIsTCEState",
				var = "TCE_LiberatedPortCacao",
			},
		},
		map = "FinalStandL8",
		name = "DefenderPriority#933",
		path = "DefenderPriority ",
		type = "DefenderPriority",
	},
	{
		BanterTriggerEffects = {
			PlaceObj('PlayBanterEffect', {
				Banters = {
					"PortCacao_interactable_MoneyLoot",
				},
				banterSequentialWaitFor = "BanterStart",
				searchInMap = true,
				searchInMarker = false,
			}),
		},
		Groups = {
			"ChienFranks",
		},
		handle = 1311766277,
		items = {
			{
				editor_view_abridged = "Play banter(s): PortCacao_interactable_MoneyLoot",
				filter_type = "banter",
				reference_id = "PortCacao_interactable_MoneyLoot",
				type = "PlayBanterEffect",
			},
		},
		map = "FinalStandL8",
		name = 'CustomInteractable#277 "Loot" (ChienFranks)',
		path = "CustomInteractable ",
		type = "CustomInteractable",
	},
	{
		BanterTriggerEffects = {
			PlaceObj('PlayBanterEffect', {
				Banters = {
					"PortCacao_interactable_JunkShop_deal01",
					"PortCacao_interactable_JunkShop_deal02",
					"PortCacao_interactable_JunkShop_deal03",
					"PortCacao_interactable_JunkShop_success01",
					"PortCacao_interactable_JunkShop_success02",
					"PortCacao_interactable_JunkShop_success03",
				},
				banterSequentialWaitFor = "BanterStart",
				searchInMap = true,
				searchInMarker = false,
			}),
			PlaceObj('PlayBanterEffect', {
				Banters = {
					"PortCacao_interactable_JunkShop_failure01",
					"PortCacao_interactable_JunkShop_failure02",
					"PortCacao_interactable_JunkShop_failure03",
				},
				searchInMap = true,
				searchInMarker = false,
			}),
		},
		Groups = {
			"DetonatorParts",
		},
		handle = 1319599131,
		items = {
			{
				editor_view_abridged = "if JunkShop_DetonatorParts_CD:VendorTracker has passed.",
				filter_type = "quest",
				reference_id = "VendorTracker",
				type = "QuestHasTimerPassed",
			},
			{
				editor_view_abridged = "Set quest timer in VendorTracker:JunkShop_DetonatorParts_CD for after 240 h",
				filter_type = "quest",
				reference_id = "VendorTracker",
				type = "QuestSetVariableTimer",
				var = "JunkShop_DetonatorParts_CD",
			},
			{
				editor_view_abridged = "Play banter(s): PortCacao_interactable_JunkShop_deal01, PortCacao_interactable_JunkShop_deal02, PortCacao_interactable_JunkShop_deal03, PortCacao_interactable_JunkShop_success01, PortCacao_interactable_JunkShop_success02, PortCacao_interactable_JunkShop_success03",
				filter_type = "banter",
				reference_id = "PortCacao_interactable_JunkShop_deal01",
				type = "PlayBanterEffect",
			},
			{
				editor_view_abridged = "Play banter(s): PortCacao_interactable_JunkShop_deal01, PortCacao_interactable_JunkShop_deal02, PortCacao_interactable_JunkShop_deal03, PortCacao_interactable_JunkShop_success01, PortCacao_interactable_JunkShop_success02, PortCacao_interactable_JunkShop_success03",
				filter_type = "banter",
				reference_id = "PortCacao_interactable_JunkShop_deal02",
				type = "PlayBanterEffect",
			},
			{
				editor_view_abridged = "Play banter(s): PortCacao_interactable_JunkShop_deal01, PortCacao_interactable_JunkShop_deal02, PortCacao_interactable_JunkShop_deal03, PortCacao_interactable_JunkShop_success01, PortCacao_interactable_JunkShop_success02, PortCacao_interactable_JunkShop_success03",
				filter_type = "banter",
				reference_id = "PortCacao_interactable_JunkShop_deal03",
				type = "PlayBanterEffect",
			},
			{
				editor_view_abridged = "Play banter(s): PortCacao_interactable_JunkShop_deal01, PortCacao_interactable_JunkShop_deal02, PortCacao_interactable_JunkShop_deal03, PortCacao_interactable_JunkShop_success01, PortCacao_interactable_JunkShop_success02, PortCacao_interactable_JunkShop_success03",
				filter_type = "banter",
				reference_id = "PortCacao_interactable_JunkShop_success01",
				type = "PlayBanterEffect",
			},
			{
				editor_view_abridged = "Play banter(s): PortCacao_interactable_JunkShop_deal01, PortCacao_interactable_JunkShop_deal02, PortCacao_interactable_JunkShop_deal03, PortCacao_interactable_JunkShop_success01, PortCacao_interactable_JunkShop_success02, PortCacao_interactable_JunkShop_success03",
				filter_type = "banter",
				reference_id = "PortCacao_interactable_JunkShop_success02",
				type = "PlayBanterEffect",
			},
			{
				editor_view_abridged = "Play banter(s): PortCacao_interactable_JunkShop_deal01, PortCacao_interactable_JunkShop_deal02, PortCacao_interactable_JunkShop_deal03, PortCacao_interactable_JunkShop_success01, PortCacao_interactable_JunkShop_success02, PortCacao_interactable_JunkShop_success03",
				filter_type = "banter",
				reference_id = "PortCacao_interactable_JunkShop_success03",
				type = "PlayBanterEffect",
			},
			{
				editor_view_abridged = "Play banter(s): PortCacao_interactable_JunkShop_failure01, PortCacao_interactable_JunkShop_failure02, PortCacao_interactable_JunkShop_failure03",
				filter_type = "banter",
				reference_id = "PortCacao_interactable_JunkShop_failure01",
				type = "PlayBanterEffect",
			},
			{
				editor_view_abridged = "Play banter(s): PortCacao_interactable_JunkShop_failure01, PortCacao_interactable_JunkShop_failure02, PortCacao_interactable_JunkShop_failure03",
				filter_type = "banter",
				reference_id = "PortCacao_interactable_JunkShop_failure02",
				type = "PlayBanterEffect",
			},
			{
				editor_view_abridged = "Play banter(s): PortCacao_interactable_JunkShop_failure01, PortCacao_interactable_JunkShop_failure02, PortCacao_interactable_JunkShop_failure03",
				filter_type = "banter",
				reference_id = "PortCacao_interactable_JunkShop_failure03",
				type = "PlayBanterEffect",
			},
		},
		map = "FinalStandL8",
		name = 'CustomInteractable#131 "Trade Money Bag for Detonator Parts" (DetonatorParts)',
		path = "CustomInteractable ",
		type = "CustomInteractable",
	},
	{
		BanterTriggerEffects = {
			PlaceObj('PlayBanterEffect', {
				Banters = {
					"PortCacao_interactable_JunkShop_deal01",
					"PortCacao_interactable_JunkShop_deal02",
					"PortCacao_interactable_JunkShop_deal03",
					"PortCacao_interactable_JunkShop_success01",
					"PortCacao_interactable_JunkShop_success02",
					"PortCacao_interactable_JunkShop_success03",
				},
				banterSequentialWaitFor = "BanterStart",
				searchInMap = true,
				searchInMarker = false,
			}),
			PlaceObj('PlayBanterEffect', {
				Banters = {
					"PortCacao_interactable_JunkShop_failure01",
					"PortCacao_interactable_JunkShop_failure02",
					"PortCacao_interactable_JunkShop_failure03",
				},
				searchInMap = true,
				searchInMarker = false,
			}),
		},
		Groups = {
			"CraftingParts",
		},
		handle = 1332192785,
		items = {
			{
				editor_view_abridged = "if JunkShop_CraftingParts_CD:VendorTracker has passed.",
				filter_type = "quest",
				reference_id = "VendorTracker",
				type = "QuestHasTimerPassed",
			},
			{
				editor_view_abridged = "Set quest timer in VendorTracker:JunkShop_CraftingParts_CD for after 240 h",
				filter_type = "quest",
				reference_id = "VendorTracker",
				type = "QuestSetVariableTimer",
				var = "JunkShop_CraftingParts_CD",
			},
			{
				editor_view_abridged = "Play banter(s): PortCacao_interactable_JunkShop_deal01, PortCacao_interactable_JunkShop_deal02, PortCacao_interactable_JunkShop_deal03, PortCacao_interactable_JunkShop_success01, PortCacao_interactable_JunkShop_success02, PortCacao_interactable_JunkShop_success03",
				filter_type = "banter",
				reference_id = "PortCacao_interactable_JunkShop_deal01",
				type = "PlayBanterEffect",
			},
			{
				editor_view_abridged = "Play banter(s): PortCacao_interactable_JunkShop_deal01, PortCacao_interactable_JunkShop_deal02, PortCacao_interactable_JunkShop_deal03, PortCacao_interactable_JunkShop_success01, PortCacao_interactable_JunkShop_success02, PortCacao_interactable_JunkShop_success03",
				filter_type = "banter",
				reference_id = "PortCacao_interactable_JunkShop_deal02",
				type = "PlayBanterEffect",
			},
			{
				editor_view_abridged = "Play banter(s): PortCacao_interactable_JunkShop_deal01, PortCacao_interactable_JunkShop_deal02, PortCacao_interactable_JunkShop_deal03, PortCacao_interactable_JunkShop_success01, PortCacao_interactable_JunkShop_success02, PortCacao_interactable_JunkShop_success03",
				filter_type = "banter",
				reference_id = "PortCacao_interactable_JunkShop_deal03",
				type = "PlayBanterEffect",
			},
			{
				editor_view_abridged = "Play banter(s): PortCacao_interactable_JunkShop_deal01, PortCacao_interactable_JunkShop_deal02, PortCacao_interactable_JunkShop_deal03, PortCacao_interactable_JunkShop_success01, PortCacao_interactable_JunkShop_success02, PortCacao_interactable_JunkShop_success03",
				filter_type = "banter",
				reference_id = "PortCacao_interactable_JunkShop_success01",
				type = "PlayBanterEffect",
			},
			{
				editor_view_abridged = "Play banter(s): PortCacao_interactable_JunkShop_deal01, PortCacao_interactable_JunkShop_deal02, PortCacao_interactable_JunkShop_deal03, PortCacao_interactable_JunkShop_success01, PortCacao_interactable_JunkShop_success02, PortCacao_interactable_JunkShop_success03",
				filter_type = "banter",
				reference_id = "PortCacao_interactable_JunkShop_success02",
				type = "PlayBanterEffect",
			},
			{
				editor_view_abridged = "Play banter(s): PortCacao_interactable_JunkShop_deal01, PortCacao_interactable_JunkShop_deal02, PortCacao_interactable_JunkShop_deal03, PortCacao_interactable_JunkShop_success01, PortCacao_interactable_JunkShop_success02, PortCacao_interactable_JunkShop_success03",
				filter_type = "banter",
				reference_id = "PortCacao_interactable_JunkShop_success03",
				type = "PlayBanterEffect",
			},
			{
				editor_view_abridged = "Play banter(s): PortCacao_interactable_JunkShop_failure01, PortCacao_interactable_JunkShop_failure02, PortCacao_interactable_JunkShop_failure03",
				filter_type = "banter",
				reference_id = "PortCacao_interactable_JunkShop_failure01",
				type = "PlayBanterEffect",
			},
			{
				editor_view_abridged = "Play banter(s): PortCacao_interactable_JunkShop_failure01, PortCacao_interactable_JunkShop_failure02, PortCacao_interactable_JunkShop_failure03",
				filter_type = "banter",
				reference_id = "PortCacao_interactable_JunkShop_failure02",
				type = "PlayBanterEffect",
			},
			{
				editor_view_abridged = "Play banter(s): PortCacao_interactable_JunkShop_failure01, PortCacao_interactable_JunkShop_failure02, PortCacao_interactable_JunkShop_failure03",
				filter_type = "banter",
				reference_id = "PortCacao_interactable_JunkShop_failure03",
				type = "PlayBanterEffect",
			},
		},
		map = "FinalStandL8",
		name = 'CustomInteractable#785 "Trade Money Bag for Crafting Parts" (CraftingParts)',
		path = "CustomInteractable ",
		type = "CustomInteractable",
	},
	{
		BanterTriggerEffects = {
			PlaceObj('PlayBanterEffect', {
				Banters = {
					"Reaction_Tex_Movie_Rambo",
				},
				banterSequentialWaitFor = "BanterStart",
			}),
		},
		Groups = {
			"TexMoviePoster_Rambo",
		},
		handle = 1352073554,
		items = {
			{
				editor_view_abridged = "Play banter(s): Reaction_Tex_Movie_Rambo",
				filter_type = "banter",
				reference_id = "Reaction_Tex_Movie_Rambo",
				type = "PlayBanterEffect",
			},
		},
		map = "FinalStandL8",
		name = "Logic#554 (TexMoviePoster_Rambo)",
		path = "Logic ",
		type = "Logic",
	},
	{
		Groups = false,
		handle = 1405332084,
		items = {
			{
				editor_view_abridged = "if TCE_LiberatedPortCacao",
				filter_type = "quest",
				reference_id = "PortCacaoSideQuests",
				type = "QuestIsTCEState",
				var = "TCE_LiberatedPortCacao",
			},
		},
		map = "FinalStandL8",
		name = "DefenderPriority#084",
		path = "DefenderPriority ",
		type = "DefenderPriority",
	},
	{
		BanterGroups = {
			"SharedOverheard_Enemies",
		},
		Groups = {
			"Overheard_Enemies",
		},
		handle = 1434583975,
		map = "FinalStandL8",
		name = "Position#975 (Overheard_Enemies)",
		path = "Position ",
		type = "Position",
	},
	{
		BanterGroups = {
			"SharedOverheard_Civilians",
		},
		Groups = {
			"Overheard_Civilians",
		},
		handle = 1456178835,
		map = "FinalStandL8",
		name = "Position#835 (Overheard_Civilians)",
		path = "Position ",
		type = "Position",
	},
	{
		BanterTriggerEffects = {
			PlaceObj('PlayBanterEffect', {
				Banters = {
					"PortCacao_interactable_Statue",
				},
				searchInMap = true,
				searchInMarker = false,
			}),
		},
		Groups = {
			"Statue",
		},
		handle = 1484647641,
		items = {
			{
				editor_view_abridged = "Play banter(s): PortCacao_interactable_Statue",
				filter_type = "banter",
				reference_id = "PortCacao_interactable_Statue",
				type = "PlayBanterEffect",
			},
		},
		map = "FinalStandL8",
		name = 'CustomInteractable#641 "Examine" (Statue)',
		path = "CustomInteractable ",
		type = "CustomInteractable",
	},
	{
		BanterGroups = {
			"SharedOverheard_Civilians",
		},
		Groups = {
			"Overheard_Civilians",
		},
		handle = 1504319294,
		map = "FinalStandL8",
		name = "Position#294 (Overheard_Civilians)",
		path = "Position ",
		type = "Position",
	},
	{
		BanterGroups = {
			"Banters_Civilians",
			"Banters_Local_PortCacao",
		},
		Groups = {
			"AL_Main",
		},
		handle = 1567928999,
		map = "FinalStandL8",
		name = "AmbientZone#999 (AL_Main)",
		path = "AmbientZone ",
		type = "AmbientZone",
	},
	{
		Groups = {
			"BarricadeDespawner",
		},
		handle = 1569208308,
		items = {
			{
				editor_view_abridged = "if not InitialCombatActive",
				filter_type = "quest",
				reference_id = "PortCacaoSideQuests",
				type = "QuestIsVariableBool",
				var = set({
	InitialCombatActive = false,
}),
			},
		},
		map = "FinalStandL8",
		name = "InventoryItemSpawn#308 (BarricadeDespawner)",
		path = "InventoryItemSpawn ",
		type = "InventoryItemSpawn",
	},
	{
		Groups = {
			"BarricadeDespawner",
		},
		handle = 1589000668,
		items = {
			{
				editor_view_abridged = "if not InitialCombatActive",
				filter_type = "quest",
				reference_id = "PortCacaoSideQuests",
				type = "QuestIsVariableBool",
				var = set({
	InitialCombatActive = false,
}),
			},
		},
		map = "FinalStandL8",
		name = "InventoryItemSpawn#668 (BarricadeDespawner)",
		path = "InventoryItemSpawn ",
		type = "InventoryItemSpawn",
	},
	{
		BanterTriggerEffects = {
			PlaceObj('PlayBanterEffect', {
				Banters = {
					"PortCacao_interactable_JunkShop_deal01",
					"PortCacao_interactable_JunkShop_deal02",
					"PortCacao_interactable_JunkShop_deal03",
					"PortCacao_interactable_JunkShop_success01",
					"PortCacao_interactable_JunkShop_success02",
					"PortCacao_interactable_JunkShop_success03",
				},
				banterSequentialWaitFor = "BanterStart",
				searchInMap = true,
				searchInMarker = false,
			}),
			PlaceObj('PlayBanterEffect', {
				Banters = {
					"PortCacao_interactable_JunkShop_failure01",
					"PortCacao_interactable_JunkShop_failure02",
					"PortCacao_interactable_JunkShop_failure03",
				},
				searchInMap = true,
				searchInMarker = false,
			}),
		},
		Groups = false,
		handle = 1593470163,
		items = {
			{
				editor_view_abridged = "if not WigFound",
				filter_type = "quest",
				reference_id = "AyeMom",
				type = "QuestIsVariableBool",
				var = set({
	WigFound = false,
}),
			},
			{
				editor_view_abridged = "Play banter(s): PortCacao_interactable_JunkShop_deal01, PortCacao_interactable_JunkShop_deal02, PortCacao_interactable_JunkShop_deal03, PortCacao_interactable_JunkShop_success01, PortCacao_interactable_JunkShop_success02, PortCacao_interactable_JunkShop_success03",
				filter_type = "banter",
				reference_id = "PortCacao_interactable_JunkShop_deal01",
				type = "PlayBanterEffect",
			},
			{
				editor_view_abridged = "Play banter(s): PortCacao_interactable_JunkShop_deal01, PortCacao_interactable_JunkShop_deal02, PortCacao_interactable_JunkShop_deal03, PortCacao_interactable_JunkShop_success01, PortCacao_interactable_JunkShop_success02, PortCacao_interactable_JunkShop_success03",
				filter_type = "banter",
				reference_id = "PortCacao_interactable_JunkShop_deal02",
				type = "PlayBanterEffect",
			},
			{
				editor_view_abridged = "Play banter(s): PortCacao_interactable_JunkShop_deal01, PortCacao_interactable_JunkShop_deal02, PortCacao_interactable_JunkShop_deal03, PortCacao_interactable_JunkShop_success01, PortCacao_interactable_JunkShop_success02, PortCacao_interactable_JunkShop_success03",
				filter_type = "banter",
				reference_id = "PortCacao_interactable_JunkShop_deal03",
				type = "PlayBanterEffect",
			},
			{
				editor_view_abridged = "Play banter(s): PortCacao_interactable_JunkShop_deal01, PortCacao_interactable_JunkShop_deal02, PortCacao_interactable_JunkShop_deal03, PortCacao_interactable_JunkShop_success01, PortCacao_interactable_JunkShop_success02, PortCacao_interactable_JunkShop_success03",
				filter_type = "banter",
				reference_id = "PortCacao_interactable_JunkShop_success01",
				type = "PlayBanterEffect",
			},
			{
				editor_view_abridged = "Play banter(s): PortCacao_interactable_JunkShop_deal01, PortCacao_interactable_JunkShop_deal02, PortCacao_interactable_JunkShop_deal03, PortCacao_interactable_JunkShop_success01, PortCacao_interactable_JunkShop_success02, PortCacao_interactable_JunkShop_success03",
				filter_type = "banter",
				reference_id = "PortCacao_interactable_JunkShop_success02",
				type = "PlayBanterEffect",
			},
			{
				editor_view_abridged = "Play banter(s): PortCacao_interactable_JunkShop_deal01, PortCacao_interactable_JunkShop_deal02, PortCacao_interactable_JunkShop_deal03, PortCacao_interactable_JunkShop_success01, PortCacao_interactable_JunkShop_success02, PortCacao_interactable_JunkShop_success03",
				filter_type = "banter",
				reference_id = "PortCacao_interactable_JunkShop_success03",
				type = "PlayBanterEffect",
			},
			{
				editor_view_abridged = "Play banter(s): PortCacao_interactable_JunkShop_failure01, PortCacao_interactable_JunkShop_failure02, PortCacao_interactable_JunkShop_failure03",
				filter_type = "banter",
				reference_id = "PortCacao_interactable_JunkShop_failure01",
				type = "PlayBanterEffect",
			},
			{
				editor_view_abridged = "Play banter(s): PortCacao_interactable_JunkShop_failure01, PortCacao_interactable_JunkShop_failure02, PortCacao_interactable_JunkShop_failure03",
				filter_type = "banter",
				reference_id = "PortCacao_interactable_JunkShop_failure02",
				type = "PlayBanterEffect",
			},
			{
				editor_view_abridged = "Play banter(s): PortCacao_interactable_JunkShop_failure01, PortCacao_interactable_JunkShop_failure02, PortCacao_interactable_JunkShop_failure03",
				filter_type = "banter",
				reference_id = "PortCacao_interactable_JunkShop_failure03",
				type = "PlayBanterEffect",
			},
		},
		map = "FinalStandL8",
		name = 'CustomInteractable#163 Wig "Trade Money Bag for a Wig"',
		path = "CustomInteractable Wig",
		type = "CustomInteractable",
	},
	{
		BanterTriggerEffects = {
			PlaceObj('PlayBanterEffect', {
				Banters = {
					"PortCacao_interactable_JunkShop_deal01",
					"PortCacao_interactable_JunkShop_deal02",
					"PortCacao_interactable_JunkShop_deal03",
					"PortCacao_interactable_JunkShop_success01",
					"PortCacao_interactable_JunkShop_success02",
					"PortCacao_interactable_JunkShop_success03",
				},
				banterSequentialWaitFor = "BanterStart",
				searchInMap = true,
				searchInMarker = false,
			}),
			PlaceObj('PlayBanterEffect', {
				Banters = {
					"PortCacao_interactable_JunkShop_failure01",
					"PortCacao_interactable_JunkShop_failure02",
					"PortCacao_interactable_JunkShop_failure03",
				},
				searchInMap = true,
				searchInMarker = false,
			}),
		},
		Groups = {
			"Magazines",
		},
		handle = 1619368876,
		items = {
			{
				editor_view_abridged = "if JunkShop_Magazine_CD:VendorTracker has passed.",
				filter_type = "quest",
				reference_id = "VendorTracker",
				type = "QuestHasTimerPassed",
			},
			{
				editor_view_abridged = "Set quest timer in VendorTracker:JunkShop_Magazine_CD for after 240 h",
				filter_type = "quest",
				reference_id = "VendorTracker",
				type = "QuestSetVariableTimer",
				var = "JunkShop_Magazine_CD",
			},
			{
				editor_view_abridged = "Play banter(s): PortCacao_interactable_JunkShop_deal01, PortCacao_interactable_JunkShop_deal02, PortCacao_interactable_JunkShop_deal03, PortCacao_interactable_JunkShop_success01, PortCacao_interactable_JunkShop_success02, PortCacao_interactable_JunkShop_success03",
				filter_type = "banter",
				reference_id = "PortCacao_interactable_JunkShop_deal01",
				type = "PlayBanterEffect",
			},
			{
				editor_view_abridged = "Play banter(s): PortCacao_interactable_JunkShop_deal01, PortCacao_interactable_JunkShop_deal02, PortCacao_interactable_JunkShop_deal03, PortCacao_interactable_JunkShop_success01, PortCacao_interactable_JunkShop_success02, PortCacao_interactable_JunkShop_success03",
				filter_type = "banter",
				reference_id = "PortCacao_interactable_JunkShop_deal02",
				type = "PlayBanterEffect",
			},
			{
				editor_view_abridged = "Play banter(s): PortCacao_interactable_JunkShop_deal01, PortCacao_interactable_JunkShop_deal02, PortCacao_interactable_JunkShop_deal03, PortCacao_interactable_JunkShop_success01, PortCacao_interactable_JunkShop_success02, PortCacao_interactable_JunkShop_success03",
				filter_type = "banter",
				reference_id = "PortCacao_interactable_JunkShop_deal03",
				type = "PlayBanterEffect",
			},
			{
				editor_view_abridged = "Play banter(s): PortCacao_interactable_JunkShop_deal01, PortCacao_interactable_JunkShop_deal02, PortCacao_interactable_JunkShop_deal03, PortCacao_interactable_JunkShop_success01, PortCacao_interactable_JunkShop_success02, PortCacao_interactable_JunkShop_success03",
				filter_type = "banter",
				reference_id = "PortCacao_interactable_JunkShop_success01",
				type = "PlayBanterEffect",
			},
			{
				editor_view_abridged = "Play banter(s): PortCacao_interactable_JunkShop_deal01, PortCacao_interactable_JunkShop_deal02, PortCacao_interactable_JunkShop_deal03, PortCacao_interactable_JunkShop_success01, PortCacao_interactable_JunkShop_success02, PortCacao_interactable_JunkShop_success03",
				filter_type = "banter",
				reference_id = "PortCacao_interactable_JunkShop_success02",
				type = "PlayBanterEffect",
			},
			{
				editor_view_abridged = "Play banter(s): PortCacao_interactable_JunkShop_deal01, PortCacao_interactable_JunkShop_deal02, PortCacao_interactable_JunkShop_deal03, PortCacao_interactable_JunkShop_success01, PortCacao_interactable_JunkShop_success02, PortCacao_interactable_JunkShop_success03",
				filter_type = "banter",
				reference_id = "PortCacao_interactable_JunkShop_success03",
				type = "PlayBanterEffect",
			},
			{
				editor_view_abridged = "Play banter(s): PortCacao_interactable_JunkShop_failure01, PortCacao_interactable_JunkShop_failure02, PortCacao_interactable_JunkShop_failure03",
				filter_type = "banter",
				reference_id = "PortCacao_interactable_JunkShop_failure01",
				type = "PlayBanterEffect",
			},
			{
				editor_view_abridged = "Play banter(s): PortCacao_interactable_JunkShop_failure01, PortCacao_interactable_JunkShop_failure02, PortCacao_interactable_JunkShop_failure03",
				filter_type = "banter",
				reference_id = "PortCacao_interactable_JunkShop_failure02",
				type = "PlayBanterEffect",
			},
			{
				editor_view_abridged = "Play banter(s): PortCacao_interactable_JunkShop_failure01, PortCacao_interactable_JunkShop_failure02, PortCacao_interactable_JunkShop_failure03",
				filter_type = "banter",
				reference_id = "PortCacao_interactable_JunkShop_failure03",
				type = "PlayBanterEffect",
			},
		},
		map = "FinalStandL8",
		name = 'CustomInteractable#876 "Trade Money Bag for a Magazine" (Magazines)',
		path = "CustomInteractable ",
		type = "CustomInteractable",
	},
	{
		Groups = false,
		handle = 1721931722,
		items = {
			{
				editor_view_abridged = "if not LiberatedPortCacao",
				filter_type = "quest",
				reference_id = "PortCacaoSideQuests",
				type = "QuestIsVariableBool",
				var = set({
	LiberatedPortCacao = false,
}),
			},
		},
		map = "FinalStandL8",
		name = "Intel#722",
		path = "Intel ",
		type = "Intel",
	},
	{
		BanterGroups = {
			"SharedOverheard_Civilians",
		},
		Groups = {
			"Overheard_Civilians",
		},
		handle = 1754124542,
		map = "FinalStandL8",
		name = "Position#542 (Overheard_Civilians)",
		path = "Position ",
		type = "Position",
	},
	{
		Groups = false,
		handle = 1757495164,
		items = {
			{
				editor_view_abridged = "if not LiberatedPortCacao",
				filter_type = "quest",
				reference_id = "PortCacaoSideQuests",
				type = "QuestIsVariableBool",
				var = set({
	LiberatedPortCacao = false,
}),
			},
		},
		map = "FinalStandL8",
		name = "Intel#164",
		path = "Intel ",
		type = "Intel",
	},
	{
		BanterTriggerEffects = {
			PlaceObj('PlayBanterEffect', {
				Banters = {
					"PortCacao_interactable_HiddenStash",
				},
				searchInMap = true,
				searchInMarker = false,
			}),
		},
		Groups = {
			"HiddenStash",
		},
		handle = 1801821411,
		items = {
			{
				editor_view_abridged = "if FredericStash",
				filter_type = "quest",
				reference_id = "PortCacaoSideQuests",
				type = "QuestIsVariableBool",
				var = set( "FredericStash" ),
			},
			{
				editor_view_abridged = "Play banter(s): PortCacao_interactable_HiddenStash",
				filter_type = "banter",
				reference_id = "PortCacao_interactable_HiddenStash",
				type = "PlayBanterEffect",
			},
		},
		map = "FinalStandL8",
		name = 'CustomInteractable#411 "Examine" (HiddenStash)',
		path = "CustomInteractable ",
		type = "CustomInteractable",
	},
	{
		BanterGroups = {
			"SharedOverheard_Civilians",
		},
		Groups = {
			"Overheard_Civilians",
		},
		handle = 1806026291,
		map = "FinalStandL8",
		name = "Position#291 (Overheard_Civilians)",
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
		handle = 1823747016,
		map = "FinalStandL8",
		name = "Position#016 (Overheard_Enemies)",
		path = "Position ",
		type = "Position",
	},
	{
		Groups = {
			"FightAreas",
		},
		handle = 1834291721,
		items = {
			{
				editor_view_abridged = "if TCE_L8_WaveTrigger",
				filter_type = "quest",
				reference_id = "PortCacaoSideQuests",
				type = "QuestIsVariableBool",
				var = set( "TCE_L8_WaveTrigger" ),
			},
		},
		map = "FinalStandL8",
		name = "Position#721 FightArea_Mansion_F1_1 (FightAreas)",
		path = "Position FightArea_Mansion_F1_1",
		type = "Position",
	},
	{
		BanterTriggerEffects = {
			PlaceObj('PlayBanterEffect', {
				Banters = {
					"PortCacao_interactable_JunkShop_deal01",
					"PortCacao_interactable_JunkShop_deal02",
					"PortCacao_interactable_JunkShop_deal03",
					"PortCacao_interactable_JunkShop_success01",
					"PortCacao_interactable_JunkShop_success02",
					"PortCacao_interactable_JunkShop_success03",
				},
				banterSequentialWaitFor = "BanterStart",
				searchInMap = true,
				searchInMarker = false,
			}),
			PlaceObj('PlayBanterEffect', {
				Banters = {
					"PortCacao_interactable_JunkShop_failure01",
					"PortCacao_interactable_JunkShop_failure02",
					"PortCacao_interactable_JunkShop_failure03",
				},
				searchInMap = true,
				searchInMarker = false,
			}),
		},
		Groups = {
			"FieldResources",
		},
		handle = 1844514023,
		items = {
			{
				editor_view_abridged = "if JunkShop_FieldResources_CD:VendorTracker has passed.",
				filter_type = "quest",
				reference_id = "VendorTracker",
				type = "QuestHasTimerPassed",
			},
			{
				editor_view_abridged = "Set quest timer in VendorTracker:JunkShop_FieldResources_CD for after 240 h",
				filter_type = "quest",
				reference_id = "VendorTracker",
				type = "QuestSetVariableTimer",
				var = "JunkShop_FieldResources_CD",
			},
			{
				editor_view_abridged = "Play banter(s): PortCacao_interactable_JunkShop_deal01, PortCacao_interactable_JunkShop_deal02, PortCacao_interactable_JunkShop_deal03, PortCacao_interactable_JunkShop_success01, PortCacao_interactable_JunkShop_success02, PortCacao_interactable_JunkShop_success03",
				filter_type = "banter",
				reference_id = "PortCacao_interactable_JunkShop_deal01",
				type = "PlayBanterEffect",
			},
			{
				editor_view_abridged = "Play banter(s): PortCacao_interactable_JunkShop_deal01, PortCacao_interactable_JunkShop_deal02, PortCacao_interactable_JunkShop_deal03, PortCacao_interactable_JunkShop_success01, PortCacao_interactable_JunkShop_success02, PortCacao_interactable_JunkShop_success03",
				filter_type = "banter",
				reference_id = "PortCacao_interactable_JunkShop_deal02",
				type = "PlayBanterEffect",
			},
			{
				editor_view_abridged = "Play banter(s): PortCacao_interactable_JunkShop_deal01, PortCacao_interactable_JunkShop_deal02, PortCacao_interactable_JunkShop_deal03, PortCacao_interactable_JunkShop_success01, PortCacao_interactable_JunkShop_success02, PortCacao_interactable_JunkShop_success03",
				filter_type = "banter",
				reference_id = "PortCacao_interactable_JunkShop_deal03",
				type = "PlayBanterEffect",
			},
			{
				editor_view_abridged = "Play banter(s): PortCacao_interactable_JunkShop_deal01, PortCacao_interactable_JunkShop_deal02, PortCacao_interactable_JunkShop_deal03, PortCacao_interactable_JunkShop_success01, PortCacao_interactable_JunkShop_success02, PortCacao_interactable_JunkShop_success03",
				filter_type = "banter",
				reference_id = "PortCacao_interactable_JunkShop_success01",
				type = "PlayBanterEffect",
			},
			{
				editor_view_abridged = "Play banter(s): PortCacao_interactable_JunkShop_deal01, PortCacao_interactable_JunkShop_deal02, PortCacao_interactable_JunkShop_deal03, PortCacao_interactable_JunkShop_success01, PortCacao_interactable_JunkShop_success02, PortCacao_interactable_JunkShop_success03",
				filter_type = "banter",
				reference_id = "PortCacao_interactable_JunkShop_success02",
				type = "PlayBanterEffect",
			},
			{
				editor_view_abridged = "Play banter(s): PortCacao_interactable_JunkShop_deal01, PortCacao_interactable_JunkShop_deal02, PortCacao_interactable_JunkShop_deal03, PortCacao_interactable_JunkShop_success01, PortCacao_interactable_JunkShop_success02, PortCacao_interactable_JunkShop_success03",
				filter_type = "banter",
				reference_id = "PortCacao_interactable_JunkShop_success03",
				type = "PlayBanterEffect",
			},
			{
				editor_view_abridged = "Play banter(s): PortCacao_interactable_JunkShop_failure01, PortCacao_interactable_JunkShop_failure02, PortCacao_interactable_JunkShop_failure03",
				filter_type = "banter",
				reference_id = "PortCacao_interactable_JunkShop_failure01",
				type = "PlayBanterEffect",
			},
			{
				editor_view_abridged = "Play banter(s): PortCacao_interactable_JunkShop_failure01, PortCacao_interactable_JunkShop_failure02, PortCacao_interactable_JunkShop_failure03",
				filter_type = "banter",
				reference_id = "PortCacao_interactable_JunkShop_failure02",
				type = "PlayBanterEffect",
			},
			{
				editor_view_abridged = "Play banter(s): PortCacao_interactable_JunkShop_failure01, PortCacao_interactable_JunkShop_failure02, PortCacao_interactable_JunkShop_failure03",
				filter_type = "banter",
				reference_id = "PortCacao_interactable_JunkShop_failure03",
				type = "PlayBanterEffect",
			},
		},
		map = "FinalStandL8",
		name = 'CustomInteractable#023 "Trade Money Bag for Field Resources" (FieldResources)',
		path = "CustomInteractable ",
		type = "CustomInteractable",
	},
	{
		Groups = {
			"BarricadeDespawner",
		},
		handle = 1851923151,
		items = {
			{
				editor_view_abridged = "if not InitialCombatActive",
				filter_type = "quest",
				reference_id = "PortCacaoSideQuests",
				type = "QuestIsVariableBool",
				var = set({
	InitialCombatActive = false,
}),
			},
		},
		map = "FinalStandL8",
		name = "InventoryItemSpawn#151 (BarricadeDespawner)",
		path = "InventoryItemSpawn ",
		type = "InventoryItemSpawn",
	},
}
return {
	PlaceObj('ModItemCampaignPreset', {
		Cities = {
			PlaceObj('CampaignCity', {
				'Id', "FortLEauBleu",
				'DisplayName', T(667671484586, --[[ModItemCampaignPreset FinalStand DisplayName]] "Fort L'Eau Bleu"),
			}),
			PlaceObj('CampaignCity', {
				'Id', "Rimville",
				'DisplayName', T(706135832746, --[[ModItemCampaignPreset FinalStand DisplayName]] "Rimville"),
			}),
			PlaceObj('CampaignCity', {
				'Id', "PortCacao",
				'DisplayName', T(295166534598, --[[ModItemCampaignPreset FinalStand DisplayName]] "Port Cacao"),
			}),
			PlaceObj('CampaignCity', {
				'Id', "PantagruelSlums",
				'DisplayName', T(389342703643, --[[ModItemCampaignPreset FinalStand DisplayName]] "Pantagruel Slums"),
			}),
			PlaceObj('CampaignCity', {
				'Id', "IlleMorat",
				'DisplayName', T(638413804817, --[[ModItemCampaignPreset FinalStand DisplayName]] "Ille Morat"),
			}),
		},
		DisclaimerOnStart = T(343258375424, --[[ModItemCampaignPreset FinalStand DisclaimerOnStart]] "The premise is simple, the task is not: survive set amount of waves in order to win.<newline><newline>Each time the enemy wave is coming, it is displayed on the game timeline.<newline>Each time you defeat the enemy wave, you will receive rewards and time to prepare for the next assault.<newline><newline>It's up to you to choose your roster, but mercs and gear still take time to arrive, so plan accordingly."),
		DisplayName = T(500039653974, --[[ModItemCampaignPreset FinalStand DisplayName]] "Final Stand"),
		EffectsOnStart = {
			PlaceObj('CustomCodeEffect', {
				custom_code = 'ChangeAIMPremiumState("offer")',
			}),
			PlaceObj('UnitSetHireStatus', {
				TargetUnit = "Gus",
			}),
			PlaceObj('FinalStandSquadScheduleAttack', {}),
		},
		FinalStandConfigs = {
			PlaceObj('CampaignPresetFinalStandConfig', {
				'Config', "Default",
			}),
		},
		FirstRunInterface = function (self, interfaceType)
			--used for debugging
			if interfaceType == "QuickStart" then
				TutorialHintsState.LandingPageShown = true
				Game.CampaignTime = Game.CampaignTimeStart + const.Satellite.MercArrivalTime / 2
				SetUILCustomTime(Game.CampaignTime)
				return
			end
			
			SetCampaignSpeed(0, "UI")
			g_PDALoadingFlavor = false
			if not gv_SatelliteView then OpenSatelliteView(nil, "openLandingPage") end
			OpenAIMAndSelectMerc()
			g_PDALoadingFlavor = true
		end,
		InitialSector = "H4",
		Initialize = function (self)
			AllowRevealSectors({ "H4", "I9", "L8", "D7", "D17" })
		end,
		IsFinalStand = true,
		NameColor = 4292643868,
		PlayerMaxDebt = 5000,
		Sectors = {
			PlaceObj('SatelliteSector', {
				'Id', "D17",
				'HideUnderground', true,
				'Map', "FinalStandD17",
				'MapTier', 20,
				'Label1', "City",
				'modId', "FinalStand",
				'display_name', T(588901431087, --[[ModItemCampaignPreset FinalStand display_name Sector name for D17]] "Ille Morat"),
				'Side', "neutral",
				'TerrainType', "Urban",
				'WeatherZone', "CursedForest",
				'Passability', "Land and Water",
				'City', "IlleMorat",
				'ShowCity', true,
				'never_autoresolve', true,
				'Hospital', true,
				'Militia', true,
				'MaxMilitia', 4,
				'RAndRAllowed', true,
				'RepairShop', true,
				'bidirectionalBlockApply', true,
				'BlockTravelRiver', set( "East", "North", "South", "West" ),
				'image', "UI/SatelliteView/SectorImages/D17",
				'MusicCombat', "Battle_Normal",
				'MusicExploration', "Village_Exploration",
				'combatTaskAmount', 2,
			}),
			PlaceObj('SatelliteSector', {
				'Id', "D7",
				'HideUnderground', true,
				'Map', "FinalStandD7",
				'MapTier', 10,
				'Label1', "City",
				'modId', "FinalStand",
				'display_name', T(580447225647, --[[ModItemCampaignPreset FinalStand display_name Sector name for D7]] "Pantagruel Slums"),
				'Side', "neutral",
				'TerrainType', "Urban",
				'WeatherZone', "SavannahNorth",
				'City', "PantagruelSlums",
				'ShowCity', true,
				'never_autoresolve', true,
				'Hospital', true,
				'Militia', true,
				'MaxMilitia', 4,
				'RAndRAllowed', true,
				'RepairShop', true,
				'bidirectionalBlockApply', true,
				'BlockTravelRiver', set( "East", "North", "South", "West" ),
				'image', "UI/SatelliteView/SectorImages/D07",
				'MusicCombat', "Battle_Normal",
				'MusicConflict', "Town_Conflict",
				'MusicExploration', "Town_Exploration",
				'combatTaskAmount', 2,
			}),
			PlaceObj('SatelliteSector', {
				'Id', "H4",
				'HideUnderground', true,
				'Map', "FinalStandH4",
				'MapTier', 40,
				'Label1', "Ernie",
				'modId', "FinalStand",
				'Label2', "Outpost",
				'display_name', T(621127133250, --[[ModItemCampaignPreset FinalStand display_name Sector name for H4]] "Fort L'Eau Bleu"),
				'Side', "neutral",
				'TerrainType', "Jungle",
				'WeatherZone', "Erny",
				'City', "FortLEauBleu",
				'ShowCity', true,
				'never_autoresolve', true,
				'Hospital', true,
				'Militia', true,
				'MaxMilitia', 4,
				'RAndRAllowed', true,
				'RepairShop', true,
				'bidirectionalBlockApply', true,
				'BlockTravelRiver', set( "East", "North", "South", "West" ),
				'image', "UI/SatelliteView/SectorImages/H04",
				'MusicCombat', "Battle_Tough",
				'MusicConflict', "Outpost_Conflict",
				'MusicExploration', "Outpost_Exploration",
				'combatTaskAmount', 2,
			}),
			PlaceObj('SatelliteSector', {
				'Id', "I9",
				'HideUnderground', true,
				'Map', "FinalStandI9",
				'MapTier', 20,
				'Label1', "Special",
				'modId', "FinalStand",
				'display_name', T(499129490679, --[[ModItemCampaignPreset FinalStand display_name Sector name for I9]] "Rimville"),
				'Side', "neutral",
				'TerrainType', "Urban",
				'WeatherZone', "GreatForest",
				'Passability', "Land and Water",
				'City', "Rimville",
				'ShowCity', true,
				'never_autoresolve', true,
				'Hospital', true,
				'Militia', true,
				'MaxMilitia', 4,
				'RAndRAllowed', true,
				'RepairShop', true,
				'bidirectionalBlockApply', true,
				'BlockTravelRiver', set( "East", "North", "South", "West" ),
				'image', "UI/SatelliteView/SectorImages/I09",
				'MusicCombat', "Battle_Tough",
				'MusicConflict', "SpecificMansion_Conflict",
				'MusicExploration', "SpecificMansion_Exploration",
				'combatTaskAmount', 2,
			}),
			PlaceObj('SatelliteSector', {
				'Id', "L8",
				'HideUnderground', true,
				'Map', "FinalStandL8",
				'MapTier', 20,
				'Label1', "City",
				'modId', "FinalStand",
				'display_name', T(187379373038, --[[ModItemCampaignPreset FinalStand display_name Sector name for L8]] "Port Cacao City"),
				'Side', "neutral",
				'TerrainType', "Urban",
				'WeatherZone', "SouthJungle",
				'City', "PortCacao",
				'ShowCity', true,
				'never_autoresolve', true,
				'Hospital', true,
				'Militia', true,
				'MaxMilitia', 4,
				'RAndRAllowed', true,
				'RepairShop', true,
				'bidirectionalBlockApply', true,
				'BlockTravelRiver', set( "East", "North", "South", "West" ),
				'image', "UI/SatelliteView/SectorImages/L08",
				'Port', true,
				'MusicCombat', "Battle_Tough",
				'MusicConflict', "Town_Conflict",
				'MusicExploration', "Town_Exploration",
				'combatTaskAmount', 2,
			}),
		},
		group = "Default",
		id = "FinalStand",
		isFinalStand = true,
		map_file = "UI/SatelliteView/SatView",
		map_size = point(9966, 5704),
		max_hired_mercs = 12,
		sector_bottomright = "L20",
		sectors_offset = point(1420, 710, 0),
		starting_day = 21,
		starting_month = 3,
		starting_timestamp = 1016690400,
		starting_year = 2002,
		underground_file = "UI/SatelliteView/SatView_Underground",
	}),
	PlaceObj('ModItemFinalStandConfigDef', {
		AimGoldPrice = 7500,
		EnemyFactions = {
			PlaceObj('FinalStandConfigEnemyFaction', {
				'Faction', "Legion",
			}),
			PlaceObj('FinalStandConfigEnemyFaction', {
				'Faction', "Adonis",
			}),
			PlaceObj('FinalStandConfigEnemyFaction', {
				'Faction', "Army",
			}),
			PlaceObj('FinalStandConfigEnemyFaction', {
				'Faction', "SuperSoldiers",
			}),
		},
		Factions = {
			PlaceObj('FinalStandConfigFaction', {
				'Faction', "Mercs",
			}),
			PlaceObj('FinalStandConfigFaction', {
				'Faction', "Militia",
			}),
			PlaceObj('FinalStandConfigFaction', {
				'Faction', "Rebels",
			}),
		},
		Lengths = {
			PlaceObj('FinalStandConfigLength', {
				'Length', "ThreeWaves",
			}),
			PlaceObj('FinalStandConfigLength', {
				'Length', "FiveWaves",
			}),
			PlaceObj('FinalStandConfigLength', {
				'Length', "SevenWaves",
			}),
		},
		NameColor = 4292643868,
		Parameters = {
			PlaceObj('PresetParamPercent', {
				'Name', "operationsProgressModifier",
				'Value', 50,
				'Tag', "<operationsProgressModifier>%",
			}),
		},
		Sectors = {
			PlaceObj('FinalStandConfigSector', {
				'Sector', "H4",
			}),
			PlaceObj('FinalStandConfigSector', {
				'Sector', "I9",
			}),
			PlaceObj('FinalStandConfigSector', {
				'Sector', "L8",
			}),
			PlaceObj('FinalStandConfigSector', {
				'Sector', "D7",
			}),
			PlaceObj('FinalStandConfigSector', {
				'Sector', "D17",
			}),
		},
		attackTimeMax = 6,
		attackTimeMin = 4,
		baseMoney = 10000,
		baseXp = 7000,
		description = T(995080477580, --[[ModItemFinalStandConfigDef Default description]] "Default Final Stand configuration."),
		display_name = T(969651972519, --[[ModItemFinalStandConfigDef Default display_name]] "Default"),
		display_name_caps = T(570560636797, --[[ModItemFinalStandConfigDef Default display_name_caps]] "DEFAULT"),
		group = "Default",
		id = "Default",
		msg_reactions = {
			PlaceObj('MsgReaction', {
				Event = "StartSatelliteGameplay",
				Handler = function (self)
					if not IsFinalStand() then return end
					
					local currentWave = GetFinalStandCurrentWave()
					
					if not gv_DisabledPopups["FinalStandWelcome"] and currentWave == 1 then
						ShowPopupNotification("FinalStandWelcome")
					end
					
					if not gv_DisabledPopups["FinalStandBuyingWeapons"] and currentWave > 1 then
						ShowPopupNotification("FinalStandBuyingWeapons")
					end
				end,
				param_bindings = false,
			}),
			PlaceObj('MsgReaction', {
				Event = "OperationProgressPerTick",
				Handler = function (self, operation, progresses)
					if not IsFinalStandOperationSpeedUpAllowed(operation.id) then return end
					
					local base = progresses.base
					local additionalProgress = (MulDivRound(base, 100 + self:ResolveValue("operationsProgressModifier"), 100) - base)
					
					progresses["final_stand"] = additionalProgress
				end,
				param_bindings = false,
			}),
		},
	}),
	PlaceObj('ModItemFolder', {
		'name', "Friendly Factions",
	}, {
		PlaceObj('ModItemFinalStandFriendlyFactionDef', {
			AttireHead = {},
			NameColor = 4286226623,
			SortKey = 1,
			StartingEquipment = {
				"FinalStandStartingEquipmentFFAll",
			},
			comment = "No modifiers or changes to Characters",
			description = T(740134134665, --[[ModItemFinalStandFriendlyFactionDef Mercs description]] "<em>No Faction</em> - no bonuses or penalties, closer to vanilla experience.<newline><newline><flavor>This is a default non-themed faction, mercenaries will not wear faction attire.</flavor>"),
			display_name = T(967105562153, --[[ModItemFinalStandFriendlyFactionDef Mercs display_name]] "No Faction"),
			display_name_caps = T(560481808058, --[[ModItemFinalStandFriendlyFactionDef Mercs display_name_caps]] "NO FACTION"),
			group = "Default",
			id = "Mercs",
		}),
		PlaceObj('ModItemFinalStandFriendlyFactionDef', {
			AttirePools = {
				PlaceObj('FinalStandFactionAttire', {
					'AttirePool', "MilitiaLeader",
				}),
				PlaceObj('FinalStandFactionAttire', {
					'AttirePool', "MilitiaAllRounder",
				}),
				PlaceObj('FinalStandFactionAttire', {
					'AttirePool', "MilitiaMarksmen",
				}),
				PlaceObj('FinalStandFactionAttire', {
					'AttirePool', "MilitiaExplosive",
				}),
				PlaceObj('FinalStandFactionAttire', {
					'AttirePool', "MilitiaDoctor",
				}),
				PlaceObj('FinalStandFactionAttire', {
					'AttirePool', "MilitiaMechanic",
				}),
				PlaceObj('FinalStandFactionAttire', {
					'AttirePool', "GeneralLeader",
				}),
				PlaceObj('FinalStandFactionAttire', {
					'AttirePool', "GeneralAllRounder",
				}),
				PlaceObj('FinalStandFactionAttire', {
					'AttirePool', "GeneralMarksmen",
				}),
				PlaceObj('FinalStandFactionAttire', {
					'AttirePool', "GeneralExplosives",
				}),
				PlaceObj('FinalStandFactionAttire', {
					'AttirePool', "GeneralDoctor",
				}),
				PlaceObj('FinalStandFactionAttire', {
					'AttirePool', "GeneralMechanic",
				}),
			},
			NameColor = 4286226623,
			Parameters = {
				PlaceObj('PresetParamPercent', {
					'Name', "operationsPriceModifier",
					'Value', 50,
					'Tag', "<operationsPriceModifier>%",
				}),
				PlaceObj('PresetParamPercent', {
					'Name', "operationsProgressModifier",
					'Value', 35,
					'Tag', "<operationsProgressModifier>%",
				}),
			},
			SortKey = 2,
			StartingEquipment = {
				"FinalStandStartingEquipmentFFAll",
				"FinalStandStartingEquipmentFFMilitia",
			},
			comment = "Faster ops, train militia, more xp, less money",
			description = T(795340958482, --[[ModItemFinalStandFriendlyFactionDef Militia description]] "<color 161 161 161>Push back against the oppressors with the <em>Militia</em> faction.</color><newline><newline><color 21 132 138>Homefront</color> - sector operations are faster. You can also <em>Train Militia</em> (once per wave).<newline><newline><color 21 132 138>Eager Fighters</color> - units receive <em>more XP</em> for each wave completion.<newline><newline><color 204 51 0>Village Fund</color> - receive <em>less money</em> for wave completion.<newline><newline><flavor>This is a themed faction, mercenaries will wear faction attire.</flavor>"),
			display_name = T(315086321064, --[[ModItemFinalStandFriendlyFactionDef Militia display_name]] "Grand Chien Militia"),
			display_name_caps = T(838090083518, --[[ModItemFinalStandFriendlyFactionDef Militia display_name_caps]] "GRAND CHIEN MILITIA"),
			group = "Default",
			id = "Militia",
			loyaltyModifier = 15,
			moneyModifier = -25,
			msg_reactions = {
				PlaceObj('MsgReaction', {
					Event = "FinalStandGamePerWaveFlagsReset",
					Handler = function (self, config)
						if not IsFinalStand() then return end
						
						config.hasTrainedMilitia = false
					end,
					param_bindings = false,
				}),
				PlaceObj('MsgReaction', {
					Event = "OperationIsEnabled",
					Handler = function (self, operation, reasons)
						if not IsFinalStand() then return end
						if operation.id ~= 'MilitiaTraining' then return end
						
						if self.id ~= GetFinalStandFriendlyFaction() then 
							-- limit militia training operation to anyone but militia
							reasons["faction_not_supported"] = {
								enabled = false,
								message = T(469065984287, "Only Militia faction can perform this operation.")
							}
						elseif Game.FinalStand.hasTrainedMilitia == true then
							reasons["militia_has_been_trained"] = {
								enabled = false,
								message = T(469065984288, "Militia has already been trained this wave.")
							}
						end
					end,
					param_bindings = false,
				}),
				PlaceObj('MsgReaction', {
					Event = "OperationProgressPerTick",
					Handler = function (self, operation, progresses)
						if not IsFinalStandOperationSpeedUpAllowed(operation.id) then return end
						if self.id ~= GetFinalStandFriendlyFaction() then return end
						
						-- increase militia operation speed
						local base = progresses.base
						local additionalProgress = (MulDivRound(base, 100 + self:ResolveValue("operationsProgressModifier"), 100) - base)
						
						progresses["final_stand_faction"] = additionalProgress
					end,
					param_bindings = false,
				}),
				PlaceObj('MsgReaction', {
					Event = "OperationCompleted",
					Handler = function (self, operation, mercs, sector)
						if not IsFinalStand() then return end
						if operation.id ~= 'MilitiaTraining' then return end
						
						Game.FinalStand.hasTrainedMilitia = true
					end,
					param_bindings = false,
				}),
			},
			xpModifier = 50,
		}),
		PlaceObj('ModItemFinalStandFriendlyFactionDef', {
			AttireHead = {},
			AttirePools = {
				PlaceObj('FinalStandFactionAttire', {
					'AttirePool', "RebelsLeader",
				}),
				PlaceObj('FinalStandFactionAttire', {
					'AttirePool', "RebelsAllRounder",
				}),
				PlaceObj('FinalStandFactionAttire', {
					'AttirePool', "RebelsMarksmen",
				}),
				PlaceObj('FinalStandFactionAttire', {
					'AttirePool', "RebelsExplosive",
				}),
				PlaceObj('FinalStandFactionAttire', {
					'AttirePool', "RebelsDoctor",
				}),
				PlaceObj('FinalStandFactionAttire', {
					'AttirePool', "RebelsMechanic",
				}),
				PlaceObj('FinalStandFactionAttire', {
					'AttirePool', "GeneralLeader",
				}),
				PlaceObj('FinalStandFactionAttire', {
					'AttirePool', "GeneralAllRounder",
				}),
				PlaceObj('FinalStandFactionAttire', {
					'AttirePool', "GeneralMarksmen",
				}),
				PlaceObj('FinalStandFactionAttire', {
					'AttirePool', "GeneralExplosives",
				}),
				PlaceObj('FinalStandFactionAttire', {
					'AttirePool', "GeneralDoctor",
				}),
				PlaceObj('FinalStandFactionAttire', {
					'AttirePool', "GeneralMechanic",
				}),
			},
			NameColor = 4286226623,
			Parameters = {
				PlaceObj('PresetParamNumber', {
					'Name', "bobbyRayTierModifier",
					'Value', 1,
					'Tag', "<bobbyRayTierModifier>",
				}),
				PlaceObj('PresetParamPercent', {
					'Name', "bobbyRaySpeedModifier",
					'Value', -50,
					'Tag', "<bobbyRaySpeedModifier>%",
				}),
			},
			SortKey = 3,
			StartingEquipment = {
				"FinalStandStartingEquipmentFFAll",
				"FinalStandStartingEquipmentFFRebels",
			},
			comment = "Faster BobbyRay + higher tier, less xp, slightly more money",
			description = T(804842149252, --[[ModItemFinalStandFriendlyFactionDef Rebels description]] "<color 161 161 161>Fight for the revolution with the <em>Maquis Rebels</em> faction.</color><newline><newline><color 21 132 138>Connections</color> - each restock of BobbyRayShop <em>increases tier by 2</em>, instead of 1. <em>Deliveries</em> from said shop arrive twice as <em>fast</em> despite what it says on the website.<newline><newline><color 21 132 138>Mysterious Funding</color> - receive <em>more money</em> for each wave completion.<newline><newline><color 204 51 0>War Veterans</color> - units receive <em>less XP</em> for wave completion.<newline><newline><flavor>This is a themed faction, mercenaries will wear faction attire.</flavor>"),
			display_name = T(943600656612, --[[ModItemFinalStandFriendlyFactionDef Rebels display_name]] "Maquis Rebels"),
			display_name_caps = T(960626436378, --[[ModItemFinalStandFriendlyFactionDef Rebels display_name_caps]] "MAQUIS REBELS"),
			group = "Default",
			id = "Rebels",
			loyaltyModifier = -50,
			moneyModifier = 25,
			msg_reactions = {
				PlaceObj('MsgReaction', {
					Event = "FinalStandBobbyRayRestock",
					Handler = function (self, bobbyRayValues)
						if not IsFinalStand() then return end
						if self.id ~= GetFinalStandFriendlyFaction() then return end
						
						bobbyRayValues.nextTier = bobbyRayValues.nextTier + self:ResolveValue("bobbyRayTierModifier")
					end,
					param_bindings = false,
				}),
				PlaceObj('MsgReaction', {
					Event = "BobbyRayShopShipmentSent",
					Handler = function (self, shipment_details)
						if not IsFinalStand() then return end
						if self.id ~= GetFinalStandFriendlyFaction() then return end
						
						-- modify the time
						local original_time = shipment_details.due_time - Game.CampaignTime
						local time_modified = MulDivRound(original_time, 100 + self:ResolveValue("bobbyRaySpeedModifier"), 100)
						
						local new_due_time = Game.CampaignTime + time_modified
						shipment_details.due_time = new_due_time
						
						-- update timeline event
						local order_id = tostring(shipment_details.order_id)
						local timeline_event_id = "bobby_ray_shipment_" .. order_id
						RemoveTimelineEvent(timeline_event_id)
						
						local shipment_context = { sectorId = shipment_details.sector_id, items = shipment_details.shipment_items, order_id = order_id }
						AddTimelineEvent(timeline_event_id, shipment_details.due_time, "store_shipment", shipment_context)
					end,
					param_bindings = false,
				}),
			},
			xpModifier = -50,
		}),
		PlaceObj('ModItemLootDef', {
			group = "Default",
			id = "FinalStandStartingEquipmentFFAll",
			loot = "all",
			PlaceObj('LootEntryInventoryItem', {
				guaranteed = true,
				item = "Knife_Sharpened",
				stack_max = 3,
				stack_min = 1,
			}),
			PlaceObj('LootEntryInventoryItem', {
				RandomizeCondition = true,
				guaranteed = true,
				item = "FlakArmor",
				stack_max = 1,
				stack_min = 1,
			}),
			PlaceObj('LootEntryInventoryItem', {
				guaranteed = true,
				item = "Parts",
				stack_max = 60,
				stack_min = 30,
			}),
			PlaceObj('LootEntryInventoryItem', {
				guaranteed = true,
				item = "Meds",
				stack_max = 30,
				stack_min = 15,
			}),
			PlaceObj('LootEntryInventoryItem', {
				drop_chance_mod = 1000,
				item = "FineSteelPipe",
				stack_max = 3,
				stack_min = 1,
			}),
			PlaceObj('LootEntryInventoryItem', {
				drop_chance_mod = 1000,
				item = "OpticalLens",
				stack_max = 3,
				stack_min = 1,
			}),
			PlaceObj('LootEntryInventoryItem', {
				drop_chance_mod = 500,
				item = "Microchip",
				stack_max = 1,
				stack_min = 1,
			}),
		}),
		PlaceObj('ModItemLootDef', {
			group = "Default",
			id = "FinalStandStartingEquipmentFFMilitia",
			loot = "all",
			PlaceObj('LootEntryInventoryItem', {
				RandomizeCondition = true,
				guaranteed = true,
				item = "LightHelmet",
				stack_max = 1,
				stack_min = 1,
			}),
			PlaceObj('LootEntryInventoryItem', {
				RandomizeCondition = true,
				guaranteed = true,
				item = "CamoArmor_Medium",
				stack_max = 1,
				stack_min = 1,
			}),
			PlaceObj('LootEntryInventoryItem', {
				RandomizeCondition = true,
				guaranteed = true,
				item = "KevlarLeggings",
				stack_max = 1,
				stack_min = 1,
			}),
			PlaceObj('LootEntryInventoryItem', {
				RandomizeCondition = true,
				guaranteed = true,
				item = "FAMAS",
				stack_max = 1,
				stack_min = 1,
			}),
			PlaceObj('LootEntryInventoryItem', {
				guaranteed = true,
				item = "_556_Basic",
				stack_max = 60,
				stack_min = 30,
			}),
			PlaceObj('LootEntryInventoryItem', {
				drop_chance_mod = 710,
				item = "_556_AP",
				stack_max = 30,
				stack_min = 15,
			}),
		}),
		PlaceObj('ModItemLootDef', {
			group = "Default",
			id = "FinalStandStartingEquipmentFFRebels",
			loot = "all",
			PlaceObj('LootEntryInventoryItem', {
				RandomizeCondition = true,
				guaranteed = true,
				item = "KevlarHelmet",
				stack_max = 1,
				stack_min = 1,
			}),
			PlaceObj('LootEntryInventoryItem', {
				RandomizeCondition = true,
				guaranteed = true,
				item = "LightHelmet_WeavePadding",
				stack_max = 1,
				stack_min = 1,
			}),
			PlaceObj('LootEntryInventoryItem', {
				RandomizeCondition = true,
				guaranteed = true,
				item = "FlakArmor_CeramicPlates",
				stack_max = 1,
				stack_min = 1,
			}),
			PlaceObj('LootEntryInventoryItem', {
				RandomizeCondition = true,
				guaranteed = true,
				item = "FlakArmor_CeramicPlates",
				stack_max = 1,
				stack_min = 1,
			}),
			PlaceObj('LootEntryInventoryItem', {
				RandomizeCondition = true,
				guaranteed = true,
				item = "FlakArmor_CeramicPlates",
				stack_max = 1,
				stack_min = 1,
			}),
			PlaceObj('LootEntryInventoryItem', {
				RandomizeCondition = true,
				guaranteed = true,
				item = "KevlarLeggings",
				stack_max = 1,
				stack_min = 1,
			}),
			PlaceObj('LootEntryInventoryItem', {
				RandomizeCondition = true,
				guaranteed = true,
				item = "KevlarLeggings",
				stack_max = 1,
				stack_min = 1,
			}),
			PlaceObj('LootEntryInventoryItem', {
				RandomizeCondition = true,
				guaranteed = true,
				item = "AK74",
				stack_max = 1,
				stack_min = 1,
			}),
			PlaceObj('LootEntryInventoryItem', {
				RandomizeCondition = true,
				guaranteed = true,
				item = "AKSU",
				stack_max = 1,
				stack_min = 1,
			}),
			PlaceObj('LootEntryInventoryItem', {
				guaranteed = true,
				item = "_762WP_Basic",
				stack_max = 60,
				stack_min = 30,
			}),
			PlaceObj('LootEntryInventoryItem', {
				drop_chance_mod = 710,
				item = "_762WP_AP",
				stack_max = 30,
				stack_min = 15,
			}),
		}),
		}),
	PlaceObj('ModItemFolder', {
		'name', "Enemy Factions",
	}, {
		PlaceObj('ModItemFinalStandEnemyFactionDef', {
			ExtraSquads = {
				PlaceObj('FinalStandEnemyFactionSquad', {
					'Squad', "LegionExtraDefendres_Shock_Easy",
					'Waves', "3,4",
				}),
				PlaceObj('FinalStandEnemyFactionSquad', {
					'Squad', "LegionExtraDefenders_Ordnance_Easy",
					'Waves', "3,4",
				}),
				PlaceObj('FinalStandEnemyFactionSquad', {
					'Squad', "LegionExtraDefenders_Balanced_Easy",
					'Waves', "3,4",
				}),
				PlaceObj('FinalStandEnemyFactionSquad', {
					'Squad', "LegionExtraDefenders_Marksmen_Easy",
					'Waves', "3,4",
				}),
				PlaceObj('FinalStandEnemyFactionSquad', {
					'Squad', "LegionExtraDefenders_Balanced_Hard",
					'Waves', "4,5",
				}),
				PlaceObj('FinalStandEnemyFactionSquad', {
					'Squad', "LegionExtraDefenders_Ordnance_Hard",
					'Waves', "4,5",
				}),
				PlaceObj('FinalStandEnemyFactionSquad', {
					'Squad', "LegionExtraDefenders_Marksmen_Hard",
					'Waves', "6,7",
				}),
				PlaceObj('FinalStandEnemyFactionSquad', {
					'Squad', "LegionExtraDefenders_Shock_Hard",
					'Waves', "6,7",
				}),
			},
			NameColor = 4292577681,
			Parameters = {
				PlaceObj('PresetParamNumber', {
					'Name', "initialXPBoost",
					'Value', 1000,
					'Tag', "<initialXPBoost>",
				}),
			},
			SortKey = 1,
			Squads = {
				PlaceObj('FinalStandEnemyFactionSquad', {
					'Squad', "LegionDefenders_Mobile_Easy",
					'Waves', "1,3",
				}),
				PlaceObj('FinalStandEnemyFactionSquad', {
					'Squad', "LegionAttackers_Balanced_Easy",
					'Waves', "1,3",
				}),
				PlaceObj('FinalStandEnemyFactionSquad', {
					'Squad', "LegionAttackers_Shock_Easy",
					'Waves', "1,3",
				}),
				PlaceObj('FinalStandEnemyFactionSquad', {
					'Squad', "LegionDefenders_Balanced_Easy",
					'Waves', "1,3",
				}),
				PlaceObj('FinalStandEnemyFactionSquad', {
					'Squad', "LegionAttackers_Ordnance_Easy",
					'Waves', "2,3",
				}),
				PlaceObj('FinalStandEnemyFactionSquad', {
					'Squad', "LegionAttackers_Marksmen_Easy",
					'Waves', "1,3,4",
				}),
				PlaceObj('FinalStandEnemyFactionSquad', {
					'Squad', "LegionDefenders_Entrenched_Easy",
					'Waves', "1,3,4",
				}),
				PlaceObj('FinalStandEnemyFactionSquad', {
					'Squad', "LegionAttackers_Shock_Hard",
					'Waves', "2,4,5",
				}),
				PlaceObj('FinalStandEnemyFactionSquad', {
					'Squad', "LegionAttackers_Balanced_Hard",
					'Waves', "5,6,7",
				}),
				PlaceObj('FinalStandEnemyFactionSquad', {
					'Squad', "LegionAttackers_Marksmen_Hard",
					'Waves', "5,6,7",
				}),
				PlaceObj('FinalStandEnemyFactionSquad', {
					'Squad', "LegionAttackers_Ordnance_Hard",
					'Waves', "5,6,7",
				}),
				PlaceObj('FinalStandEnemyFactionSquad', {
					'Squad', "LegionDefenders_Entrenched_Hard",
					'Waves', "5,6,7",
				}),
				PlaceObj('FinalStandEnemyFactionSquad', {
					'Squad', "LegionDefenders_Balanced_Hard",
					'Waves', "5,6,7",
				}),
				PlaceObj('FinalStandEnemyFactionSquad', {
					'Squad', "LegionDefenders_Mobile_Hard",
					'Waves', "6,7",
				}),
			},
			["Starting Equipment"] = {
				"FinalStandStartingEquipmentLegion",
			},
			StartingEquipment = {
				"FinalStandStartingEquipmentEFLegion",
			},
			comment = "15% increase in Money and XP, easy enemies",
			description = T(163165721641, --[[ModItemFinalStandEnemyFactionDef Legion description]] "<color 161 161 161>Major's ruthless, one could even dare to say, para-military.</color><newline><newline><em>Piece of Cake</em> - this faction is overall easy to fight, <em>no money or XP increase</em> from base rewards.<newline><newline>"),
			display_name = T(625545314418, --[[ModItemFinalStandEnemyFactionDef Legion display_name]] "Legion"),
			display_name_caps = T(928522287632, --[[ModItemFinalStandEnemyFactionDef Legion display_name_caps]] "LEGION"),
			group = "Default",
			id = "Legion",
			loyaltyModifier = 15,
			moneyModifier = 15,
			msg_reactions = {
				PlaceObj('MsgReaction', {
					Event = "OperationCompleted",
					Handler = function (self, operation, mercs, sector)
						if not IsFinalStand() then return end
						if operation.id ~= 'Arriving' then return end
						if not Game.FinalStand.boostedUnits then return end
						if Game.FinalStand.boostedUnits[mercs.session_id] then return end
						
						if self.id ==  GetFinalStandEnemyFaction() then
							Game.FinalStand.boostedUnits[mercs.session_id] = true
							FinalStandRewardProvider:GiveXPToUnits({mercs}, self:ResolveValue("initialXPBoost"))
						end
					end,
					param_bindings = false,
				}),
			},
			xpModifier = 15,
		}),
		PlaceObj('ModItemFinalStandEnemyFactionDef', {
			ExtraSquads = {
				PlaceObj('FinalStandEnemyFactionSquad', {
					'Squad', "AdonisExtraDefenders_SpecOps",
					'Waves', "3,4",
				}),
				PlaceObj('FinalStandEnemyFactionSquad', {
					'Squad', "AdonisExtraDefenders_Demolitions",
					'Waves', "3,4",
				}),
				PlaceObj('FinalStandEnemyFactionSquad', {
					'Squad', "AdonisExtraDefenders_Shock",
					'Waves', "4,5",
				}),
				PlaceObj('FinalStandEnemyFactionSquad', {
					'Squad', "AdonisDefenders_FireSupport",
					'Waves', "6,7",
				}),
				PlaceObj('FinalStandEnemyFactionSquad', {
					'Squad', "AdonisDefenders_HeavyInfantry",
					'Waves', "6,7",
				}),
			},
			NameColor = 4292577681,
			Parameters = {
				PlaceObj('PresetParamNumber', {
					'Name', "initialXPBoost",
					'Value', 2500,
					'Tag', "<initialXPBoost>",
				}),
			},
			SortKey = 2,
			Squads = {
				PlaceObj('FinalStandEnemyFactionSquad', {
					'Squad', "AdonisAttackSquad_Ernie_1",
					'Waves', "1,3",
				}),
				PlaceObj('FinalStandEnemyFactionSquad', {
					'Squad', "AdonisAttackers_Demolitions_Easy",
					'Waves', "1,3",
				}),
				PlaceObj('FinalStandEnemyFactionSquad', {
					'Squad', "AdonisAttackers_SpecOps_Easy",
					'Waves', "1,3",
				}),
				PlaceObj('FinalStandEnemyFactionSquad', {
					'Squad', "AdonisAttackers_ShockAttack_Easy",
					'Waves', "1,3",
				}),
				PlaceObj('FinalStandEnemyFactionSquad', {
					'Squad', "AdonisAttackSquad_Ernie_2",
					'Waves', "1,3",
				}),
				PlaceObj('FinalStandEnemyFactionSquad', {
					'Squad', "AdonisAttackers_SpecOps_Hard",
					'Waves', "2,4,5",
				}),
				PlaceObj('FinalStandEnemyFactionSquad', {
					'Squad', "AdonisAttackers_Demolitions_Hard",
					'Waves', "2,4,5",
				}),
				PlaceObj('FinalStandEnemyFactionSquad', {
					'Squad', "AdonisAttackers_ShockAttack_Hard",
					'Waves', "2,4,5",
				}),
				PlaceObj('FinalStandEnemyFactionSquad', {
					'Squad', "Adonis_Ernie_OutlookSquad",
					'Waves', "2,4,5",
				}),
				PlaceObj('FinalStandEnemyFactionSquad', {
					'Squad', "Adonis_Ernie_EmeraldSquad",
					'Waves', "2,5,6",
				}),
				PlaceObj('FinalStandEnemyFactionSquad', {
					'Squad', "AdonisDefenders_HeavyInfantry",
					'Waves', "4,5,6,7",
				}),
				PlaceObj('FinalStandEnemyFactionSquad', {
					'Squad', "Adonis_Ernie_VillageSquad",
					'Waves', "6,7",
				}),
				PlaceObj('FinalStandEnemyFactionSquad', {
					'Squad', "Adonis_Ernie_RustSquad",
					'Waves', "6,7",
				}),
				PlaceObj('FinalStandEnemyFactionSquad', {
					'Squad', "Adonis_Ernie_FortressSquad",
					'Waves', "6,7",
				}),
			},
			["Starting Equipment"] = {},
			StartingEquipment = {
				"FinalStandStartingEquipmentEFAdonis",
			},
			comment = "50% increase in Money and XP, medium enemies",
			description = T(570856303260, --[[ModItemFinalStandEnemyFactionDef Adonis description]] "<color 161 161 161>Army of soldiers from the powerful corporation.</color><newline><newline><em>Slight Challenge</em> - this faction is overall not a walk in a park, <em><percent(moneyModifier)> increase in XP and money</em> from base rewards.<newline><newline>"),
			display_name = T(848092566579, --[[ModItemFinalStandEnemyFactionDef Adonis display_name]] "Adonis"),
			display_name_caps = T(487895655216, --[[ModItemFinalStandEnemyFactionDef Adonis display_name_caps]] "ADONIS"),
			group = "Default",
			id = "Adonis",
			loyaltyModifier = 50,
			moneyModifier = 50,
			msg_reactions = {
				PlaceObj('MsgReaction', {
					Event = "OperationCompleted",
					Handler = function (self, operation, mercs, sector)
						if not IsFinalStand() then return end
						if operation.id ~= 'Arriving' then return end
						if not Game.FinalStand.boostedUnits then return end
						if Game.FinalStand.boostedUnits[mercs.session_id] then return end
						
						if self.id ==  GetFinalStandEnemyFaction() then
							Game.FinalStand.boostedUnits[mercs.session_id] = true
							FinalStandRewardProvider:GiveXPToUnits({mercs}, self:ResolveValue("initialXPBoost"))
						end
					end,
					param_bindings = false,
				}),
			},
			xpModifier = 50,
		}),
		PlaceObj('ModItemFinalStandEnemyFactionDef', {
			ExtraSquads = {
				PlaceObj('FinalStandEnemyFactionSquad', {
					'Squad', "ArmyExtraDefenders_Balanced",
					'Waves', "3,4",
				}),
				PlaceObj('FinalStandEnemyFactionSquad', {
					'Squad', "ArmyExtraDefenders_ShortRange",
					'Waves', "4,5,6",
				}),
				PlaceObj('FinalStandEnemyFactionSquad', {
					'Squad', "ArmyExtraDefenders_LongRange",
					'Waves', "5,6",
				}),
				PlaceObj('FinalStandEnemyFactionSquad', {
					'Squad', "ArmyPatrol",
					'Waves', "5,6,7",
				}),
			},
			NameColor = 4292577681,
			Parameters = {
				PlaceObj('PresetParamNumber', {
					'Name', "initialXPBoost",
					'Value', 2500,
					'Tag', "<initialXPBoost>",
				}),
			},
			SortKey = 3,
			Squads = {
				PlaceObj('FinalStandEnemyFactionSquad', {
					'Squad', "ArmyAttackers_Balanced_Easy",
					'Waves', "1,3",
				}),
				PlaceObj('FinalStandEnemyFactionSquad', {
					'Squad', "ArmyAttackers_Siege_Easy",
					'Waves', "1,3",
				}),
				PlaceObj('FinalStandEnemyFactionSquad', {
					'Squad', "ArmyAttackers_Shock_Easy",
					'Waves', "1,3",
				}),
				PlaceObj('FinalStandEnemyFactionSquad', {
					'Squad', "ArmyAttackers_Shock_Hard",
					'Waves', "2,3,4,5",
				}),
				PlaceObj('FinalStandEnemyFactionSquad', {
					'Squad', "ArmyAttackers_Siege_Hard",
					'Waves', "2,3,4,5",
				}),
				PlaceObj('FinalStandEnemyFactionSquad', {
					'Squad', "ArmyAttackers_Balanced_Hard",
					'Waves', "2,3,4,5",
				}),
				PlaceObj('FinalStandEnemyFactionSquad', {
					'Squad', "ArmyDefenders_Balanced",
					'Waves', "4,5,6",
				}),
				PlaceObj('FinalStandEnemyFactionSquad', {
					'Squad', "ArmyDefenders_LongRange",
					'Waves', "6,7",
				}),
				PlaceObj('FinalStandEnemyFactionSquad', {
					'Squad', "ArmyDefenders_ShortRange",
					'Waves', "6,7",
				}),
			},
			["Starting Equipment"] = {},
			StartingEquipment = {
				"FinalStandStartingEquipmentEFArmy",
			},
			comment = "60% increase in Money and XP, hard enemies",
			description = T(398191236510, --[[ModItemFinalStandEnemyFactionDef Army description]] "<color 161 161 161>Well-organized military force of Grand Chien.</color><newline><newline><em>Tough Fight</em> - this faction is overall hard to fight, <em><percent(moneyModifier)> increase in XP and money</em> from base rewards.<newline><newline>"),
			display_name = T(607354837385, --[[ModItemFinalStandEnemyFactionDef Army display_name]] "Grand Chien Army"),
			display_name_caps = T(376620708541, --[[ModItemFinalStandEnemyFactionDef Army display_name_caps]] "GRAND CHIEN ARMY"),
			group = "Default",
			id = "Army",
			loyaltyModifier = 60,
			moneyModifier = 60,
			msg_reactions = {
				PlaceObj('MsgReaction', {
					Event = "OperationCompleted",
					Handler = function (self, operation, mercs, sector)
						if not IsFinalStand() then return end
						if operation.id ~= 'Arriving' then return end
						if not Game.FinalStand.boostedUnits then return end
						if Game.FinalStand.boostedUnits[mercs.session_id] then return end
						
						if self.id ==  GetFinalStandEnemyFaction() then
							Game.FinalStand.boostedUnits[mercs.session_id] = true
							FinalStandRewardProvider:GiveXPToUnits({mercs}, self:ResolveValue("initialXPBoost"))
						end
					end,
					param_bindings = false,
				}),
			},
			xpModifier = 60,
		}),
		PlaceObj('ModItemFinalStandEnemyFactionDef', {
			ExtraSquads = {
				PlaceObj('FinalStandEnemyFactionSquad', {
					'Squad', "TunnelSentry",
					'Waves', "4,5",
				}),
				PlaceObj('FinalStandEnemyFactionSquad', {
					'Squad', "SmallStations",
					'Waves', "6,7",
				}),
			},
			NameColor = 4292577681,
			Parameters = {
				PlaceObj('PresetParamNumber', {
					'Name', "initialXPBoost",
					'Value', 4000,
					'Tag', "<initialXPBoost>",
				}),
			},
			SortKey = 4,
			Squads = {
				PlaceObj('FinalStandEnemyFactionSquad', {
					'Squad', "BigStation",
					'Waves', "1,2",
				}),
				PlaceObj('FinalStandEnemyFactionSquad', {
					'Squad', "Klinik",
					'Waves', "3,4",
				}),
				PlaceObj('FinalStandEnemyFactionSquad', {
					'Squad', "BioLabor",
					'Waves', "5",
				}),
				PlaceObj('FinalStandEnemyFactionSquad', {
					'Squad', "Waffenlabor",
					'Waves', "6,7",
				}),
				PlaceObj('FinalStandEnemyFactionSquad', {
					'Squad', "Cryolabor",
					'Waves', "6,7",
				}),
			},
			["Starting Equipment"] = {},
			StartingEquipment = {
				"FinalStandStartingEquipmentEFSuperSoliders",
			},
			comment = "80% increase in Money and XP, hard enemies",
			description = T(345842431232, --[[ModItemFinalStandEnemyFactionDef SuperSoldiers description]] "<color 161 161 161>Siegfried's Super Soldiers.</color><newline><newline><em>ÜBER</em> - extremely nasty enemy to face, <em><percent(moneyModifier)> increase in XP and money</em> from base rewards.<newline><newline>"),
			display_name = T(280034056377, --[[ModItemFinalStandEnemyFactionDef SuperSoldiers display_name]] "Siegfried's Guard"),
			display_name_caps = T(904780289973, --[[ModItemFinalStandEnemyFactionDef SuperSoldiers display_name_caps]] "SIEGFRIED'S GUARD"),
			group = "Default",
			id = "SuperSoldiers",
			loyaltyModifier = 80,
			moneyModifier = 80,
			msg_reactions = {
				PlaceObj('MsgReaction', {
					Event = "OperationCompleted",
					Handler = function (self, operation, mercs, sector)
						if not IsFinalStand() then return end
						if operation.id ~= 'Arriving' then return end
						if not Game.FinalStand.boostedUnits then return end
						if Game.FinalStand.boostedUnits[mercs.session_id] then return end
						
						if self.id ==  GetFinalStandEnemyFaction() then
							Game.FinalStand.boostedUnits[mercs.session_id] = true
							FinalStandRewardProvider:GiveXPToUnits({mercs}, self:ResolveValue("initialXPBoost"))
						end
					end,
					param_bindings = false,
				}),
			},
			xpModifier = 80,
		}),
		PlaceObj('ModItemLootDef', {
			group = "Default",
			id = "FinalStandStartingEquipmentEFLegion",
			loot = "all",
			PlaceObj('LootEntryInventoryItem', {
				RandomizeCondition = true,
				guaranteed = true,
				item = "AK47",
				stack_max = 1,
				stack_min = 1,
			}),
			PlaceObj('LootEntryInventoryItem', {
				guaranteed = true,
				item = "_762WP_Basic",
				stack_max = 60,
				stack_min = 30,
			}),
			PlaceObj('LootEntryInventoryItem', {
				drop_chance_mod = 720,
				item = "_762WP_AP",
				stack_max = 30,
				stack_min = 15,
			}),
		}),
		PlaceObj('ModItemLootDef', {
			group = "Default",
			id = "FinalStandStartingEquipmentEFAdonis",
			loot = "all",
			PlaceObj('LootEntryInventoryItem', {
				RandomizeCondition = true,
				guaranteed = true,
				item = "DragunovSVD",
				stack_max = 1,
				stack_min = 1,
			}),
			PlaceObj('LootEntryInventoryItem', {
				RandomizeCondition = true,
				guaranteed = true,
				item = "LightHelmet_WeavePadding",
				stack_max = 1,
				stack_min = 1,
			}),
			PlaceObj('LootEntryInventoryItem', {
				RandomizeCondition = true,
				guaranteed = true,
				item = "LightHelmet_WeavePadding",
				stack_max = 1,
				stack_min = 1,
			}),
			PlaceObj('LootEntryInventoryItem', {
				RandomizeCondition = true,
				guaranteed = true,
				item = "CamoArmor_Light_Kompositum",
				stack_max = 1,
				stack_min = 1,
			}),
			PlaceObj('LootEntryInventoryItem', {
				guaranteed = true,
				item = "_762WP_Basic",
				stack_max = 30,
				stack_min = 15,
			}),
			PlaceObj('LootEntryInventoryItem', {
				drop_chance_mod = 935,
				item = "_762WP_AP",
				stack_max = 20,
				stack_min = 10,
			}),
			PlaceObj('LootEntryInventoryItem', {
				guaranteed = true,
				item = "Parts",
				stack_max = 30,
				stack_min = 10,
			}),
		}),
		PlaceObj('ModItemLootDef', {
			group = "Default",
			id = "FinalStandStartingEquipmentEFArmy",
			loot = "all",
			PlaceObj('LootEntryInventoryItem', {
				RandomizeCondition = true,
				guaranteed = true,
				item = "M24Sniper",
				stack_max = 1,
				stack_min = 1,
			}),
			PlaceObj('LootEntryInventoryItem', {
				RandomizeCondition = true,
				guaranteed = true,
				item = "KevlarHelmet",
				stack_max = 1,
				stack_min = 1,
			}),
			PlaceObj('LootEntryInventoryItem', {
				RandomizeCondition = true,
				guaranteed = true,
				item = "CamoArmor_Light_Kompositum",
				stack_max = 1,
				stack_min = 1,
			}),
			PlaceObj('LootEntryInventoryItem', {
				RandomizeCondition = true,
				guaranteed = true,
				item = "KevlarLeggings",
				stack_max = 1,
				stack_min = 1,
			}),
			PlaceObj('LootEntryInventoryItem', {
				guaranteed = true,
				item = "_762NATO_Basic",
				stack_max = 30,
				stack_min = 15,
			}),
			PlaceObj('LootEntryInventoryItem', {
				drop_chance_mod = 935,
				item = "_762NATO_AP",
				stack_max = 20,
				stack_min = 10,
			}),
			PlaceObj('LootEntryInventoryItem', {
				guaranteed = true,
				item = "Parts",
				stack_max = 30,
				stack_min = 10,
			}),
		}),
		PlaceObj('ModItemLootDef', {
			group = "Default",
			id = "FinalStandStartingEquipmentEFSuperSoliders",
			loot = "all",
			PlaceObj('LootEntryInventoryItem', {
				RandomizeCondition = true,
				guaranteed = true,
				item = "G36",
				stack_max = 1,
				stack_min = 1,
			}),
			PlaceObj('LootEntryInventoryItem', {
				RandomizeCondition = true,
				guaranteed = true,
				item = "MP5K",
				stack_max = 1,
				stack_min = 1,
			}),
			PlaceObj('LootEntryInventoryItem', {
				RandomizeCondition = true,
				guaranteed = true,
				item = "KevlarHelmet",
				stack_max = 1,
				stack_min = 1,
			}),
			PlaceObj('LootEntryInventoryItem', {
				RandomizeCondition = true,
				guaranteed = true,
				item = "HeavyArmorHelmet",
				stack_max = 1,
				stack_min = 1,
			}),
			PlaceObj('LootEntryInventoryItem', {
				RandomizeCondition = true,
				guaranteed = true,
				item = "HeavyArmorChestplate",
				stack_max = 1,
				stack_min = 1,
			}),
			PlaceObj('LootEntryInventoryItem', {
				RandomizeCondition = true,
				guaranteed = true,
				item = "CamoArmor_Medium",
				stack_max = 1,
				stack_min = 1,
			}),
			PlaceObj('LootEntryInventoryItem', {
				RandomizeCondition = true,
				guaranteed = true,
				item = "KevlarLeggings",
				stack_max = 1,
				stack_min = 1,
			}),
			PlaceObj('LootEntryInventoryItem', {
				RandomizeCondition = true,
				guaranteed = true,
				item = "HeavyArmorLeggings",
				stack_max = 1,
				stack_min = 1,
			}),
			PlaceObj('LootEntryInventoryItem', {
				guaranteed = true,
				item = "_556_Basic",
				stack_max = 45,
				stack_min = 30,
			}),
			PlaceObj('LootEntryInventoryItem', {
				drop_chance_mod = 935,
				item = "_556_AP",
				stack_max = 30,
				stack_min = 15,
			}),
			PlaceObj('LootEntryInventoryItem', {
				guaranteed = true,
				item = "_9mm_Basic",
				stack_max = 45,
				stack_min = 30,
			}),
			PlaceObj('LootEntryInventoryItem', {
				guaranteed = true,
				item = "Parts",
				stack_max = 40,
				stack_min = 20,
			}),
		}),
		}),
	PlaceObj('ModItemFolder', {
		'name', "Attire Pools",
	}, {
		PlaceObj('ModItemFinalStandAttirePoolDef', {
			Chest = {
				PlaceObj('FinalStandAttirePoolChest', {
					'Colors', {
						PlaceObj('ColorizationPropSet', {
							'EditableColor1', RGBA(11, 19, 8, 255),
							'EditableColor2', RGBA(11, 19, 8, 255),
							'EditableColor3', RGBA(11, 19, 8, 255),
						}),
					},
					'Chest', "Faction_Binocular_01",
				}),
			},
			Hip = {
				PlaceObj('FinalStandAttirePoolHip', {
					'Colors', {
						PlaceObj('ColorizationPropSet', {
							'EditableColor1', RGBA(0, 0, 0, 255),
							'EditableColor2', RGBA(2, 2, 2, 255),
							'EditableColor3', RGBA(2, 2, 2, 255),
						}),
					},
					'Hip', "Faction_Acc_Artilery",
				}),
			},
			Specialization = "Leader",
			group = "General",
			id = "GeneralLeader",
		}),
		PlaceObj('ModItemFinalStandAttirePoolDef', {
			Chest = {
				PlaceObj('FinalStandAttirePoolChest', {
					'Colors', {
						PlaceObj('ColorizationPropSet', {
							'EditableColor1', RGBA(120, 85, 85, 255),
							'EditableColor2', RGBA(0, 0, 0, 255),
							'EditableColor3', RGBA(0, 0, 0, 255),
						}),
					},
					'Chest', "Faction_Acc_Recon_02",
				}),
				PlaceObj('FinalStandAttirePoolChest', {
					'Colors', {
						PlaceObj('ColorizationPropSet', {
							'EditableColor1', RGBA(120, 85, 85, 255),
							'EditableColor2', RGBA(0, 0, 0, 255),
							'EditableColor3', RGBA(0, 0, 0, 255),
						}),
					},
					'Chest', "Faction_Acc_Marksman_02",
				}),
			},
			Hip = {
				PlaceObj('FinalStandAttirePoolHip', {
					'Colors', {
						PlaceObj('ColorizationPropSet', {
							'EditableColor1', RGBA(5, 4, 4, 255),
							'EditableColor2', RGBA(22, 22, 22, 255),
							'EditableColor3', RGBA(61, 61, 61, 255),
						}),
					},
					'Hip', "Faction_Acc_Recon",
				}),
				PlaceObj('FinalStandAttirePoolHip', {
					'Colors', {
						PlaceObj('ColorizationPropSet', {
							'EditableColor1', RGBA(7, 7, 7, 255),
							'EditableColor2', RGBA(5, 5, 5, 255),
							'EditableColor3', RGBA(0, 0, 0, 255),
						}),
					},
					'Hip', "Faction_Acc_Marksman",
				}),
			},
			Specialization = "Marksmen",
			group = "General",
			id = "GeneralMarksmen",
		}),
		PlaceObj('ModItemFinalStandAttirePoolDef', {
			Chest = {
				PlaceObj('FinalStandAttirePoolChest', {
					'Colors', {
						PlaceObj('ColorizationPropSet', {
							'EditableColor1', RGBA(7, 7, 7, 255),
							'EditableColor2', RGBA(5, 5, 5, 255),
							'EditableColor3', RGBA(0, 0, 0, 255),
						}),
					},
					'Chest', "Faction_Acc_Heavy_02",
				}),
				PlaceObj('FinalStandAttirePoolChest', {
					'Colors', {
						PlaceObj('ColorizationPropSet', {
							'EditableColor1', RGBA(6, 6, 6, 255),
							'EditableColor2', RGBA(5, 5, 5, 255),
							'EditableColor3', RGBA(0, 0, 0, 255),
						}),
					},
					'Chest', "Faction_Acc_Stormer_02",
				}),
			},
			Hip = {
				PlaceObj('FinalStandAttirePoolHip', {
					'Colors', {
						PlaceObj('ColorizationPropSet', {
							'EditableColor1', RGBA(4, 4, 4, 255),
							'EditableColor2', RGBA(0, 0, 0, 255),
							'EditableColor3', RGBA(0, 0, 0, 255),
						}),
					},
					'Hip', "Faction_Acc_Heavy",
				}),
				PlaceObj('FinalStandAttirePoolHip', {
					'Colors', {
						PlaceObj('ColorizationPropSet', {
							'EditableColor1', RGBA(6, 6, 6, 255),
							'EditableColor2', RGBA(5, 5, 5, 255),
							'EditableColor3', RGBA(0, 0, 0, 255),
						}),
					},
					'Hip', "Faction_Acc_Stormer",
				}),
			},
			Specialization = "AllRounder",
			group = "General",
			id = "GeneralAllRounder",
		}),
		PlaceObj('ModItemFinalStandAttirePoolDef', {
			Chest = {
				PlaceObj('FinalStandAttirePoolChest', {
					'Colors', {
						PlaceObj('ColorizationPropSet', {
							'EditableColor1', RGBA(120, 85, 85, 255),
							'EditableColor2', RGBA(0, 0, 0, 255),
							'EditableColor3', RGBA(0, 0, 0, 255),
						}),
					},
					'Chest', "Faction_Acc_Demolition_02",
				}),
				PlaceObj('FinalStandAttirePoolChest', {
					'Colors', {
						PlaceObj('ColorizationPropSet', {
							'EditableColor1', RGBA(120, 85, 85, 255),
							'EditableColor2', RGBA(0, 0, 0, 255),
							'EditableColor3', RGBA(0, 0, 0, 255),
						}),
					},
					'Chest', "Faction_Acc_Demolition_Legion_02",
				}),
			},
			Hip = {
				PlaceObj('FinalStandAttirePoolHip', {
					'Colors', {
						PlaceObj('ColorizationPropSet', {
							'EditableColor1', RGBA(6, 6, 6, 255),
							'EditableColor2', RGBA(5, 5, 5, 255),
							'EditableColor3', RGBA(0, 0, 0, 255),
						}),
					},
					'Hip', "Faction_Acc_Demolition",
				}),
				PlaceObj('FinalStandAttirePoolHip', {
					'Colors', {
						PlaceObj('ColorizationPropSet', {
							'EditableColor1', RGBA(6, 6, 6, 255),
							'EditableColor2', RGBA(5, 5, 5, 255),
							'EditableColor3', RGBA(0, 0, 0, 255),
						}),
					},
					'Hip', "Faction_Acc_Demolition_Legion",
				}),
			},
			Specialization = "ExplosiveExpert",
			group = "General",
			id = "GeneralExplosives",
		}),
		PlaceObj('ModItemFinalStandAttirePoolDef', {
			Chest = {
				PlaceObj('FinalStandAttirePoolChest', {
					'Colors', {
						PlaceObj('ColorizationPropSet', {
							'EditableColor1', RGBA(0, 0, 0, 255),
							'EditableColor2', RGBA(0, 0, 0, 255),
							'EditableColor3', RGBA(0, 0, 0, 255),
						}),
					},
					'Chest', "Faction_Acc_Medic_02",
				}),
			},
			Hip = {
				PlaceObj('FinalStandAttirePoolHip', {
					'Colors', {
						PlaceObj('ColorizationPropSet', {
							'EditableColor1', RGBA(0, 0, 0, 255),
							'EditableColor2', RGBA(0, 0, 0, 255),
							'EditableColor3', RGBA(0, 0, 0, 255),
						}),
					},
					'Hip', "Faction_Acc_Medic",
				}),
			},
			Specialization = "Doctor",
			group = "General",
			id = "GeneralDoctor",
		}),
		PlaceObj('ModItemFinalStandAttirePoolDef', {
			Hip = {
				PlaceObj('FinalStandAttirePoolHip', {
					'Colors', {
						PlaceObj('ColorizationPropSet', {
							'EditableColor1', RGBA(0, 0, 0, 255),
							'EditableColor2', RGBA(2, 2, 2, 255),
							'EditableColor3', RGBA(2, 2, 2, 255),
						}),
					},
					'Hip', "Faction_Acc_Artilery",
				}),
			},
			Specialization = "Mechanic",
			group = "General",
			id = "GeneralMechanic",
		}),
		PlaceObj('ModItemFinalStandAttirePoolDef', {
			Body = {
				PlaceObj('FinalStandAttirePoolBody', {
					'Colors', {
						PlaceObj('ColorizationPropSet', {
							'EditableColor1', RGBA(31, 13, 8, 255),
							'EditableColor2', RGBA(49, 89, 163, 255),
							'EditableColor3', RGBA(19, 19, 19, 255),
						}),
					},
					'Gender', "Male",
					'Body', "Faction_Militia_Top_03",
					'BodyColorKey', "EditableColor1",
				}),
				PlaceObj('FinalStandAttirePoolBody', {
					'Colors', {
						PlaceObj('ColorizationPropSet', {
							'EditableColor1', RGBA(31, 13, 8, 255),
							'EditableColor2', RGBA(49, 89, 163, 255),
							'EditableColor3', RGBA(19, 19, 19, 255),
						}),
					},
					'Gender', "Female",
					'Body', "EquipmentIMPTrooper_Top",
					'BodyColorKey', "EditableColor1",
				}),
			},
			Hat = {
				PlaceObj('FinalStandAttirePoolHat', {
					'Colors', {
						PlaceObj('ColorizationPropSet', {
							'EditableColor1', RGBA(205, 107, 28, 255),
							'EditableColor2', RGBA(19, 15, 13, 255),
							'EditableColor3', RGBA(0, 0, 0, 255),
						}),
					},
					'Hat', "FactionMale_Hat_01",
				}),
			},
			Hat2 = {
				PlaceObj('FinalStandAttirePoolHat2', {
					'Colors', {
						PlaceObj('ColorizationPropSet', {
							'EditableColor1', RGBA(0, 0, 0, 255),
							'EditableColor2', RGBA(0, 0, 0, 255),
							'EditableColor3', RGBA(0, 0, 0, 255),
						}),
					},
					'HideHair', false,
					'Hat2', "EquipmentLen_Glasses",
					'Hat2AttachOffsetX', 5,
				}),
			},
			NameColor = 4286226623,
			Pants = {
				PlaceObj('FinalStandAttirePoolPants', {
					'Colors', {
						PlaceObj('ColorizationPropSet', {
							'EditableColor1', RGBA(205, 107, 28, 255),
							'EditableColor2', RGBA(20, 19, 19, 255),
							'EditableColor3', RGBA(15, 14, 14, 255),
						}),
					},
					'Gender', "Male",
					'Pants', "Faction_Adonis_Bottom_02",
				}),
				PlaceObj('FinalStandAttirePoolPants', {
					'Colors', {
						PlaceObj('ColorizationPropSet', {
							'EditableColor1', RGBA(205, 107, 28, 255),
							'EditableColor2', RGBA(20, 19, 19, 255),
							'EditableColor3', RGBA(15, 14, 14, 255),
						}),
					},
					'Gender', "Female",
					'Pants', "EquipmentFemale_Pants_01",
				}),
			},
			Specialization = "Leader",
			comment = "Officer",
			group = "Militia",
			id = "MilitiaLeader",
		}),
		PlaceObj('ModItemFinalStandAttirePoolDef', {
			Body = {
				PlaceObj('FinalStandAttirePoolBody', {
					'Colors', {
						PlaceObj('ColorizationPropSet', {
							'EditableColor1', RGBA(12, 5, 3, 255),
							'EditableColor2', RGBA(49, 89, 163, 255),
							'EditableColor3', RGBA(205, 107, 28, 255),
						}),
					},
					'Gender', "Male",
					'Body', "Faction_Militia_Top_04",
					'BodyColorKey', "EditableColor1",
				}),
				PlaceObj('FinalStandAttirePoolBody', {
					'Colors', {
						PlaceObj('ColorizationPropSet', {
							'EditableColor1', RGBA(152, 129, 119, 255),
							'EditableColor2', RGBA(49, 89, 163, 255),
							'EditableColor3', RGBA(205, 107, 28, 255),
						}),
					},
					'Gender', "Male",
					'Body', "Faction_Militia_Top_05",
					'BodyColorKey', "EditableColor1",
				}),
				PlaceObj('FinalStandAttirePoolBody', {
					'Colors', {
						PlaceObj('ColorizationPropSet', {
							'EditableColor1', RGBA(12, 5, 3, 255),
							'EditableColor2', RGBA(16, 34, 62, 255),
							'EditableColor3', RGBA(15, 15, 15, 255),
						}),
					},
					'Gender', "Female",
					'Body', "EquipmentIMPTrooper_Top",
					'BodyColorKey', "EditableColor1",
				}),
			},
			Hat = {
				PlaceObj('FinalStandAttirePoolHat', {
					'Colors', {
						PlaceObj('ColorizationPropSet', {
							'EditableColor1', RGBA(33, 60, 109, 255),
							'EditableColor2', RGBA(0, 0, 0, 255),
							'EditableColor3', RGBA(0, 0, 0, 255),
						}),
					},
					'Hat', "FactionMale_Hat_05",
				}),
				PlaceObj('FinalStandAttirePoolHat', {
					'Colors', {
						PlaceObj('ColorizationPropSet', {
							'EditableColor1', RGBA(42, 62, 41, 255),
							'EditableColor2', RGBA(10, 15, 9, 255),
							'EditableColor3', RGBA(0, 0, 0, 255),
						}),
					},
					'Hat', "FactionMale_Hat_07",
				}),
			},
			Hat2 = {
				PlaceObj('FinalStandAttirePoolHat2', {
					'Colors', {
						PlaceObj('ColorizationPropSet', {
							'EditableColor1', RGBA(205, 107, 28, 255),
							'EditableColor2', RGBA(49, 89, 163, 255),
							'EditableColor3', RGBA(0, 0, 0, 255),
						}),
					},
					'Gender', "Male",
					'HideHair', false,
					'Hat2', "MilitiaCostumeMale_Mask_02",
					'Hat2Spot', "Origin",
				}),
				PlaceObj('FinalStandAttirePoolHat2', {
					'Colors', {
						PlaceObj('ColorizationPropSet', {
							'EditableColor1', RGBA(205, 107, 28, 255),
							'EditableColor2', RGBA(33, 60, 109, 255),
							'EditableColor3', RGBA(0, 0, 0, 255),
						}),
					},
					'Gender', "Male",
					'HideHair', false,
					'Hat2', "Faction_Militia_Scarf_02",
					'Hat2Spot', "Origin",
				}),
				PlaceObj('FinalStandAttirePoolHat2', {
					'Colors', {
						PlaceObj('ColorizationPropSet', {
							'EditableColor1', RGBA(205, 107, 28, 255),
							'EditableColor2', RGBA(205, 107, 28, 255),
							'EditableColor3', RGBA(205, 107, 28, 255),
						}),
					},
					'Gender', "Female",
					'HideHair', false,
					'Hat2', "NPCCostumeFemale_Scarf",
					'Hat2Spot', "Origin",
				}),
			},
			NameColor = 4286226623,
			Pants = {
				PlaceObj('FinalStandAttirePoolPants', {
					'Colors', {
						PlaceObj('ColorizationPropSet', {
							'EditableColor1', RGBA(42, 62, 41, 255),
							'EditableColor2', RGBA(20, 19, 19, 255),
							'EditableColor3', RGBA(6, 6, 6, 255),
						}),
					},
					'Gender', "Male",
					'Pants', "Faction_Adonis_Bottom_Camo_02",
				}),
				PlaceObj('FinalStandAttirePoolPants', {
					'Colors', {
						PlaceObj('ColorizationPropSet', {
							'EditableColor1', RGBA(23, 35, 22, 255),
							'EditableColor2', RGBA(13, 21, 13, 255),
							'EditableColor3', RGBA(13, 21, 13, 255),
						}),
					},
					'Gender', "Female",
					'Pants', "EquipmentFemale_Pants_02",
				}),
			},
			Shirt = {
				PlaceObj('FinalStandAttirePoolShirt', {
					'Colors', {
						PlaceObj('ColorizationPropSet', {
							'EditableColor1', RGBA(38, 37, 37, 255),
							'EditableColor2', RGBA(50, 48, 48, 255),
							'EditableColor3', RGBA(50, 48, 48, 255),
						}),
					},
					'Gender', "Male",
					'Shirt', "Faction_Gloves_01",
				}),
			},
			Specialization = "Marksmen",
			comment = "Marksman, Recon, Artillery",
			group = "Militia",
			id = "MilitiaMarksmen",
		}),
		PlaceObj('ModItemFinalStandAttirePoolDef', {
			Body = {
				PlaceObj('FinalStandAttirePoolBody', {
					'Colors', {
						PlaceObj('ColorizationPropSet', {
							'EditableColor1', RGBA(18, 7, 4, 255),
							'EditableColor2', RGBA(49, 89, 163, 255),
							'EditableColor3', RGBA(205, 107, 28, 255),
						}),
					},
					'Gender', "Male",
					'Body', "Faction_Militia_Top_01",
					'BodyColorKey', "EditableColor1",
				}),
				PlaceObj('FinalStandAttirePoolBody', {
					'Colors', {
						PlaceObj('ColorizationPropSet', {
							'EditableColor1', RGBA(48, 20, 12, 255),
							'EditableColor2', RGBA(49, 89, 163, 255),
							'EditableColor3', RGBA(205, 107, 28, 255),
						}),
					},
					'Gender', "Male",
					'Body', "Faction_Militia_Top_02",
					'BodyColorKey', "EditableColor1",
				}),
				PlaceObj('FinalStandAttirePoolBody', {
					'Colors', {
						PlaceObj('ColorizationPropSet', {
							'EditableColor1', RGBA(12, 5, 3, 255),
							'EditableColor2', RGBA(16, 34, 62, 255),
							'EditableColor3', RGBA(15, 15, 15, 255),
						}),
					},
					'Gender', "Female",
					'Body', "EquipmentIMPTrooper_Top",
					'BodyColorKey', "EditableColor1",
				}),
			},
			Hat = {
				PlaceObj('FinalStandAttirePoolHat', {
					'Colors', {
						PlaceObj('ColorizationPropSet', {
							'EditableColor1', RGBA(10, 9, 9, 255),
							'EditableColor2', RGBA(10, 9, 9, 255),
							'EditableColor3', RGBA(10, 9, 9, 255),
						}),
					},
					'Hat', "FactionMale_Hat_08",
				}),
				PlaceObj('FinalStandAttirePoolHat', {
					'Colors', {
						PlaceObj('ColorizationPropSet', {
							'EditableColor1', RGBA(42, 62, 41, 255),
							'EditableColor2', RGBA(0, 0, 0, 255),
							'EditableColor3', RGBA(0, 0, 0, 255),
						}),
					},
					'Hat', "FactionMale_Hat_12",
				}),
			},
			Hat2 = {
				PlaceObj('FinalStandAttirePoolHat2', {
					'Colors', {
						PlaceObj('ColorizationPropSet', {
							'EditableColor1', RGBA(0, 0, 0, 255),
							'EditableColor2', RGBA(0, 0, 0, 255),
							'EditableColor3', RGBA(0, 0, 0, 255),
						}),
					},
					'HideHair', false,
					'Hat2', "EquipmentRaider_Glasses",
				}),
				PlaceObj('FinalStandAttirePoolHat2', {
					'Colors', {
						PlaceObj('ColorizationPropSet', {
							'EditableColor1', RGBA(205, 107, 28, 255),
							'EditableColor2', RGBA(49, 89, 163, 255),
							'EditableColor3', RGBA(0, 0, 0, 255),
						}),
					},
					'Gender', "Male",
					'HideHair', false,
					'Hat2', "Faction_Militia_Scarf_01",
					'Hat2Spot', "Origin",
				}),
				PlaceObj('FinalStandAttirePoolHat2', {
					'Colors', {
						PlaceObj('ColorizationPropSet', {
							'EditableColor1', RGBA(205, 107, 28, 255),
							'EditableColor2', RGBA(33, 33, 131, 255),
							'EditableColor3', RGBA(0, 0, 0, 255),
						}),
					},
					'Gender', "Male",
					'HideHair', false,
					'Hat2', "MilitiaCostumeMale_Mask_03",
					'Hat2Spot', "Origin",
				}),
				PlaceObj('FinalStandAttirePoolHat2', {
					'Colors', {
						PlaceObj('ColorizationPropSet', {
							'EditableColor1', RGBA(205, 107, 28, 255),
							'EditableColor2', RGBA(205, 107, 28, 255),
							'EditableColor3', RGBA(205, 107, 28, 255),
						}),
					},
					'Gender', "Female",
					'HideHair', false,
					'Hat2', "NPCCostumeFemale_Scarf",
					'Hat2Spot', "Origin",
				}),
			},
			NameColor = 4286226623,
			Pants = {
				PlaceObj('FinalStandAttirePoolPants', {
					'Colors', {
						PlaceObj('ColorizationPropSet', {
							'EditableColor1', RGBA(42, 62, 41, 255),
							'EditableColor2', RGBA(20, 19, 19, 255),
							'EditableColor3', RGBA(6, 6, 6, 255),
						}),
					},
					'Gender', "Male",
					'Pants', "Faction_Adonis_Bottom_01",
				}),
				PlaceObj('FinalStandAttirePoolPants', {
					'Colors', {
						PlaceObj('ColorizationPropSet', {
							'EditableColor1', RGBA(42, 62, 41, 255),
							'EditableColor2', RGBA(20, 19, 19, 255),
							'EditableColor3', RGBA(6, 6, 6, 255),
						}),
					},
					'Gender', "Male",
					'Pants', "Faction_Adonis_Bottom_02",
				}),
				PlaceObj('FinalStandAttirePoolPants', {
					'Colors', {
						PlaceObj('ColorizationPropSet', {
							'EditableColor1', RGBA(42, 62, 41, 255),
							'EditableColor2', RGBA(20, 19, 19, 255),
							'EditableColor3', RGBA(6, 6, 6, 255),
						}),
					},
					'Gender', "Male",
					'Pants', "Faction_Adonis_Bottom_Camo_02",
				}),
				PlaceObj('FinalStandAttirePoolPants', {
					'Colors', {
						PlaceObj('ColorizationPropSet', {
							'EditableColor1', RGBA(23, 35, 22, 255),
							'EditableColor2', RGBA(13, 21, 13, 255),
							'EditableColor3', RGBA(13, 21, 13, 255),
						}),
					},
					'Gender', "Female",
					'Pants', "EquipmentFemale_Pants_02",
				}),
				PlaceObj('FinalStandAttirePoolPants', {
					'Colors', {
						PlaceObj('ColorizationPropSet', {
							'EditableColor1', RGBA(23, 35, 22, 255),
							'EditableColor2', RGBA(6, 6, 6, 255),
							'EditableColor3', RGBA(6, 6, 6, 255),
						}),
					},
					'Gender', "Female",
					'Pants', "EquipmentFemale_Pants_01",
				}),
			},
			Shirt = {
				PlaceObj('FinalStandAttirePoolShirt', {
					'Colors', {
						PlaceObj('ColorizationPropSet', {
							'EditableColor1', RGBA(38, 37, 37, 255),
							'EditableColor2', RGBA(50, 48, 48, 255),
							'EditableColor3', RGBA(50, 48, 48, 255),
						}),
					},
					'Gender', "Male",
					'Shirt', "Faction_Gloves_01",
				}),
			},
			Specialization = "AllRounder",
			comment = "Heavy, Soldier, Stormer",
			group = "Militia",
			id = "MilitiaAllRounder",
		}),
		PlaceObj('ModItemFinalStandAttirePoolDef', {
			Body = {
				PlaceObj('FinalStandAttirePoolBody', {
					'Colors', {
						PlaceObj('ColorizationPropSet', {
							'EditableColor1', RGBA(50, 19, 9, 255),
							'EditableColor2', RGBA(49, 89, 163, 255),
							'EditableColor3', RGBA(205, 107, 28, 255),
						}),
					},
					'Gender', "Male",
					'Body', "Faction_Militia_Top_03",
					'BodyColorKey', "EditableColor1",
				}),
				PlaceObj('FinalStandAttirePoolBody', {
					'Colors', {
						PlaceObj('ColorizationPropSet', {
							'EditableColor1', RGBA(50, 19, 9, 255),
							'EditableColor2', RGBA(16, 34, 62, 255),
							'EditableColor3', RGBA(0, 0, 0, 255),
						}),
					},
					'Gender', "Female",
					'Body', "EquipmentIMPTrooper_Top",
					'BodyColorKey', "EditableColor1",
				}),
			},
			Hat = {
				PlaceObj('FinalStandAttirePoolHat', {
					'Colors', {
						PlaceObj('ColorizationPropSet', {
							'EditableColor1', RGBA(42, 62, 41, 255),
							'EditableColor2', RGBA(0, 0, 0, 255),
							'EditableColor3', RGBA(0, 0, 0, 255),
						}),
					},
					'Hat', "FactionMale_Hat_04",
				}),
			},
			Hat2 = {
				PlaceObj('FinalStandAttirePoolHat2', {
					'Colors', {
						PlaceObj('ColorizationPropSet', {
							'EditableColor1', RGBA(205, 107, 28, 255),
							'EditableColor2', RGBA(33, 33, 131, 255),
							'EditableColor3', RGBA(0, 0, 0, 255),
						}),
					},
					'Gender', "Male",
					'HideHair', false,
					'Hat2', "Faction_Militia_Scarf_03",
					'Hat2Spot', "Origin",
				}),
				PlaceObj('FinalStandAttirePoolHat2', {
					'Colors', {
						PlaceObj('ColorizationPropSet', {
							'EditableColor1', RGBA(205, 107, 28, 255),
							'EditableColor2', RGBA(205, 107, 28, 255),
							'EditableColor3', RGBA(205, 107, 28, 255),
						}),
					},
					'Gender', "Female",
					'HideHair', false,
					'Hat2', "NPCCostumeFemale_Scarf",
					'Hat2Spot', "Origin",
				}),
			},
			NameColor = 4286226623,
			Pants = {
				PlaceObj('FinalStandAttirePoolPants', {
					'Colors', {
						PlaceObj('ColorizationPropSet', {
							'EditableColor1', RGBA(42, 62, 41, 255),
							'EditableColor2', RGBA(20, 19, 19, 255),
							'EditableColor3', RGBA(6, 6, 6, 255),
						}),
					},
					'Gender', "Male",
					'Pants', "Faction_Adonis_Bottom_02",
				}),
				PlaceObj('FinalStandAttirePoolPants', {
					'Colors', {
						PlaceObj('ColorizationPropSet', {
							'EditableColor1', RGBA(23, 35, 22, 255),
							'EditableColor2', RGBA(20, 19, 19, 255),
							'EditableColor3', RGBA(6, 6, 6, 255),
						}),
					},
					'Gender', "Female",
					'Pants', "EquipmentFemale_Pants_01",
				}),
			},
			Specialization = "ExplosiveExpert",
			comment = "Demolition",
			group = "Militia",
			id = "MilitiaExplosive",
		}),
		PlaceObj('ModItemFinalStandAttirePoolDef', {
			Body = {
				PlaceObj('FinalStandAttirePoolBody', {
					'Colors', {
						PlaceObj('ColorizationPropSet', {
							'EditableColor1', RGBA(10, 4, 2, 255),
							'EditableColor2', RGBA(49, 89, 163, 255),
							'EditableColor3', RGBA(128, 6, 6, 255),
						}),
					},
					'Gender', "Male",
					'Body', "Faction_Militia_Top_02",
					'BodyColorKey', "EditableColor1",
				}),
				PlaceObj('FinalStandAttirePoolBody', {
					'Colors', {
						PlaceObj('ColorizationPropSet', {
							'EditableColor1', RGBA(16, 34, 62, 255),
							'EditableColor2', RGBA(16, 34, 62, 255),
							'EditableColor3', RGBA(128, 6, 6, 255),
						}),
					},
					'Gender', "Female",
					'Body', "NPCCostumeFemale_Shirt_01",
					'BodyColorKey', "EditableColor2",
				}),
			},
			Hat = {
				PlaceObj('FinalStandAttirePoolHat', {
					'Colors', {
						PlaceObj('ColorizationPropSet', {
							'EditableColor1', RGBA(189, 171, 149, 255),
							'EditableColor2', RGBA(0, 0, 0, 255),
							'EditableColor3', RGBA(22, 67, 19, 255),
						}),
					},
					'Hat', "FactionMale_Hat_08",
				}),
			},
			Hat2 = {
				PlaceObj('FinalStandAttirePoolHat2', {
					'Colors', {
						PlaceObj('ColorizationPropSet', {
							'EditableColor1', RGBA(205, 107, 28, 255),
							'EditableColor2', RGBA(33, 33, 131, 255),
							'EditableColor3', RGBA(0, 0, 0, 255),
						}),
					},
					'Gender', "Male",
					'HideHair', false,
					'Hat2', "Faction_Militia_Scarf_01",
					'Hat2Spot', "Origin",
				}),
				PlaceObj('FinalStandAttirePoolHat2', {
					'Colors', {
						PlaceObj('ColorizationPropSet', {
							'EditableColor1', RGBA(205, 107, 28, 255),
							'EditableColor2', RGBA(205, 107, 28, 255),
							'EditableColor3', RGBA(205, 107, 28, 255),
						}),
					},
					'Gender', "Female",
					'HideHair', false,
					'Hat2', "NPCCostumeFemale_Scarf",
					'Hat2Spot', "Origin",
				}),
			},
			NameColor = 4286226623,
			Pants = {
				PlaceObj('FinalStandAttirePoolPants', {
					'Colors', {
						PlaceObj('ColorizationPropSet', {
							'EditableColor1', RGBA(42, 62, 41, 255),
							'EditableColor2', RGBA(20, 19, 19, 255),
							'EditableColor3', RGBA(6, 6, 6, 255),
						}),
					},
					'Gender', "Male",
					'Pants', "Faction_Adonis_Bottom_02",
				}),
				PlaceObj('FinalStandAttirePoolPants', {
					'Colors', {
						PlaceObj('ColorizationPropSet', {
							'EditableColor1', RGBA(23, 35, 22, 255),
							'EditableColor2', RGBA(20, 19, 19, 255),
							'EditableColor3', RGBA(6, 6, 6, 255),
						}),
					},
					'Gender', "Female",
					'Pants', "EquipmentFemale_Pants_01",
				}),
			},
			Specialization = "Doctor",
			comment = "Medic",
			group = "Militia",
			id = "MilitiaDoctor",
		}),
		PlaceObj('ModItemFinalStandAttirePoolDef', {
			Body = {
				PlaceObj('FinalStandAttirePoolBody', {
					'Colors', {
						PlaceObj('ColorizationPropSet', {
							'EditableColor1', RGBA(10, 4, 2, 255),
							'EditableColor2', RGBA(25, 59, 120, 255),
							'EditableColor3', RGBA(205, 107, 28, 255),
						}),
					},
					'Gender', "Male",
					'Body', "Faction_Militia_Top_02",
					'BodyColorKey', "EditableColor1",
				}),
				PlaceObj('FinalStandAttirePoolBody', {
					'Colors', {
						PlaceObj('ColorizationPropSet', {
							'EditableColor1', RGBA(10, 4, 2, 255),
							'EditableColor2', RGBA(25, 59, 120, 255),
							'EditableColor3', RGBA(25, 59, 120, 255),
						}),
					},
					'Gender', "Female",
					'Body', "Faction_Infected_Top_F_02",
					'BodyColorKey', "EditableColor1",
				}),
			},
			Hat = {
				PlaceObj('FinalStandAttirePoolHat', {
					'Colors', {
						PlaceObj('ColorizationPropSet', {
							'EditableColor1', RGBA(205, 107, 28, 255),
							'EditableColor2', RGBA(0, 0, 0, 255),
							'EditableColor3', RGBA(0, 0, 0, 255),
						}),
					},
					'HideHair', false,
					'Hat', "FactionMale_Hat_13",
				}),
			},
			Hat2 = {
				PlaceObj('FinalStandAttirePoolHat2', {
					'Colors', {
						PlaceObj('ColorizationPropSet', {
							'EditableColor1', RGBA(205, 107, 28, 255),
							'EditableColor2', RGBA(33, 33, 131, 255),
							'EditableColor3', RGBA(0, 0, 0, 255),
						}),
					},
					'Gender', "Male",
					'HideHair', false,
					'Hat2', "Faction_Militia_Scarf_01",
					'Hat2Spot', "Origin",
				}),
				PlaceObj('FinalStandAttirePoolHat2', {
					'Colors', {
						PlaceObj('ColorizationPropSet', {
							'EditableColor1', RGBA(205, 107, 28, 255),
							'EditableColor2', RGBA(205, 107, 28, 255),
							'EditableColor3', RGBA(205, 107, 28, 255),
						}),
					},
					'Gender', "Female",
					'HideHair', false,
					'Hat2', "NPCCostumeFemale_Scarf",
					'Hat2Spot', "Origin",
				}),
			},
			NameColor = 4286226623,
			Pants = {
				PlaceObj('FinalStandAttirePoolPants', {
					'Colors', {
						PlaceObj('ColorizationPropSet', {
							'EditableColor1', RGBA(42, 62, 41, 255),
							'EditableColor2', RGBA(20, 19, 19, 255),
							'EditableColor3', RGBA(6, 6, 6, 255),
						}),
					},
					'Gender', "Male",
					'Pants', "Faction_Adonis_Bottom_02",
				}),
				PlaceObj('FinalStandAttirePoolPants', {
					'Colors', {
						PlaceObj('ColorizationPropSet', {
							'EditableColor1', RGBA(23, 35, 22, 255),
							'EditableColor2', RGBA(20, 19, 19, 255),
							'EditableColor3', RGBA(6, 6, 6, 255),
						}),
					},
					'Gender', "Female",
					'Pants', "EquipmentFemale_Pants_01",
				}),
			},
			Specialization = "Mechanic",
			comment = "Artillery",
			group = "Militia",
			id = "MilitiaMechanic",
		}),
		PlaceObj('ModItemFinalStandAttirePoolDef', {
			Body = {
				PlaceObj('FinalStandAttirePoolBody', {
					'Colors', {
						PlaceObj('ColorizationPropSet', {
							'EditableColor1', RGBA(18, 8, 5, 255),
							'EditableColor2', RGBA(43, 38, 32, 255),
							'EditableColor3', RGBA(9, 7, 5, 255),
						}),
					},
					'Gender', "Male",
					'Body', "Faction_Rebels_Top_Comander",
					'BodyColorKey', "EditableColor1",
				}),
				PlaceObj('FinalStandAttirePoolBody', {
					'Colors', {
						PlaceObj('ColorizationPropSet', {
							'EditableColor1', RGBA(18, 8, 5, 255),
							'EditableColor2', RGBA(43, 38, 32, 255),
							'EditableColor3', RGBA(9, 7, 5, 255),
						}),
					},
					'Gender', "Female",
					'Body', "Female_Body_01",
					'BodyColorKey', "EditableColor2",
				}),
			},
			Hat = {
				PlaceObj('FinalStandAttirePoolHat', {
					'Colors', {
						PlaceObj('ColorizationPropSet', {
							'EditableColor1', RGBA(75, 10, 5, 255),
							'EditableColor2', RGBA(75, 10, 5, 255),
							'EditableColor3', RGBA(75, 10, 5, 255),
						}),
					},
					'Hat', "FactionMale_Hat_05",
				}),
			},
			NameColor = 4286226623,
			Pants = {
				PlaceObj('FinalStandAttirePoolPants', {
					'Colors', {
						PlaceObj('ColorizationPropSet', {
							'EditableColor1', RGBA(29, 24, 24, 255),
							'EditableColor2', RGBA(28, 24, 21, 255),
							'EditableColor3', RGBA(10, 6, 4, 255),
						}),
					},
					'Gender', "Male",
					'Pants', "Faction_GrandChien_Bottom_03",
				}),
				PlaceObj('FinalStandAttirePoolPants', {
					'Colors', {
						PlaceObj('ColorizationPropSet', {
							'EditableColor1', RGBA(29, 24, 24, 255),
							'EditableColor2', RGBA(28, 24, 21, 255),
							'EditableColor3', RGBA(10, 6, 4, 255),
						}),
					},
					'Gender', "Female",
					'Pants', "EquipmentFemale_Pants_03",
				}),
			},
			Shirt = {
				PlaceObj('FinalStandAttirePoolShirt', {
					'Colors', {
						PlaceObj('ColorizationPropSet', {
							'EditableColor1', RGBA(43, 38, 32, 255),
							'EditableColor2', RGBA(43, 38, 32, 255),
							'EditableColor3', RGBA(9, 7, 5, 255),
						}),
					},
					'Gender', "Female",
					'Shirt', "EquipmentFemale_Shirt_01",
				}),
			},
			Specialization = "Leader",
			comment = "Commander",
			group = "Rebels",
			id = "RebelsLeader",
		}),
		PlaceObj('ModItemFinalStandAttirePoolDef', {
			Body = {
				PlaceObj('FinalStandAttirePoolBody', {
					'Colors', {
						PlaceObj('ColorizationPropSet', {
							'EditableColor1', RGBA(107, 46, 25, 255),
							'EditableColor2', RGBA(90, 51, 17, 255),
							'EditableColor3', RGBA(255, 255, 255, 255),
						}),
						PlaceObj('ColorizationPropSet', {
							'EditableColor1', RGBA(107, 46, 25, 255),
							'EditableColor2', RGBA(63, 51, 23, 255),
							'EditableColor3', RGBA(255, 255, 255, 255),
						}),
						PlaceObj('ColorizationPropSet', {
							'EditableColor1', RGBA(107, 46, 25, 255),
							'EditableColor2', RGBA(72, 65, 47, 255),
							'EditableColor3', RGBA(255, 255, 255, 255),
						}),
					},
					'Gender', "Male",
					'Body', "Faction_Rebels_Top_Marksman",
					'BodyColorKey', "EditableColor1",
				}),
				PlaceObj('FinalStandAttirePoolBody', {
					'Colors', {
						PlaceObj('ColorizationPropSet', {
							'EditableColor1', RGBA(17, 6, 2, 255),
							'EditableColor2', RGBA(34, 46, 27, 255),
							'EditableColor3', RGBA(0, 66, 130, 255),
						}),
						PlaceObj('ColorizationPropSet', {
							'EditableColor1', RGBA(63, 33, 14, 255),
							'EditableColor2', RGBA(44, 46, 27, 255),
							'EditableColor3', RGBA(12, 46, 80, 255),
						}),
						PlaceObj('ColorizationPropSet', {
							'EditableColor1', RGBA(10, 4, 2, 255),
							'EditableColor2', RGBA(22, 21, 15, 255),
							'EditableColor3', RGBA(27, 64, 101, 255),
						}),
					},
					'Gender', "Male",
					'Body', "Faction_Rebels_Top_Recon",
					'BodyColorKey', "EditableColor1",
				}),
				PlaceObj('FinalStandAttirePoolBody', {
					'Colors', {
						PlaceObj('ColorizationPropSet', nil),
					},
					'Gender', "Female",
					'Body', "Female_Body_01",
					'BodyColorKey', "EditableColor1",
				}),
			},
			Hat = {
				PlaceObj('FinalStandAttirePoolHat', {
					'Colors', {
						PlaceObj('ColorizationPropSet', {
							'EditableColor1', RGBA(44, 22, 13, 255),
							'EditableColor2', RGBA(10, 4, 2, 255),
							'EditableColor3', RGBA(0, 0, 0, 255),
						}),
						PlaceObj('ColorizationPropSet', {
							'EditableColor1', RGBA(44, 22, 13, 255),
							'EditableColor2', RGBA(26, 23, 11, 255),
							'EditableColor3', RGBA(0, 0, 0, 255),
						}),
						PlaceObj('ColorizationPropSet', {
							'EditableColor1', RGBA(35, 41, 20, 255),
							'EditableColor2', RGBA(10, 4, 2, 255),
							'EditableColor3', RGBA(0, 0, 0, 255),
						}),
					},
					'Hat', "FactionMale_Hat_07",
				}),
			},
			Hat2 = {
				PlaceObj('FinalStandAttirePoolHat2', {
					'Colors', {
						PlaceObj('ColorizationPropSet', {
							'EditableColor1', RGBA(17, 30, 13, 255),
							'EditableColor2', RGBA(17, 30, 13, 255),
							'EditableColor3', RGBA(11, 32, 4, 255),
						}),
						PlaceObj('ColorizationPropSet', {
							'EditableColor1', RGBA(51, 36, 18, 255),
							'EditableColor2', RGBA(26, 20, 13, 255),
							'EditableColor3', RGBA(11, 32, 4, 255),
						}),
						PlaceObj('ColorizationPropSet', {
							'EditableColor1', RGBA(30, 19, 13, 255),
							'EditableColor2', RGBA(60, 33, 19, 255),
							'EditableColor3', RGBA(11, 32, 4, 255),
						}),
					},
					'Gender', "Male",
					'HideHair', false,
					'Hat2', "MilitiaCostumeMale_Mask_02",
					'Hat2Spot', "Origin",
				}),
			},
			NameColor = 4286226623,
			Pants = {
				PlaceObj('FinalStandAttirePoolPants', {
					'Colors', {
						PlaceObj('ColorizationPropSet', {
							'EditableColor1', RGBA(46, 60, 39, 255),
							'EditableColor2', RGBA(26, 23, 23, 255),
							'EditableColor3', RGBA(13, 11, 11, 255),
						}),
						PlaceObj('ColorizationPropSet', {
							'EditableColor1', RGBA(32, 46, 38, 255),
							'EditableColor2', RGBA(167, 104, 44, 255),
							'EditableColor3', RGBA(13, 11, 11, 255),
						}),
						PlaceObj('ColorizationPropSet', {
							'EditableColor1', RGBA(21, 25, 27, 255),
							'EditableColor2', RGBA(26, 23, 23, 255),
							'EditableColor3', RGBA(13, 11, 11, 255),
						}),
					},
					'Gender', "Male",
					'Pants', "Faction_GrandChien_Bottom_03",
				}),
				PlaceObj('FinalStandAttirePoolPants', {
					'Colors', {
						PlaceObj('ColorizationPropSet', {
							'EditableColor1', RGBA(46, 60, 39, 255),
							'EditableColor2', RGBA(25, 38, 18, 255),
							'EditableColor3', RGBA(0, 0, 0, 255),
						}),
						PlaceObj('ColorizationPropSet', {
							'EditableColor1', RGBA(30, 37, 27, 255),
							'EditableColor2', RGBA(25, 38, 18, 255),
							'EditableColor3', RGBA(0, 0, 0, 255),
						}),
						PlaceObj('ColorizationPropSet', {
							'EditableColor1', RGBA(25, 29, 24, 255),
							'EditableColor2', RGBA(105, 105, 105, 255),
							'EditableColor3', RGBA(0, 0, 0, 255),
						}),
					},
					'Gender', "Male",
					'Pants', "Faction_GrandChien_Bottom_02",
				}),
				PlaceObj('FinalStandAttirePoolPants', {
					'Colors', {
						PlaceObj('ColorizationPropSet', {
							'EditableColor1', RGBA(46, 60, 39, 255),
							'EditableColor2', RGBA(26, 23, 23, 255),
							'EditableColor3', RGBA(13, 11, 11, 255),
						}),
						PlaceObj('ColorizationPropSet', {
							'EditableColor1', RGBA(32, 46, 38, 255),
							'EditableColor2', RGBA(167, 104, 44, 255),
							'EditableColor3', RGBA(13, 11, 11, 255),
						}),
						PlaceObj('ColorizationPropSet', {
							'EditableColor1', RGBA(21, 25, 27, 255),
							'EditableColor2', RGBA(26, 23, 23, 255),
							'EditableColor3', RGBA(13, 11, 11, 255),
						}),
					},
					'Gender', "Female",
					'Pants', "EquipmentFemale_Pants_01",
				}),
				PlaceObj('FinalStandAttirePoolPants', {
					'Colors', {
						PlaceObj('ColorizationPropSet', {
							'EditableColor1', RGBA(46, 60, 39, 255),
							'EditableColor2', RGBA(25, 38, 18, 255),
							'EditableColor3', RGBA(0, 0, 0, 255),
						}),
						PlaceObj('ColorizationPropSet', {
							'EditableColor1', RGBA(30, 37, 27, 255),
							'EditableColor2', RGBA(25, 38, 18, 255),
							'EditableColor3', RGBA(0, 0, 0, 255),
						}),
						PlaceObj('ColorizationPropSet', {
							'EditableColor1', RGBA(25, 29, 24, 255),
							'EditableColor2', RGBA(105, 105, 105, 255),
							'EditableColor3', RGBA(0, 0, 0, 255),
						}),
					},
					'Gender', "Female",
					'Pants', "EquipmentFemale_Pants_02",
				}),
			},
			Shirt = {
				PlaceObj('FinalStandAttirePoolShirt', {
					'Colors', {
						PlaceObj('ColorizationPropSet', {
							'EditableColor1', RGBA(17, 16, 16, 255),
							'EditableColor2', RGBA(17, 16, 16, 255),
							'EditableColor3', RGBA(17, 16, 16, 255),
						}),
					},
					'Gender', "Male",
					'Shirt', "Faction_Gloves_01",
				}),
				PlaceObj('FinalStandAttirePoolShirt', {
					'Colors', {
						PlaceObj('ColorizationPropSet', {
							'EditableColor1', RGBA(107, 46, 25, 255),
							'EditableColor2', RGBA(90, 51, 17, 255),
							'EditableColor3', RGBA(255, 255, 255, 255),
						}),
						PlaceObj('ColorizationPropSet', {
							'EditableColor1', RGBA(107, 46, 25, 255),
							'EditableColor2', RGBA(63, 51, 23, 255),
							'EditableColor3', RGBA(255, 255, 255, 255),
						}),
						PlaceObj('ColorizationPropSet', {
							'EditableColor1', RGBA(107, 46, 25, 255),
							'EditableColor2', RGBA(72, 65, 47, 255),
							'EditableColor3', RGBA(255, 255, 255, 255),
						}),
					},
					'Gender', "Female",
					'Shirt', "EquipmentFemale_Shirt_01",
				}),
				PlaceObj('FinalStandAttirePoolShirt', {
					'Colors', {
						PlaceObj('ColorizationPropSet', {
							'EditableColor1', RGBA(34, 46, 27, 255),
							'EditableColor2', RGBA(34, 46, 27, 255),
							'EditableColor3', RGBA(0, 66, 130, 255),
						}),
						PlaceObj('ColorizationPropSet', {
							'EditableColor1', RGBA(44, 46, 27, 255),
							'EditableColor2', RGBA(44, 46, 27, 255),
							'EditableColor3', RGBA(12, 46, 80, 255),
						}),
						PlaceObj('ColorizationPropSet', {
							'EditableColor1', RGBA(22, 21, 15, 255),
							'EditableColor2', RGBA(22, 21, 15, 255),
							'EditableColor3', RGBA(27, 64, 101, 255),
						}),
					},
					'Gender', "Female",
					'Shirt', "EquipmentFemale_Shirt_02",
				}),
			},
			Specialization = "Marksmen",
			comment = "Marksman, Recon",
			group = "Rebels",
			id = "RebelsMarksmen",
		}),
		PlaceObj('ModItemFinalStandAttirePoolDef', {
			Armor = {
				PlaceObj('FinalStandAttirePoolArmor', {
					'Colors', {
						PlaceObj('ColorizationPropSet', {
							'EditableColor1', RGBA(46, 60, 39, 255),
							'EditableColor2', RGBA(46, 60, 39, 255),
							'EditableColor3', RGBA(15, 14, 14, 255),
						}),
						PlaceObj('ColorizationPropSet', {
							'EditableColor1', RGBA(60, 58, 39, 255),
							'EditableColor2', RGBA(60, 58, 39, 255),
							'EditableColor3', RGBA(21, 20, 18, 255),
						}),
						PlaceObj('ColorizationPropSet', {
							'EditableColor1', RGBA(29, 31, 20, 255),
							'EditableColor2', RGBA(29, 31, 20, 255),
							'EditableColor3', RGBA(15, 14, 14, 255),
						}),
					},
					'Gender', "Female",
					'Armor', "EquipmentFemale_FlackVest",
				}),
			},
			Body = {
				PlaceObj('FinalStandAttirePoolBody', {
					'Colors', {
						PlaceObj('ColorizationPropSet', {
							'EditableColor1', RGBA(115, 48, 27, 255),
							'EditableColor2', RGBA(46, 60, 39, 255),
							'EditableColor3', RGBA(15, 14, 14, 255),
						}),
						PlaceObj('ColorizationPropSet', {
							'EditableColor1', RGBA(115, 48, 27, 255),
							'EditableColor2', RGBA(60, 58, 39, 255),
							'EditableColor3', RGBA(21, 20, 18, 255),
						}),
						PlaceObj('ColorizationPropSet', {
							'EditableColor1', RGBA(115, 48, 27, 255),
							'EditableColor2', RGBA(29, 31, 20, 255),
							'EditableColor3', RGBA(15, 14, 14, 255),
						}),
					},
					'Gender', "Male",
					'Body', "Faction_Rebels_Top_Heavy",
					'BodyColorKey', "EditableColor1",
				}),
				PlaceObj('FinalStandAttirePoolBody', {
					'Colors', {
						PlaceObj('ColorizationPropSet', {
							'EditableColor1', RGBA(73, 31, 18, 255),
							'EditableColor2', RGBA(34, 46, 27, 255),
							'EditableColor3', RGBA(19, 7, 2, 255),
						}),
						PlaceObj('ColorizationPropSet', {
							'EditableColor1', RGBA(73, 31, 18, 255),
							'EditableColor2', RGBA(46, 42, 27, 255),
							'EditableColor3', RGBA(19, 7, 2, 255),
						}),
						PlaceObj('ColorizationPropSet', {
							'EditableColor1', RGBA(73, 31, 18, 255),
							'EditableColor2', RGBA(27, 36, 22, 255),
							'EditableColor3', RGBA(19, 7, 2, 255),
						}),
						PlaceObj('ColorizationPropSet', {
							'EditableColor1', RGBA(36, 16, 11, 255),
							'EditableColor2', RGBA(33, 36, 22, 255),
							'EditableColor3', RGBA(19, 7, 2, 255),
						}),
					},
					'Gender', "Male",
					'Body', "Faction_Rebels_Top_Soldier",
					'BodyColorKey', "EditableColor1",
				}),
				PlaceObj('FinalStandAttirePoolBody', {
					'Colors', {
						PlaceObj('ColorizationPropSet', {
							'EditableColor1', RGBA(78, 34, 22, 255),
							'EditableColor2', RGBA(85, 33, 17, 255),
						}),
						PlaceObj('ColorizationPropSet', {
							'EditableColor1', RGBA(40, 21, 10, 255),
							'EditableColor2', RGBA(60, 30, 19, 255),
							'EditableColor3', RGBA(24, 16, 16, 255),
						}),
						PlaceObj('ColorizationPropSet', {
							'EditableColor1', RGBA(78, 34, 22, 255),
							'EditableColor2', RGBA(40, 25, 21, 255),
							'EditableColor3', RGBA(255, 255, 255, 255),
						}),
					},
					'Gender', "Male",
					'Body', "Faction_Rebels_Top_Stormer",
					'BodyColorKey', "EditableColor1",
				}),
				PlaceObj('FinalStandAttirePoolBody', {
					'Colors', {
						PlaceObj('ColorizationPropSet', {
							'EditableColor1', RGBA(46, 60, 39, 255),
							'EditableColor2', RGBA(46, 60, 39, 255),
							'EditableColor3', RGBA(15, 14, 14, 255),
						}),
						PlaceObj('ColorizationPropSet', {
							'EditableColor1', RGBA(60, 58, 39, 255),
							'EditableColor2', RGBA(60, 58, 39, 255),
							'EditableColor3', RGBA(21, 20, 18, 255),
						}),
						PlaceObj('ColorizationPropSet', {
							'EditableColor1', RGBA(29, 31, 20, 255),
							'EditableColor2', RGBA(29, 31, 20, 255),
							'EditableColor3', RGBA(15, 14, 14, 255),
						}),
					},
					'Gender', "Female",
					'Body', "NPCCostumeFemale_Shirt_01",
					'BodyColorKey', "EditableColor2",
				}),
				PlaceObj('FinalStandAttirePoolBody', {
					'Colors', {
						PlaceObj('ColorizationPropSet', {
							'EditableColor1', RGBA(34, 46, 27, 255),
							'EditableColor2', RGBA(34, 46, 27, 255),
							'EditableColor3', RGBA(19, 7, 2, 255),
						}),
						PlaceObj('ColorizationPropSet', {
							'EditableColor1', RGBA(46, 42, 27, 255),
							'EditableColor2', RGBA(46, 42, 27, 255),
							'EditableColor3', RGBA(19, 7, 2, 255),
						}),
						PlaceObj('ColorizationPropSet', {
							'EditableColor1', RGBA(27, 36, 22, 255),
							'EditableColor2', RGBA(27, 36, 22, 255),
							'EditableColor3', RGBA(19, 7, 2, 255),
						}),
						PlaceObj('ColorizationPropSet', {
							'EditableColor1', RGBA(33, 36, 22, 255),
							'EditableColor2', RGBA(33, 36, 22, 255),
							'EditableColor3', RGBA(19, 7, 2, 255),
						}),
					},
					'Gender', "Female",
					'Body', "NPCCostumeFemale_Shirt_02",
					'BodyColorKey', "EditableColor1",
				}),
				PlaceObj('FinalStandAttirePoolBody', {
					'Colors', {
						PlaceObj('ColorizationPropSet', {
							'EditableColor1', RGBA(85, 33, 17, 255),
							'EditableColor2', RGBA(85, 33, 17, 255),
							'EditableColor3', RGBA(85, 33, 17, 255),
						}),
						PlaceObj('ColorizationPropSet', {
							'EditableColor1', RGBA(60, 30, 19, 255),
							'EditableColor2', RGBA(60, 30, 19, 255),
							'EditableColor3', RGBA(24, 16, 16, 255),
						}),
						PlaceObj('ColorizationPropSet', {
							'EditableColor1', RGBA(40, 25, 21, 255),
							'EditableColor2', RGBA(40, 25, 21, 255),
							'EditableColor3', RGBA(40, 25, 21, 255),
						}),
					},
					'Gender', "Female",
					'Body', "NPCCostumeFemale_Shirt_04",
					'BodyColorKey', "EditableColor1",
				}),
			},
			Hat = {
				PlaceObj('FinalStandAttirePoolHat', {
					'Colors', {
						PlaceObj('ColorizationPropSet', {
							'EditableColor1', RGBA(12, 12, 12, 255),
							'EditableColor2', RGBA(25, 38, 18, 255),
							'EditableColor3', RGBA(0, 0, 0, 255),
						}),
						PlaceObj('ColorizationPropSet', {
							'EditableColor1', RGBA(30, 27, 27, 255),
							'EditableColor2', RGBA(25, 38, 18, 255),
							'EditableColor3', RGBA(0, 0, 0, 255),
						}),
						PlaceObj('ColorizationPropSet', {
							'EditableColor1', RGBA(34, 35, 24, 255),
							'EditableColor2', RGBA(25, 38, 18, 255),
							'EditableColor3', RGBA(0, 0, 0, 255),
						}),
						PlaceObj('ColorizationPropSet', {
							'EditableColor1', RGBA(44, 66, 34, 255),
						}),
						PlaceObj('ColorizationPropSet', {
							'EditableColor1', RGBA(25, 29, 17, 255),
						}),
						PlaceObj('ColorizationPropSet', {
							'EditableColor1', RGBA(44, 34, 17, 255),
						}),
						PlaceObj('ColorizationPropSet', {
							'EditableColor1', RGBA(50, 55, 16, 255),
						}),
						PlaceObj('ColorizationPropSet', {
							'EditableColor1', RGBA(57, 6, 6, 255),
							'EditableColor2', RGBA(57, 6, 6, 255),
						}),
						PlaceObj('ColorizationPropSet', {
							'EditableColor1', RGBA(33, 10, 6, 255),
							'EditableColor2', RGBA(94, 35, 35, 255),
						}),
						PlaceObj('ColorizationPropSet', {
							'EditableColor1', RGBA(37, 11, 10, 255),
							'EditableColor2', RGBA(57, 6, 6, 255),
						}),
					},
					'Gender', "Male",
					'RollForHat2', false,
					'Hat', "MilitiaCostumeMale_Mask_01",
					'HatSpot', "Origin",
				}),
				PlaceObj('FinalStandAttirePoolHat', {
					'Colors', {
						PlaceObj('ColorizationPropSet', {
							'EditableColor1', RGBA(12, 12, 12, 255),
							'EditableColor2', RGBA(25, 38, 18, 255),
							'EditableColor3', RGBA(0, 0, 0, 255),
						}),
						PlaceObj('ColorizationPropSet', {
							'EditableColor1', RGBA(30, 27, 27, 255),
							'EditableColor2', RGBA(25, 38, 18, 255),
							'EditableColor3', RGBA(0, 0, 0, 255),
						}),
						PlaceObj('ColorizationPropSet', {
							'EditableColor1', RGBA(34, 35, 24, 255),
							'EditableColor2', RGBA(25, 38, 18, 255),
							'EditableColor3', RGBA(0, 0, 0, 255),
						}),
						PlaceObj('ColorizationPropSet', {
							'EditableColor1', RGBA(44, 66, 34, 255),
						}),
						PlaceObj('ColorizationPropSet', {
							'EditableColor1', RGBA(25, 29, 17, 255),
						}),
						PlaceObj('ColorizationPropSet', {
							'EditableColor1', RGBA(44, 34, 17, 255),
						}),
						PlaceObj('ColorizationPropSet', {
							'EditableColor1', RGBA(50, 55, 16, 255),
						}),
						PlaceObj('ColorizationPropSet', {
							'EditableColor1', RGBA(57, 6, 6, 255),
							'EditableColor2', RGBA(57, 6, 6, 255),
						}),
						PlaceObj('ColorizationPropSet', {
							'EditableColor1', RGBA(33, 10, 6, 255),
							'EditableColor2', RGBA(94, 35, 35, 255),
						}),
						PlaceObj('ColorizationPropSet', {
							'EditableColor1', RGBA(37, 11, 10, 255),
							'EditableColor2', RGBA(57, 6, 6, 255),
						}),
					},
					'Hat', "FactionMale_Hat_05",
					'HatAttachOffsetX', 4,
				}),
				PlaceObj('FinalStandAttirePoolHat', {
					'Colors', {
						PlaceObj('ColorizationPropSet', {
							'EditableColor1', RGBA(12, 12, 12, 255),
							'EditableColor2', RGBA(12, 12, 12, 255),
							'EditableColor3', RGBA(12, 12, 12, 255),
						}),
						PlaceObj('ColorizationPropSet', {
							'EditableColor1', RGBA(30, 27, 27, 255),
							'EditableColor2', RGBA(30, 27, 27, 255),
							'EditableColor3', RGBA(30, 27, 27, 255),
						}),
						PlaceObj('ColorizationPropSet', {
							'EditableColor1', RGBA(34, 35, 24, 255),
							'EditableColor2', RGBA(34, 35, 24, 255),
							'EditableColor3', RGBA(34, 35, 24, 255),
						}),
						PlaceObj('ColorizationPropSet', {
							'EditableColor1', RGBA(44, 66, 34, 255),
							'EditableColor2', RGBA(44, 66, 34, 255),
							'EditableColor3', RGBA(44, 66, 34, 255),
						}),
						PlaceObj('ColorizationPropSet', {
							'EditableColor1', RGBA(25, 29, 17, 255),
							'EditableColor2', RGBA(25, 29, 17, 255),
							'EditableColor3', RGBA(25, 29, 17, 255),
						}),
						PlaceObj('ColorizationPropSet', {
							'EditableColor1', RGBA(44, 34, 17, 255),
							'EditableColor2', RGBA(44, 34, 17, 255),
							'EditableColor3', RGBA(44, 34, 17, 255),
						}),
						PlaceObj('ColorizationPropSet', {
							'EditableColor1', RGBA(50, 55, 16, 255),
							'EditableColor2', RGBA(50, 55, 16, 255),
							'EditableColor3', RGBA(50, 55, 16, 255),
						}),
						PlaceObj('ColorizationPropSet', {
							'EditableColor1', RGBA(57, 6, 6, 255),
							'EditableColor2', RGBA(57, 6, 6, 255),
							'EditableColor3', RGBA(57, 6, 6, 255),
						}),
						PlaceObj('ColorizationPropSet', {
							'EditableColor1', RGBA(33, 10, 6, 255),
							'EditableColor2', RGBA(33, 10, 6, 255),
							'EditableColor3', RGBA(33, 10, 6, 255),
						}),
						PlaceObj('ColorizationPropSet', {
							'EditableColor1', RGBA(37, 11, 10, 255),
							'EditableColor2', RGBA(37, 11, 10, 255),
							'EditableColor3', RGBA(37, 11, 10, 255),
						}),
					},
					'Hat', "FactionMale_Hat_10",
				}),
			},
			Hat2 = {
				PlaceObj('FinalStandAttirePoolHat2', {
					'Colors', {
						PlaceObj('ColorizationPropSet', {
							'EditableColor1', RGBA(12, 12, 12, 255),
							'EditableColor2', RGBA(12, 12, 12, 255),
							'EditableColor3', RGBA(12, 12, 12, 255),
						}),
						PlaceObj('ColorizationPropSet', {
							'EditableColor1', RGBA(30, 27, 27, 255),
							'EditableColor2', RGBA(30, 27, 27, 255),
							'EditableColor3', RGBA(30, 27, 27, 255),
						}),
						PlaceObj('ColorizationPropSet', {
							'EditableColor1', RGBA(34, 35, 24, 255),
							'EditableColor2', RGBA(34, 35, 24, 255),
							'EditableColor3', RGBA(34, 35, 24, 255),
						}),
						PlaceObj('ColorizationPropSet', {
							'EditableColor1', RGBA(44, 66, 34, 255),
							'EditableColor2', RGBA(44, 66, 34, 255),
							'EditableColor3', RGBA(44, 66, 34, 255),
						}),
						PlaceObj('ColorizationPropSet', {
							'EditableColor1', RGBA(25, 29, 17, 255),
							'EditableColor2', RGBA(25, 29, 17, 255),
							'EditableColor3', RGBA(25, 29, 17, 255),
						}),
						PlaceObj('ColorizationPropSet', {
							'EditableColor1', RGBA(44, 34, 17, 255),
							'EditableColor2', RGBA(44, 34, 17, 255),
							'EditableColor3', RGBA(44, 34, 17, 255),
						}),
						PlaceObj('ColorizationPropSet', {
							'EditableColor1', RGBA(50, 55, 16, 255),
							'EditableColor2', RGBA(50, 55, 16, 255),
							'EditableColor3', RGBA(50, 55, 16, 255),
						}),
						PlaceObj('ColorizationPropSet', {
							'EditableColor1', RGBA(57, 6, 6, 255),
							'EditableColor2', RGBA(57, 6, 6, 255),
							'EditableColor3', RGBA(57, 6, 6, 255),
						}),
						PlaceObj('ColorizationPropSet', {
							'EditableColor1', RGBA(33, 10, 6, 255),
							'EditableColor2', RGBA(33, 10, 6, 255),
							'EditableColor3', RGBA(33, 10, 6, 255),
						}),
						PlaceObj('ColorizationPropSet', {
							'EditableColor1', RGBA(37, 11, 10, 255),
							'EditableColor2', RGBA(37, 11, 10, 255),
							'EditableColor3', RGBA(37, 11, 10, 255),
						}),
					},
					'Gender', "Male",
					'HideHair', false,
					'Hat2', "MilitiaCostumeMale_Mask_02",
					'Hat2Spot', "Origin",
				}),
			},
			NameColor = 4286226623,
			Pants = {
				PlaceObj('FinalStandAttirePoolPants', {
					'Colors', {
						PlaceObj('ColorizationPropSet', {
							'EditableColor1', RGBA(46, 60, 39, 255),
							'EditableColor2', RGBA(26, 23, 23, 255),
							'EditableColor3', RGBA(13, 11, 11, 255),
						}),
						PlaceObj('ColorizationPropSet', {
							'EditableColor1', RGBA(60, 58, 39, 255),
							'EditableColor2', RGBA(26, 23, 23, 255),
							'EditableColor3', RGBA(13, 11, 11, 255),
						}),
						PlaceObj('ColorizationPropSet', {
							'EditableColor1', RGBA(36, 37, 24, 255),
							'EditableColor2', RGBA(26, 23, 23, 255),
							'EditableColor3', RGBA(13, 11, 11, 255),
						}),
					},
					'Gender', "Male",
					'Pants', "Faction_GrandChien_Bottom_04",
				}),
				PlaceObj('FinalStandAttirePoolPants', {
					'Colors', {
						PlaceObj('ColorizationPropSet', {
							'EditableColor1', RGBA(46, 60, 39, 255),
							'EditableColor2', RGBA(11, 11, 11, 255),
							'EditableColor3', RGBA(14, 14, 14, 255),
						}),
						PlaceObj('ColorizationPropSet', {
							'EditableColor1', RGBA(54, 60, 39, 255),
							'EditableColor2', RGBA(75, 30, 30, 255),
							'EditableColor3', RGBA(14, 14, 14, 255),
						}),
						PlaceObj('ColorizationPropSet', {
							'EditableColor1', RGBA(24, 29, 20, 255),
							'EditableColor2', RGBA(158, 114, 52, 255),
							'EditableColor3', RGBA(14, 14, 14, 255),
						}),
						PlaceObj('ColorizationPropSet', {
							'EditableColor1', RGBA(47, 43, 27, 255),
							'EditableColor2', RGBA(158, 114, 52, 255),
							'EditableColor3', RGBA(14, 14, 14, 255),
						}),
					},
					'Gender', "Male",
					'Pants', "Faction_GrandChien_Bottom_03",
				}),
				PlaceObj('FinalStandAttirePoolPants', {
					'Colors', {
						PlaceObj('ColorizationPropSet', {
							'EditableColor1', RGBA(46, 60, 39, 255),
							'EditableColor2', RGBA(26, 18, 16, 255),
							'EditableColor3', RGBA(0, 0, 0, 255),
						}),
						PlaceObj('ColorizationPropSet', {
							'EditableColor1', RGBA(77, 59, 38, 255),
							'EditableColor2', RGBA(77, 59, 38, 255),
							'EditableColor3', RGBA(29, 35, 1, 255),
						}),
						PlaceObj('ColorizationPropSet', {
							'EditableColor1', RGBA(40, 39, 24, 255),
							'EditableColor2', RGBA(145, 122, 87, 255),
							'EditableColor3', RGBA(0, 0, 0, 255),
						}),
					},
					'Gender', "Male",
					'Pants', "Faction_GrandChien_Bottom_02",
				}),
				PlaceObj('FinalStandAttirePoolPants', {
					'Colors', {
						PlaceObj('ColorizationPropSet', {
							'EditableColor1', RGBA(46, 60, 39, 255),
							'EditableColor2', RGBA(26, 23, 23, 255),
							'EditableColor3', RGBA(13, 11, 11, 255),
						}),
						PlaceObj('ColorizationPropSet', {
							'EditableColor1', RGBA(60, 58, 39, 255),
							'EditableColor2', RGBA(26, 23, 23, 255),
							'EditableColor3', RGBA(13, 11, 11, 255),
						}),
						PlaceObj('ColorizationPropSet', {
							'EditableColor1', RGBA(36, 37, 24, 255),
							'EditableColor2', RGBA(26, 23, 23, 255),
							'EditableColor3', RGBA(13, 11, 11, 255),
						}),
					},
					'Gender', "Female",
					'Pants', "EquipmentFemale_Pants_01",
				}),
				PlaceObj('FinalStandAttirePoolPants', {
					'Colors', {
						PlaceObj('ColorizationPropSet', {
							'EditableColor1', RGBA(46, 60, 39, 255),
							'EditableColor2', RGBA(11, 11, 11, 255),
							'EditableColor3', RGBA(14, 14, 14, 255),
						}),
						PlaceObj('ColorizationPropSet', {
							'EditableColor1', RGBA(54, 60, 39, 255),
							'EditableColor2', RGBA(75, 30, 30, 255),
							'EditableColor3', RGBA(14, 14, 14, 255),
						}),
						PlaceObj('ColorizationPropSet', {
							'EditableColor1', RGBA(24, 29, 20, 255),
							'EditableColor2', RGBA(158, 114, 52, 255),
							'EditableColor3', RGBA(14, 14, 14, 255),
						}),
						PlaceObj('ColorizationPropSet', {
							'EditableColor1', RGBA(47, 43, 27, 255),
							'EditableColor2', RGBA(158, 114, 52, 255),
							'EditableColor3', RGBA(14, 14, 14, 255),
						}),
					},
					'Gender', "Female",
					'Pants', "EquipmentFemale_Pants_02",
				}),
				PlaceObj('FinalStandAttirePoolPants', {
					'Colors', {
						PlaceObj('ColorizationPropSet', {
							'EditableColor1', RGBA(46, 60, 39, 255),
							'EditableColor2', RGBA(26, 18, 16, 255),
							'EditableColor3', RGBA(0, 0, 0, 255),
						}),
						PlaceObj('ColorizationPropSet', {
							'EditableColor1', RGBA(77, 59, 38, 255),
							'EditableColor2', RGBA(77, 59, 38, 255),
							'EditableColor3', RGBA(29, 35, 1, 255),
						}),
						PlaceObj('ColorizationPropSet', {
							'EditableColor1', RGBA(40, 39, 24, 255),
							'EditableColor2', RGBA(145, 122, 87, 255),
							'EditableColor3', RGBA(0, 0, 0, 255),
						}),
					},
					'Gender', "Female",
					'Pants', "EquipmentFemale_Pants_01",
				}),
			},
			Specialization = "AllRounder",
			comment = "Heavy, Soldier, Stormer",
			group = "Rebels",
			id = "RebelsAllRounder",
		}),
		PlaceObj('ModItemFinalStandAttirePoolDef', {
			Body = {
				PlaceObj('FinalStandAttirePoolBody', {
					'Colors', {
						PlaceObj('ColorizationPropSet', {
							'EditableColor1', RGBA(121, 49, 33, 255),
							'EditableColor2', RGBA(83, 110, 44, 255),
							'EditableColor3', RGBA(3, 2, 2, 255),
						}),
						PlaceObj('ColorizationPropSet', {
							'EditableColor1', RGBA(76, 32, 14, 255),
							'EditableColor2', RGBA(72, 85, 53, 255),
							'EditableColor3', RGBA(3, 2, 2, 255),
						}),
						PlaceObj('ColorizationPropSet', {
							'EditableColor1', RGBA(36, 16, 12, 255),
							'EditableColor2', RGBA(99, 103, 47, 255),
							'EditableColor3', RGBA(3, 2, 2, 255),
						}),
					},
					'Gender', "Male",
					'Body', "Faction_Rebels_Top_Demolution",
					'BodyColorKey', "EditableColor1",
				}),
				PlaceObj('FinalStandAttirePoolBody', {
					'Colors', {
						PlaceObj('ColorizationPropSet', {
							'EditableColor1', RGBA(121, 49, 33, 255),
							'EditableColor2', RGBA(83, 110, 44, 255),
							'EditableColor3', RGBA(17, 11, 11, 255),
						}),
						PlaceObj('ColorizationPropSet', {
							'EditableColor1', RGBA(76, 32, 14, 255),
							'EditableColor2', RGBA(72, 85, 53, 255),
							'EditableColor3', RGBA(17, 11, 11, 255),
						}),
						PlaceObj('ColorizationPropSet', {
							'EditableColor1', RGBA(36, 16, 12, 255),
							'EditableColor2', RGBA(99, 103, 47, 255),
							'EditableColor3', RGBA(17, 11, 11, 255),
						}),
					},
					'Gender', "Female",
					'Body', "EquipmentIMPTrooper_Top",
					'BodyColorKey', "EditableColor1",
				}),
			},
			Hat = {
				PlaceObj('FinalStandAttirePoolHat', {
					'Colors', {
						PlaceObj('ColorizationPropSet', {
							'EditableColor1', RGBA(62, 8, 8, 255),
							'EditableColor2', RGBA(26, 23, 23, 255),
							'EditableColor3', RGBA(0, 0, 0, 255),
						}),
						PlaceObj('ColorizationPropSet', {
							'EditableColor1', RGBA(55, 30, 15, 255),
							'EditableColor2', RGBA(26, 23, 23, 255),
							'EditableColor3', RGBA(0, 0, 0, 255),
						}),
					},
					'Gender', "Male",
					'RollForHat2', false,
					'Hat', "MilitiaCostumeMale_Mask_01",
					'HatSpot', "Origin",
				}),
				PlaceObj('FinalStandAttirePoolHat', {
					'Colors', {
						PlaceObj('ColorizationPropSet', {
							'EditableColor1', RGBA(62, 8, 8, 255),
							'EditableColor2', RGBA(62, 8, 8, 255),
							'EditableColor3', RGBA(62, 8, 8, 255),
						}),
						PlaceObj('ColorizationPropSet', {
							'EditableColor1', RGBA(55, 30, 15, 255),
							'EditableColor2', RGBA(55, 30, 15, 255),
							'EditableColor3', RGBA(55, 30, 15, 255),
						}),
					},
					'Gender', "Female",
					'RollForHat2', false,
					'Hat', "FactionMale_Hat_10",
				}),
			},
			NameColor = 4286226623,
			Pants = {
				PlaceObj('FinalStandAttirePoolPants', {
					'Colors', {
						PlaceObj('ColorizationPropSet', {
							'EditableColor1', RGBA(46, 60, 39, 255),
							'EditableColor2', RGBA(26, 23, 23, 255),
							'EditableColor3', RGBA(26, 23, 23, 255),
						}),
						PlaceObj('ColorizationPropSet', {
							'EditableColor1', RGBA(38, 46, 34, 255),
							'EditableColor2', RGBA(113, 96, 78, 255),
							'EditableColor3', RGBA(26, 23, 23, 255),
						}),
						PlaceObj('ColorizationPropSet', {
							'EditableColor1', RGBA(31, 36, 29, 255),
							'EditableColor2', RGBA(167, 203, 132, 255),
							'EditableColor3', RGBA(26, 23, 23, 255),
						}),
					},
					'Gender', "Male",
					'Pants', "Faction_GrandChien_Bottom_03",
				}),
				PlaceObj('FinalStandAttirePoolPants', {
					'Colors', {
						PlaceObj('ColorizationPropSet', {
							'EditableColor1', RGBA(46, 60, 39, 255),
							'EditableColor2', RGBA(26, 23, 23, 255),
							'EditableColor3', RGBA(26, 23, 23, 255),
						}),
						PlaceObj('ColorizationPropSet', {
							'EditableColor1', RGBA(38, 46, 34, 255),
							'EditableColor2', RGBA(113, 96, 78, 255),
							'EditableColor3', RGBA(26, 23, 23, 255),
						}),
						PlaceObj('ColorizationPropSet', {
							'EditableColor1', RGBA(31, 36, 29, 255),
							'EditableColor2', RGBA(167, 203, 132, 255),
							'EditableColor3', RGBA(26, 23, 23, 255),
						}),
					},
					'Gender', "Female",
					'Pants', "EquipmentFemale_Pants_01",
				}),
			},
			Specialization = "ExplosiveExpert",
			comment = "Demolition",
			group = "Rebels",
			id = "RebelsExplosive",
		}),
		PlaceObj('ModItemFinalStandAttirePoolDef', {
			Body = {
				PlaceObj('FinalStandAttirePoolBody', {
					'Colors', {
						PlaceObj('ColorizationPropSet', {
							'EditableColor1', RGBA(19, 9, 7, 255),
							'EditableColor2', RGBA(151, 148, 140, 255),
							'EditableColor3', RGBA(152, 16, 16, 255),
						}),
						PlaceObj('ColorizationPropSet', {
							'EditableColor1', RGBA(19, 9, 7, 255),
							'EditableColor2', RGBA(72, 78, 57, 255),
							'EditableColor3', RGBA(152, 16, 16, 255),
						}),
						PlaceObj('ColorizationPropSet', {
							'EditableColor1', RGBA(19, 9, 7, 255),
							'EditableColor2', RGBA(80, 65, 50, 255),
							'EditableColor3', RGBA(152, 16, 16, 255),
						}),
					},
					'Gender', "Male",
					'Body', "Faction_Rebels_Top_Medic",
					'BodyColorKey', "EditableColor1",
				}),
				PlaceObj('FinalStandAttirePoolBody', {
					'Colors', {
						PlaceObj('ColorizationPropSet', {
							'EditableColor1', RGBA(151, 148, 140, 255),
							'EditableColor2', RGBA(151, 148, 140, 255),
							'EditableColor3', RGBA(152, 16, 16, 255),
						}),
						PlaceObj('ColorizationPropSet', {
							'EditableColor1', RGBA(72, 78, 57, 255),
							'EditableColor2', RGBA(72, 78, 57, 255),
							'EditableColor3', RGBA(152, 16, 16, 255),
						}),
						PlaceObj('ColorizationPropSet', {
							'EditableColor1', RGBA(80, 65, 50, 255),
							'EditableColor2', RGBA(80, 65, 50, 255),
							'EditableColor3', RGBA(152, 16, 16, 255),
						}),
					},
					'Gender', "Female",
					'Body', "NPCCostumeFemale_Shirt_01",
					'BodyColorKey', "EditableColor2",
				}),
			},
			Hat = {
				PlaceObj('FinalStandAttirePoolHat', {
					'Colors', {
						PlaceObj('ColorizationPropSet', {
							'EditableColor1', RGBA(255, 255, 255, 255),
							'EditableColor2', RGBA(0, 0, 0, 255),
							'EditableColor3', RGBA(9, 40, 7, 255),
						}),
						PlaceObj('ColorizationPropSet', {
							'EditableColor1', RGBA(190, 190, 190, 255),
							'EditableColor2', RGBA(0, 0, 0, 255),
							'EditableColor3', RGBA(9, 40, 7, 255),
						}),
						PlaceObj('ColorizationPropSet', {
							'EditableColor1', RGBA(166, 160, 141, 255),
							'EditableColor2', RGBA(0, 0, 0, 255),
							'EditableColor3', RGBA(9, 40, 7, 255),
						}),
					},
					'RollForHat2', false,
					'Hat', "FactionMale_Hat_08",
				}),
			},
			NameColor = 4286226623,
			Pants = {
				PlaceObj('FinalStandAttirePoolPants', {
					'Colors', {
						PlaceObj('ColorizationPropSet', {
							'EditableColor1', RGBA(46, 60, 39, 255),
							'EditableColor2', RGBA(26, 23, 23, 255),
							'EditableColor3', RGBA(13, 11, 11, 255),
						}),
						PlaceObj('ColorizationPropSet', {
							'EditableColor1', RGBA(27, 37, 31, 255),
							'EditableColor2', RGBA(26, 23, 23, 255),
							'EditableColor3', RGBA(13, 11, 11, 255),
						}),
						PlaceObj('ColorizationPropSet', {
							'EditableColor1', RGBA(44, 46, 40, 255),
							'EditableColor2', RGBA(166, 121, 77, 255),
							'EditableColor3', RGBA(13, 11, 11, 255),
						}),
					},
					'Gender', "Male",
					'Pants', "Faction_GrandChien_Bottom_03",
				}),
				PlaceObj('FinalStandAttirePoolPants', {
					'Colors', {
						PlaceObj('ColorizationPropSet', {
							'EditableColor1', RGBA(46, 60, 39, 255),
							'EditableColor2', RGBA(26, 23, 23, 255),
							'EditableColor3', RGBA(13, 11, 11, 255),
						}),
						PlaceObj('ColorizationPropSet', {
							'EditableColor1', RGBA(27, 37, 31, 255),
							'EditableColor2', RGBA(26, 23, 23, 255),
							'EditableColor3', RGBA(13, 11, 11, 255),
						}),
						PlaceObj('ColorizationPropSet', {
							'EditableColor1', RGBA(44, 46, 40, 255),
							'EditableColor2', RGBA(166, 121, 77, 255),
							'EditableColor3', RGBA(13, 11, 11, 255),
						}),
					},
					'Gender', "Female",
					'Pants', "EquipmentFemale_Pants_02",
				}),
			},
			Specialization = "Doctor",
			comment = "Medic",
			group = "Rebels",
			id = "RebelsDoctor",
		}),
		PlaceObj('ModItemFinalStandAttirePoolDef', {
			Body = {
				PlaceObj('FinalStandAttirePoolBody', {
					'Colors', {
						PlaceObj('ColorizationPropSet', {
							'EditableColor1', RGBA(26, 11, 6, 255),
							'EditableColor2', RGBA(61, 78, 28, 255),
						}),
						PlaceObj('ColorizationPropSet', {
							'EditableColor1', RGBA(41, 25, 13, 255),
							'EditableColor2', RGBA(23, 38, 29, 255),
						}),
						PlaceObj('ColorizationPropSet', {
							'EditableColor1', RGBA(84, 42, 15, 255),
							'EditableColor2', RGBA(46, 39, 21, 255),
						}),
					},
					'Gender', "Male",
					'Body', "Faction_Rebels_Top_Artillery",
					'BodyColorKey', "EditableColor1",
				}),
				PlaceObj('FinalStandAttirePoolBody', {
					'Colors', {
						PlaceObj('ColorizationPropSet', {
							'EditableColor1', RGBA(26, 11, 6, 255),
							'EditableColor2', RGBA(61, 78, 28, 255),
							'EditableColor3', RGBA(61, 78, 28, 255),
						}),
						PlaceObj('ColorizationPropSet', {
							'EditableColor1', RGBA(41, 25, 13, 255),
							'EditableColor2', RGBA(23, 38, 29, 255),
							'EditableColor3', RGBA(23, 38, 29, 255),
						}),
						PlaceObj('ColorizationPropSet', {
							'EditableColor1', RGBA(84, 42, 15, 255),
							'EditableColor2', RGBA(46, 39, 21, 255),
							'EditableColor3', RGBA(46, 39, 21, 255),
						}),
					},
					'Gender', "Female",
					'Body', "Faction_Infected_Top_F_02",
					'BodyColorKey', "EditableColor1",
				}),
			},
			Hat = {
				PlaceObj('FinalStandAttirePoolHat', {
					'Colors', {
						PlaceObj('ColorizationPropSet', {
							'EditableColor1', RGBA(36, 69, 21, 255),
							'EditableColor2', RGBA(20, 14, 6, 255),
							'EditableColor3', RGBA(36, 69, 21, 255),
						}),
					},
					'Gender', "Male",
					'Hat', "MilitiaCostumeMale_Mask_01",
					'HatSpot', "Origin",
				}),
				PlaceObj('FinalStandAttirePoolHat', {
					'Colors', {
						PlaceObj('ColorizationPropSet', {
							'EditableColor1', RGBA(36, 69, 21, 255),
							'EditableColor2', RGBA(20, 14, 6, 255),
							'EditableColor3', RGBA(36, 69, 21, 255),
						}),
					},
					'Gender', "Female",
					'Hat', "FactionMale_Hat_04",
					'HatAttachOffsetY', -3,
				}),
			},
			Hat2 = {
				PlaceObj('FinalStandAttirePoolHat2', {
					'HideHair', false,
					'Hat2', "EquipmentCorazon_Glasses_BattleMod",
				}),
			},
			NameColor = 4286226623,
			Pants = {
				PlaceObj('FinalStandAttirePoolPants', {
					'Colors', {
						PlaceObj('ColorizationPropSet', {
							'EditableColor1', RGBA(46, 60, 39, 255),
							'EditableColor2', RGBA(69, 58, 39, 255),
						}),
						PlaceObj('ColorizationPropSet', {
							'EditableColor1', RGBA(40, 56, 39, 255),
							'EditableColor2', RGBA(192, 103, 55, 255),
						}),
						PlaceObj('ColorizationPropSet', {
							'EditableColor1', RGBA(32, 35, 25, 255),
							'EditableColor2', RGBA(44, 38, 29, 255),
						}),
					},
					'Gender', "Male",
					'Pants', "Faction_GrandChien_Bottom_01",
				}),
				PlaceObj('FinalStandAttirePoolPants', {
					'Colors', {
						PlaceObj('ColorizationPropSet', {
							'EditableColor1', RGBA(26, 35, 22, 255),
							'EditableColor2', RGBA(69, 58, 39, 255),
							'EditableColor3', RGBA(0, 0, 0, 255),
						}),
						PlaceObj('ColorizationPropSet', {
							'EditableColor1', RGBA(25, 36, 24, 255),
							'EditableColor2', RGBA(192, 103, 55, 255),
							'EditableColor3', RGBA(0, 0, 0, 255),
						}),
						PlaceObj('ColorizationPropSet', {
							'EditableColor1', RGBA(24, 27, 19, 255),
							'EditableColor2', RGBA(44, 38, 29, 255),
							'EditableColor3', RGBA(0, 0, 0, 255),
						}),
					},
					'Gender', "Female",
					'Pants', "EquipmentIMPTrooper_Pants",
				}),
			},
			Specialization = "Mechanic",
			comment = "Artillery",
			group = "Rebels",
			id = "RebelsMechanic",
		}),
		}),
	PlaceObj('ModItemFolder', {
		'name', "Units",
	}, {
		PlaceObj('ModItemUnitDataCompositeDef', {
			'Group', "MercenariesNew",
			'Id', "Smiley_FS",
			'object_class', "UnitData",
			'Health', 82,
			'Agility', 78,
			'Dexterity', 56,
			'Strength', 73,
			'Wisdom', 55,
			'Leadership', 54,
			'Marksmanship', 77,
			'Mechanical', 5,
			'Explosives', 5,
			'Medical', 36,
			'Portrait', "UI/MercsPortraits/Smiley",
			'BigPortrait', "UI/Mercs/Smiley",
			'IsMercenary', true,
			'Name', T(385353787961, --[[ModItemUnitDataCompositeDef Smiley_FS Name]] 'Alejandro "Smiley" Diaz'),
			'Nick', T(927331763383, --[[ModItemUnitDataCompositeDef Smiley_FS Nick]] "Smiley"),
			'AllCapsNick', T(199872192967, --[[ModItemUnitDataCompositeDef Smiley_FS AllCapsNick]] "SMILEY"),
			'Bio', T(279931735040, --[[ModItemUnitDataCompositeDef Smiley_FS Bio]] 'Alejandro "Smiley" Diaz came to Grand Chien as mercenary serving some unknown small group - which got totally obliterated by the Major a few weeks before your encounter with him. An Arulco native, he is eager to join up with you, as A.I.M. is held in great regard in the new order back at his home country.'),
			'Nationality', "Arulco",
			'Title', T(935852850455, --[[ModItemUnitDataCompositeDef Smiley_FS Title]] "Romeo in Combat Fatigues"),
			'GreetingAndOffer', {
				PlaceObj('ChatMessage', {
					'Text', T(232075599586, --[[ModItemUnitDataCompositeDef Smiley_FS Text GreetingAndOffer ChatMessage voice:Smiley_FS]] "Hello, Alejandro's here!"),
				}),
			},
			'ConversationRestart', {
				PlaceObj('ChatMessage', {
					'Text', T(130806600380, --[[ModItemUnitDataCompositeDef Smiley_FS Text ConversationRestart ChatMessage voice:Smiley_FS]] "Sure friend, let's try again!"),
				}),
			},
			'IdleLine', {
				PlaceObj('ChatMessage', {
					'Text', T(753995661600, --[[ModItemUnitDataCompositeDef Smiley_FS Text IdleLine ChatMessage voice:Smiley_FS]] "Hello, is anyone still there?"),
				}),
			},
			'PartingWords', {
				PlaceObj('ChatMessage', {
					'Text', T(600050519058, --[[ModItemUnitDataCompositeDef Smiley_FS Text PartingWords ChatMessage voice:Smiley_FS]] "Awesome, let's head out!"),
				}),
			},
			'RehireIntro', {
				PlaceObj('ChatMessage', {
					'Text', T(137923880699, --[[ModItemUnitDataCompositeDef Smiley_FS Text RehireIntro ChatMessage voice:Smiley_FS]] "My contract is expiring, that shouldn't stop us from kicking ass!"),
				}),
			},
			'RehireOutro', {
				PlaceObj('ChatMessage', {
					'Text', T(205470923832, --[[ModItemUnitDataCompositeDef Smiley_FS Text RehireOutro ChatMessage voice:Smiley_FS]] "Private Smiley ready for redeployment, cap!"),
				}),
			},
			'StartingSalary', 1300,
			'SalaryIncrease', 210,
			'SalaryLv1', 0,
			'SalaryMaxLv', 0,
			'StartingLevel', 2,
			'CustomEquipGear', function (self, items)
				self:TryEquip(items, "Handheld A", "SubmachineGun")
				self:TryEquip(items, "Handheld B", "SniperRifle")
			end,
			'MaxHitPoints', 85,
			'LearnToLike', {
				"Kalyna",
				"Fox",
				"Buns",
			},
			'StartingPerks', {
				"AutoWeapons",
				"Optimist",
				"RecklessAssault",
				"BeefedUp",
			},
			'AppearancesList', {
				PlaceObj('AppearanceWeight', {
					'Preset', "Smiley",
				}),
			},
			'Equipment', {
				"Smiley",
			},
			'Specialization', "AllRounder",
			'gender', "Male",
			'VoiceResponseId', "Smiley",
			'IsFinalStandOnly', true,
		}),
		PlaceObj('ModItemUnitDataCompositeDef', {
			'Group', "MercenariesNew",
			'Id', "Pierre_FS",
			'object_class', "UnitData",
			'Health', 81,
			'Agility', 72,
			'Dexterity', 68,
			'Strength', 78,
			'Wisdom', 56,
			'Leadership', 39,
			'Marksmanship', 77,
			'Mechanical', 5,
			'Explosives', 15,
			'Medical', 12,
			'Portrait', "UI/MercsPortraits/Pierre",
			'BigPortrait', "UI/Mercs/Pierre",
			'IsMercenary', true,
			'Name', T(246681713040, --[[ModItemUnitDataCompositeDef Pierre_FS Name]] "Pierre Laurent"),
			'Nick', T(797749909826, --[[ModItemUnitDataCompositeDef Pierre_FS Nick]] "Pierre"),
			'AllCapsNick', T(649708061788, --[[ModItemUnitDataCompositeDef Pierre_FS AllCapsNick]] "PIERRE"),
			'Nationality', "GrandChien",
			'Title', T(722424084824, --[[ModItemUnitDataCompositeDef Pierre_FS Title]] "Welcome to the Jungle"),
			'Offline', {
				PlaceObj('ChatMessage', {
					'Text', T(456813967077, --[[ModItemUnitDataCompositeDef Pierre_FS Text Offline ChatMessage voice:Pierre_FS]] "I'm currently away, probably fighting for the better of Grand Chien!"),
				}),
			},
			'GreetingAndOffer', {
				PlaceObj('ChatMessage', {
					'Text', T(671368127123, --[[ModItemUnitDataCompositeDef Pierre_FS Text GreetingAndOffer ChatMessage voice:Pierre_FS]] "Pierre here, do you have a proposition for me?"),
				}),
			},
			'ConversationRestart', {
				PlaceObj('ChatMessage', {
					'Text', T(631166197556, --[[ModItemUnitDataCompositeDef Pierre_FS Text ConversationRestart ChatMessage voice:Pierre_FS]] "Let's begin anew."),
				}),
			},
			'IdleLine', {
				PlaceObj('ChatMessage', {
					'Text', T(953209711862, --[[ModItemUnitDataCompositeDef Pierre_FS Text IdleLine ChatMessage voice:Pierre_FS]] "I'm waiting for you to make a decision."),
				}),
			},
			'PartingWords', {
				PlaceObj('ChatMessage', {
					'Text', T(835413137750, --[[ModItemUnitDataCompositeDef Pierre_FS Text PartingWords ChatMessage voice:Pierre_FS]] "This is a great honor, I won't disappoint you."),
				}),
			},
			'RehireIntro', {
				PlaceObj('ChatMessage', {
					'Text', T(119701403323, --[[ModItemUnitDataCompositeDef Pierre_FS Text RehireIntro ChatMessage voice:Pierre_FS]] "My contract is expiring, but my job is far from finished, let us come to an agreement!"),
				}),
			},
			'RehireOutro', {
				PlaceObj('ChatMessage', {
					'Text', T(184126608286, --[[ModItemUnitDataCompositeDef Pierre_FS Text RehireOutro ChatMessage voice:Pierre_FS]] "Be honorable to the end."),
				}),
			},
			'StartingSalary', 2000,
			'SalaryLv1', 0,
			'SalaryMaxLv', 0,
			'LegacyNotes', "A local boy who joined the Legion years ago in a pursuit of adventure, and grew up to become a Legion warlord. He recently returned to Ernie with a band of raiders, only to rob his home town and break the heart of his father. \nYet he is as a person who lives by his own code – he dislikes unneeded violence and did restrain his Legion thugs from doing too much mischief.",
			'StartingLevel', 3,
			'CustomEquipGear', function (self, items)
				self:TryEquip(items, "Handheld A", "Firearm")
				self:TryEquip(items, "Handheld B", "MeleeWeapon")
			end,
			'LearnToLike', {
				"Flay",
			},
			'LearnToDislike', {
				"Grizzly",
			},
			'StartingPerks', {
				"AutoWeapons",
				"GloryHog",
				"OptimalPerformance",
				"BloodlustPerk",
			},
			'AppearancesList', {
				PlaceObj('AppearanceWeight', {
					'Preset', "Pierre",
				}),
			},
			'Equipment', {
				"Pierre",
			},
			'Tier', "Elite",
			'Specialization', "Leader",
			'gender', "Male",
			'VoiceResponseId', "PierreMerc",
			'IsFinalStandOnly', true,
		}),
		PlaceObj('ModItemUnitDataCompositeDef', {
			'Group', "MercenariesNew",
			'Id', "Flay_FS",
			'object_class', "UnitData",
			'Health', 79,
			'Agility', 63,
			'Dexterity', 78,
			'Strength', 80,
			'Wisdom', 79,
			'Leadership', 12,
			'Marksmanship', 84,
			'Mechanical', 18,
			'Explosives', 0,
			'Medical', 50,
			'Portrait', "UI/MercsPortraits/Flay",
			'BigPortrait', "UI/Mercs/Flay",
			'IsMercenary', true,
			'Name', T(514100377590, --[[ModItemUnitDataCompositeDef Flay_FS Name]] 'Jacques "Flay" Bohen'),
			'Nick', T(626801229932, --[[ModItemUnitDataCompositeDef Flay_FS Nick]] "Flay"),
			'AllCapsNick', T(499866662138, --[[ModItemUnitDataCompositeDef Flay_FS AllCapsNick]] "FLAY"),
			'Bio', T(493494355451, --[[ModItemUnitDataCompositeDef Flay_FS Bio]] "An experienced poacher, Flay has hunted every animal imaginable. Now is the time to track down and kill the only beasts he has never hunted so far - humans.\nA difficult man to like, he is skilled in what he does and won't take much convincing to join you as it is obvious you are his best vehicle to achieve the loathsome goal."),
			'Nationality', "GrandChien",
			'Title', T(280465339940, --[[ModItemUnitDataCompositeDef Flay_FS Title]] "Hunter Of Buckheads"),
			'Offline', {
				PlaceObj('ChatMessage', {
					'Text', T(530509519160, --[[ModItemUnitDataCompositeDef Flay_FS Text Offline ChatMessage voice:Flay_FS]] "I'm currently stalking prey and cannot answer the device."),
				}),
			},
			'GreetingAndOffer', {
				PlaceObj('ChatMessage', {
					'Text', T(327807807818, --[[ModItemUnitDataCompositeDef Flay_FS Text GreetingAndOffer ChatMessage voice:Flay_FS]] "Do you have des proies for me to kill, oui?"),
				}),
			},
			'ConversationRestart', {
				PlaceObj('ChatMessage', {
					'Text', T(434058381357, --[[ModItemUnitDataCompositeDef Flay_FS Text ConversationRestart ChatMessage voice:Flay_FS]] "Oui?"),
				}),
			},
			'IdleLine', {
				PlaceObj('ChatMessage', {
					'Text', T(490590211998, --[[ModItemUnitDataCompositeDef Flay_FS Text IdleLine ChatMessage voice:Flay_FS]] "I have a lot of patience..."),
				}),
			},
			'PartingWords', {
				PlaceObj('ChatMessage', {
					'Text', T(269642278954, --[[ModItemUnitDataCompositeDef Flay_FS Text PartingWords ChatMessage voice:Flay_FS]] "Fear not the dark my friend! And let the hunt begin."),
				}),
			},
			'RehireIntro', {
				PlaceObj('ChatMessage', {
					'Text', T(674755076717, --[[ModItemUnitDataCompositeDef Flay_FS Text RehireIntro ChatMessage voice:Flay_FS]] "You have to continue my contract if you want to continue hunting."),
				}),
			},
			'RehireOutro', {
				PlaceObj('ChatMessage', {
					'Text', T(717939428954, --[[ModItemUnitDataCompositeDef Flay_FS Text RehireOutro ChatMessage voice:Flay_FS]] "C'est une excellente décision."),
				}),
			},
			'MedicalDeposit', "none",
			'StartingSalary', 1800,
			'SalaryIncrease', 230,
			'SalaryLv1', 0,
			'SalaryMaxLv', 0,
			'StartingLevel', 2,
			'MaxHitPoints', 79,
			'StartingPerks', {
				"MeleeTraining",
				"Loner",
				"MakeThemBleed",
				"OptimalPerformance",
			},
			'AppearancesList', {
				PlaceObj('AppearanceWeight', {
					'Preset', "Flay",
				}),
			},
			'Equipment', {
				"Flay",
			},
			'Tier', "Veteran",
			'Specialization', "Marksmen",
			'gender', "Male",
			'VoiceResponseId', "Flay",
			'IsFinalStandOnly', true,
		}),
		PlaceObj('ModItemUnitDataCompositeDef', {
			'Group', "MercenariesOld",
			'Id', "Larry_FS",
			'object_class', "UnitData",
			'Health', 63,
			'Agility', 77,
			'Dexterity', 79,
			'Strength', 67,
			'Wisdom', 70,
			'Leadership', 18,
			'Marksmanship', 70,
			'Mechanical', 14,
			'Explosives', 92,
			'Medical', 70,
			'Portrait', "UI/MercsPortraits/Larry",
			'BigPortrait', "UI/Mercs/Larry",
			'IsMercenary', true,
			'Name', T(186441906298, --[[ModItemUnitDataCompositeDef Larry_FS Name]] "Larry Roachburn"),
			'Nick', T(792770189039, --[[ModItemUnitDataCompositeDef Larry_FS Nick]] "Larry"),
			'AllCapsNick', T(615440553544, --[[ModItemUnitDataCompositeDef Larry_FS AllCapsNick]] "LARRY"),
			'Bio', T(957095593297, --[[ModItemUnitDataCompositeDef Larry_FS Bio]] "Explosives require a steady hand, and Larry's got some of the steadiest - most of the time. Although he has in the past struggled with bouts of chemical dependency, Larry's been clean and sober for two years now. His knowledge of pharmaceuticals comes in handy when administering first aid and his history of checking himself out of rehab whenever he liked has also made him good at sneaking around and picking locks. But Larry swears all that is behind him and we here at M.E.R.C. believe him!"),
			'Nationality', "USA",
			'Title', T(173603682219, --[[ModItemUnitDataCompositeDef Larry_FS Title]] "Former Artist. Explosives Expert"),
			'Offline', {
				PlaceObj('ChatMessage', {
					'Text', T(580210979044, --[[ModItemUnitDataCompositeDef Larry_FS Text Offline ChatMessage voice:Larry_FS]] "Um... I'm not currently preset... Come check later or something."),
				}),
			},
			'GreetingAndOffer', {
				PlaceObj('ChatMessage', {
					'Text', T(605180013330, --[[ModItemUnitDataCompositeDef Larry_FS Text GreetingAndOffer ChatMessage voice:Larry_FS]] "Sup, man?"),
				}),
			},
			'ConversationRestart', {
				PlaceObj('ChatMessage', {
					'Text', T(829934957833, --[[ModItemUnitDataCompositeDef Larry_FS Text ConversationRestart ChatMessage voice:Larry_FS]] "Alright, man, sure! Let's rewind!"),
				}),
			},
			'IdleLine', {
				PlaceObj('ChatMessage', {
					'Text', T(569617350923, --[[ModItemUnitDataCompositeDef Larry_FS Text IdleLine ChatMessage voice:Larry_FS]] "Hey, man, I like hanging around, but um... are we still discussing the offer?"),
				}),
			},
			'PartingWords', {
				PlaceObj('ChatMessage', {
					'Text', T(538393631262, --[[ModItemUnitDataCompositeDef Larry_FS Text PartingWords ChatMessage voice:Larry_FS]] "Hell yeah, man, let's get this party started! Anyone got Diet Coke?"),
				}),
			},
			'RehireIntro', {
				PlaceObj('ChatMessage', {
					'Text', T(452285335576, --[[ModItemUnitDataCompositeDef Larry_FS Text RehireIntro ChatMessage voice:Larry_FS]] "Um... Man, I like hanging out with you guys, but um... My contracts needs to be renewed."),
				}),
			},
			'RehireOutro', {
				PlaceObj('ChatMessage', {
					'Text', T(243516796347, --[[ModItemUnitDataCompositeDef Larry_FS Text RehireOutro ChatMessage voice:Larry_FS]] "Nice man, let's fly high!"),
				}),
			},
			'StartingSalary', 1500,
			'SalaryIncrease', 210,
			'SalaryLv1', 0,
			'SalaryMaxLv', 0,
			'LegacyNotes', 'JA1:\n\n"On probationary standing, Larry Roachburn, a somewhat respected explosives expert, was a young survivor of the C.I.A./L.S.D. years. And when not on assignment, he continues to subject his body to the whims of pharmaceutical researchers around the world."\n\nJA2 Alumni:\n\n"After eight attempts at rehab without any sustained success, AIM was little choice but to terminate Larry Roachburn\'s membership within the organization. From what we understand, the death of his father has persuaded him to take yet another attempt at ridding himself of his demons and ridding his body from decades of toxicity. The organization wishes him the best of luck in all his future endeavors."\n\nJA2 MERC:\n\n"There\'s no denying that Larry has had his share of substance abuse problems in the past, and despite many attempts at rehabilitation, the demons remain. Roachburn has recently spent six months at an exclusive and classy rehab center undergoing treatment. Having completed the program, he proclaims himself cured and ready for duty.\n\nAdditional Info:Larry spent most of his spare time in rehab studying pharmacology which has tremendously improved his medical knowledge."\n\nAdditional Info\n\nLarry\'s drug habits have made him forgetful, and he will often stop in the middle of a task in need of a reminder, losing AP.\nHis brother Gary derisively refers to him as "Anything But A Placebo" Larry.\n\nJagged Alliance/Deadly Games\nHaving ruined his health with drugs, Larry loses rather than gains stats at the end of a day, a trait normally reserved to old mercs.\n\nJagged Alliance 2\n\nLarry has two different personalities - clean and relapsed. After hiring, he can relapse under certain conditions, losing a lot of stat points, making him almost useless.\n\nAs long as he stays clean he\'s the sociable sort, and loves to hang around other mercs (with some exceptions). However, once relapsed he loses focus and becomes forgetful, preferring the loner lifestyle.\n\nRelapse conditions\n\nStationary passing time while assigned to squad, carrying energy booster, regeneration booster, medical kit, or any type of alcohol. First aid kits are excluded.\n\nStationary passing time while assigned to squad, carrying none of the above items, in any city sector that has a bar.\nThe easiest way to prevent a relapse while carrying any of the above items, is keeping Larry busy, assigning him to squad only to travel and fight. And even though sleeping whilst assigned to squad (eg. after travelling) would be safe, there\'s no wake-up call and Larry\'s very quick to get his hands on something "groovy".\n\nGetting clean\n\nLuckily there\'s an easy way to get him clean. A one day speed course called "walkabout". Within a short while, needing a rest at least once, he\'s as fit as a fiddle again. As mentioned above, carrying any of the "relapse triggering items" isn\'t a problem per se, just keep a very close tab on him waking up.\n\nDue to strength loss, Larry can be severely encumbered while on the "walkabout" and damage his strength and/or health. Damaged strength will be temporary and reset as soon as he\'s clean, even though it still looks red for a short while. Damaged health will be permanent until dismissed! Dismissing him will reset health back to what it was.',
			'StartingLevel', 3,
			'MaxHitPoints', 69,
			'StartingPerks', {
				"MrFixit",
				"Loner",
				"Pessimist",
				"DangerClose",
				"SteadyBreathing",
				"Untraceable",
			},
			'AppearancesList', {
				PlaceObj('AppearanceWeight', {
					'Preset', "Larry",
				}),
			},
			'Equipment', {
				"Larry",
			},
			'Tier', "Veteran",
			'Specialization', "ExplosiveExpert",
			'gender', "Male",
			'VoiceResponseId', "Larry_Clean",
			'IsFinalStandOnly', true,
		}),
		PlaceObj('ModItemUnitDataCompositeDef', {
			'Group', "MercenariesOld",
			'Id', "Spike_FS",
			'object_class', "UnitData",
			'Health', 82,
			'Agility', 88,
			'Dexterity', 91,
			'Strength', 86,
			'Wisdom', 85,
			'Leadership', 85,
			'Marksmanship', 92,
			'Mechanical', 62,
			'Explosives', 45,
			'Medical', 11,
			'Portrait', "UI/MercsPortraits/Spike",
			'BigPortrait', "UI/Mercs/Spike",
			'IsMercenary', true,
			'Name', T(179691398639, --[[ModItemUnitDataCompositeDef Spike_FS Name]] "Maj. Spike Scallion"),
			'Nick', T(330361217191, --[[ModItemUnitDataCompositeDef Spike_FS Nick]] "Spike"),
			'AllCapsNick', T(613295888031, --[[ModItemUnitDataCompositeDef Spike_FS AllCapsNick]] "SPIKE"),
			'Bio', T(634704147710, --[[ModItemUnitDataCompositeDef Spike_FS Bio]] "Spike is revealed to be the Major, fighting against the Santiago Corporation after realizing the nature of their activities in Grand Chien. Originally being hired by them, the sequence of events that led to Spike abandoning his lengthy contract with the North Koreans and joining the Santiago Corporation are unknown."),
			'Nationality', "USA",
			'Refusals', {},
			'Offline', {
				PlaceObj('ChatMessage', {
					'Text', T(370990934714, --[[ModItemUnitDataCompositeDef Spike_FS Text Offline ChatMessage voice:Spike_FS]] "Spike Scallion is currently not available, leave your message."),
				}),
			},
			'GreetingAndOffer', {
				PlaceObj('ChatMessage', {
					'Text', T(562949536532, --[[ModItemUnitDataCompositeDef Spike_FS Text GreetingAndOffer ChatMessage voice:Spike_FS]] "Spike Scallion is the name. Filling people with holes is my game, boy."),
				}),
			},
			'ConversationRestart', {
				PlaceObj('ChatMessage', {
					'Text', T(982614178627, --[[ModItemUnitDataCompositeDef Spike_FS Text ConversationRestart ChatMessage voice:Spike_FS]] "It's good to hear from ya! Show me what you're made of, boy!"),
				}),
			},
			'IdleLine', {
				PlaceObj('ChatMessage', {
					'Text', T(683121023141, --[[ModItemUnitDataCompositeDef Spike_FS Text IdleLine ChatMessage voice:Spike_FS]] "Quit wasting my time, boy!"),
				}),
			},
			'PartingWords', {
				PlaceObj('ChatMessage', {
					'Text', T(676696157681, --[[ModItemUnitDataCompositeDef Spike_FS Text PartingWords ChatMessage voice:Spike_FS]] "That was some clever bargaining there, boy!"),
				}),
			},
			'RehireIntro', {
				PlaceObj('ChatMessage', {
					'Text', T(997285174996, --[[ModItemUnitDataCompositeDef Spike_FS Text RehireIntro ChatMessage voice:Spike_FS]] "Hey, my contract's ending. Are we renewing or what!?"),
				}),
			},
			'RehireOutro', {
				PlaceObj('ChatMessage', {
					'Text', T(816393397837, --[[ModItemUnitDataCompositeDef Spike_FS Text RehireOutro ChatMessage voice:Spike_FS]] "This is what I'm talking about, boy!"),
				}),
			},
			'StartingSalary', 2000,
			'SalaryLv1', 0,
			'SalaryMaxLv', 0,
			'LegacyNotes', 'JA:\n\n"A seasoned veteran of international conflict, Major Spike Scallion was deservingly decorated for the unflinching courage he exhibited while evacuating the villagers of Kampoa under extremely heavy fire. This major commands respect and a sizeable fee." \n\nJA2 Alumni: \n\n"The departure of Spike Scallion from A.I.M. was a major loss to the organization. His demeanour and unwavering command of any situation always served as a comfort for those who found themselves neck deep in it alongside him. Major Scallion was offered a lucrative long-term contract serving as a military consultant for the North Koreans and no amount of negotiation could convince him to stay."',
			'StartingLevel', 8,
			'MaxHitPoints', 77,
			'Likes', {
				"Len",
			},
			'StartingPerks', {
				"AutoWeapons",
				"BulletHell",
				"Hobbler",
				"LeadFromTheFront",
				"OpportunisticKiller",
				"Counterfire",
				"Killzone",
				"SwiftStrike",
				"LightningReaction",
			},
			'AppearancesList', {
				PlaceObj('AppearanceWeight', {
					'Preset', "TheMajor",
				}),
			},
			'Equipment', {
				"Spike",
			},
			'Tier', "Legendary",
			'Specialization', "Leader",
			'gender', "Male",
			'VoiceResponseId', "Spike",
			'IsFinalStandOnly', true,
		}),
		}),
	PlaceObj('ModItemFolder', {
		'name', "Sectors",
	}, {
		PlaceObj('ModItemSector', {
			'mapName', "FinalStandH4",
			'campaignId', "FinalStand",
			'sectorId', "H4",
			'SatelliteSectorObj', PlaceObj('SatelliteSector', {
				'Id', "H4",
				'HideUnderground', true,
				'Map', "FinalStandH4",
				'MapTier', 40,
				'Label1', "Ernie",
				'modId', "FinalStand",
				'Label2', "Outpost",
				'display_name', T(621127133250, --[[ModItemCampaignPreset FinalStand display_name Sector name for H4]] "Fort L'Eau Bleu"),
				'Side', "neutral",
				'TerrainType', "Jungle",
				'WeatherZone', "Erny",
				'City', "FortLEauBleu",
				'ShowCity', true,
				'never_autoresolve', true,
				'Hospital', true,
				'Militia', true,
				'MaxMilitia', 4,
				'RAndRAllowed', true,
				'RepairShop', true,
				'bidirectionalBlockApply', true,
				'BlockTravelRiver', set( "East", "North", "South", "West" ),
				'image', "UI/SatelliteView/SectorImages/H04",
				'Events', {},
				'MusicCombat', "Battle_Tough",
				'MusicConflict', "Outpost_Conflict",
				'MusicExploration', "Outpost_Exploration",
				'combatTaskAmount', 2,
			}),
		}),
		PlaceObj('ModItemSector', {
			'mapName', "FinalStandI9",
			'campaignId', "FinalStand",
			'sectorId', "I9",
			'SatelliteSectorObj', PlaceObj('SatelliteSector', {
				'Id', "I9",
				'HideUnderground', true,
				'Map', "FinalStandI9",
				'MapTier', 20,
				'Label1', "Special",
				'modId', "FinalStand",
				'display_name', T(499129490679, --[[ModItemCampaignPreset FinalStand display_name Sector name for I9]] "Rimville"),
				'Side', "neutral",
				'TerrainType', "Urban",
				'WeatherZone', "GreatForest",
				'Passability', "Land and Water",
				'City', "Rimville",
				'ShowCity', true,
				'never_autoresolve', true,
				'Hospital', true,
				'Militia', true,
				'MaxMilitia', 4,
				'RAndRAllowed', true,
				'RepairShop', true,
				'bidirectionalBlockApply', true,
				'BlockTravelRiver', set( "East", "North", "South", "West" ),
				'image', "UI/SatelliteView/SectorImages/I09",
				'MusicCombat', "Battle_Tough",
				'MusicConflict', "SpecificMansion_Conflict",
				'MusicExploration', "SpecificMansion_Exploration",
				'combatTaskAmount', 2,
			}),
		}),
		PlaceObj('ModItemSector', {
			'mapName', "FinalStandL8",
			'campaignId', "FinalStand",
			'sectorId', "L8",
			'SatelliteSectorObj', PlaceObj('SatelliteSector', {
				'Id', "L8",
				'HideUnderground', true,
				'Map', "FinalStandL8",
				'MapTier', 20,
				'Label1', "City",
				'modId', "FinalStand",
				'display_name', T(187379373038, --[[ModItemCampaignPreset FinalStand display_name Sector name for L8]] "Port Cacao City"),
				'Side', "neutral",
				'TerrainType', "Urban",
				'WeatherZone', "SouthJungle",
				'City', "PortCacao",
				'ShowCity', true,
				'never_autoresolve', true,
				'Hospital', true,
				'Militia', true,
				'MaxMilitia', 4,
				'RAndRAllowed', true,
				'RepairShop', true,
				'bidirectionalBlockApply', true,
				'BlockTravelRiver', set( "East", "North", "South", "West" ),
				'image', "UI/SatelliteView/SectorImages/L08",
				'Port', true,
				'MusicCombat', "Battle_Tough",
				'MusicConflict', "Town_Conflict",
				'MusicExploration', "Town_Exploration",
				'combatTaskAmount', 2,
			}),
		}),
		PlaceObj('ModItemSector', {
			'mapName', "FinalStandD7",
			'campaignId', "FinalStand",
			'sectorId', "D7",
			'SatelliteSectorObj', PlaceObj('SatelliteSector', {
				'Id', "D7",
				'HideUnderground', true,
				'Map', "FinalStandD7",
				'MapTier', 10,
				'Label1', "City",
				'modId', "FinalStand",
				'display_name', T(580447225647, --[[ModItemCampaignPreset FinalStand display_name Sector name for D7]] "Pantagruel Slums"),
				'Side', "neutral",
				'TerrainType', "Urban",
				'WeatherZone', "SavannahNorth",
				'City', "PantagruelSlums",
				'ShowCity', true,
				'never_autoresolve', true,
				'Hospital', true,
				'Militia', true,
				'MaxMilitia', 4,
				'RAndRAllowed', true,
				'RepairShop', true,
				'bidirectionalBlockApply', true,
				'BlockTravelRiver', set( "East", "North", "South", "West" ),
				'image', "UI/SatelliteView/SectorImages/D07",
				'MusicCombat', "Battle_Normal",
				'MusicConflict', "Town_Conflict",
				'MusicExploration', "Town_Exploration",
				'combatTaskAmount', 2,
			}),
		}),
		PlaceObj('ModItemSector', {
			'mapName', "FinalStandD17",
			'campaignId', "FinalStand",
			'sectorId', "D17",
			'SatelliteSectorObj', PlaceObj('SatelliteSector', {
				'Id', "D17",
				'HideUnderground', true,
				'Map', "FinalStandD17",
				'MapTier', 20,
				'Label1', "City",
				'modId', "FinalStand",
				'display_name', T(588901431087, --[[ModItemCampaignPreset FinalStand display_name Sector name for D17]] "Ille Morat"),
				'Side', "neutral",
				'TerrainType', "Urban",
				'WeatherZone', "CursedForest",
				'Passability', "Land and Water",
				'City', "IlleMorat",
				'ShowCity', true,
				'never_autoresolve', true,
				'Hospital', true,
				'Militia', true,
				'MaxMilitia', 4,
				'RAndRAllowed', true,
				'RepairShop', true,
				'bidirectionalBlockApply', true,
				'BlockTravelRiver', set( "East", "North", "South", "West" ),
				'image', "UI/SatelliteView/SectorImages/D17",
				'MusicCombat', "Battle_Normal",
				'MusicExploration', "Village_Exploration",
				'combatTaskAmount', 2,
			}),
		}),
		PlaceObj('ModItemFinalStandSectorDef', {
			Sector = "H4",
			SortKey = 1,
			comment = "Fort L'Eau Bleu (outpost)",
			description = T(150244906240, --[[ModItemFinalStandSectorDef H4 description]] "Main stronghold of Ernie island.<newline><newline><image UI/SatelliteView/SectorImages/H04 1600>"),
			display_name = T(919903154411, --[[ModItemFinalStandSectorDef H4 display_name]] "Fort L'Eau Bleu (H4)"),
			group = "Default",
			id = "H4",
		}),
		PlaceObj('ModItemFinalStandSectorDef', {
			Sector = "I9",
			SortKey = 2,
			comment = "Rimville (outpost/mansion)",
			description = T(706232630775, --[[ModItemFinalStandSectorDef I9 description]] "Boss Blaubert's mansion.<newline><newline><image UI/SatelliteView/SectorImages/I09 1600>"),
			display_name = T(377896673109, --[[ModItemFinalStandSectorDef I9 display_name]] "Rimville (I9)"),
			group = "Default",
			id = "I9",
			loyaltyModifier = 10,
			moneyModifier = 15,
		}),
		PlaceObj('ModItemFinalStandSectorDef', {
			Sector = "L8",
			SortKey = 3,
			comment = "Port Cacao City (city/mansion)",
			description = T(119457814568, --[[ModItemFinalStandSectorDef L8 description]] "City center of Port Cacao.<newline><newline><image UI/SatelliteView/SectorImages/L08 1600>"),
			display_name = T(685381178936, --[[ModItemFinalStandSectorDef L8 display_name]] "Port Cacao City (L8)"),
			group = "Default",
			id = "L8",
			loyaltyModifier = 5,
			xpModifier = 10,
		}),
		PlaceObj('ModItemFinalStandSectorDef', {
			Sector = "D7",
			SortKey = 4,
			comment = "Pantagruel Slums (city/open area)",
			description = T(642687711828, --[[ModItemFinalStandSectorDef D7 description]] "Densely populated slums west of Pantagruel center.<newline><newline><image UI/SatelliteView/SectorImages/D07 1600>"),
			display_name = T(976812820692, --[[ModItemFinalStandSectorDef D7 display_name]] "Pantagruel Slums (D7)"),
			group = "Default",
			id = "D7",
			loyaltyModifier = 15,
			moneyModifier = 10,
			xpModifier = 10,
		}),
		PlaceObj('ModItemFinalStandSectorDef', {
			Sector = "D17",
			SortKey = 5,
			comment = "Ille Morat",
			description = T(429721753974, --[[ModItemFinalStandSectorDef D17 description]] "Ille Morat village port.<newline><newline><image UI/SatelliteView/SectorImages/D17 1600>"),
			display_name = T(412313514242, --[[ModItemFinalStandSectorDef D17 display_name]] "Ille Morat (D17)"),
			group = "Default",
			id = "D17",
			loyaltyModifier = 5,
			moneyModifier = 5,
			xpModifier = 5,
		}),
		}),
	PlaceObj('ModItemFolder', {
		'name', "Lengths",
	}, {
		PlaceObj('ModItemFinalStandLengthDef', {
			NameColor = 4291018156,
			SortKey = 1,
			description = T(469065984286, --[[ModItemFinalStandLengthDef ThreeWaves description]] "Survival <maxWaves> waves in order to win.<newline><newline><em>Attention:</em> The game is balanced around the amount of waves. If you wish for the full experience, it is recommended to <em>choose 7 waves</em>."),
			display_name = T(400364955478, --[[ModItemFinalStandLengthDef ThreeWaves display_name]] "3 Waves"),
			display_name_caps = T(442614194967, --[[ModItemFinalStandLengthDef ThreeWaves display_name_caps]] "3 WAVES"),
			group = "Default",
			id = "ThreeWaves",
		}),
		PlaceObj('ModItemFinalStandLengthDef', {
			NameColor = 4291018156,
			SortKey = 2,
			description = T(286294288316, --[[ModItemFinalStandLengthDef FiveWaves description]] "Survival <maxWaves> waves in order to win.<newline><newline><em>Attention:</em> The game is balanced around the amount of waves. If you wish for the full experience, it is recommended to <em>choose 7 waves</em>."),
			display_name = T(845045912590, --[[ModItemFinalStandLengthDef FiveWaves display_name]] "5 Waves"),
			display_name_caps = T(329343893497, --[[ModItemFinalStandLengthDef FiveWaves display_name_caps]] "5 WAVES"),
			group = "Default",
			id = "FiveWaves",
			maxWaves = 5,
		}),
		PlaceObj('ModItemFinalStandLengthDef', {
			NameColor = 4291018156,
			SortKey = 3,
			description = T(367987529496, --[[ModItemFinalStandLengthDef SevenWaves description]] "Survival <maxWaves> waves in order to win.<newline><newline><em>Attention:</em> The game is balanced around the amount of waves, this is the <em>recommended</em>, full experience of the game-mode."),
			display_name = T(880015722679, --[[ModItemFinalStandLengthDef SevenWaves display_name]] "7 Waves"),
			display_name_caps = T(467155438678, --[[ModItemFinalStandLengthDef SevenWaves display_name_caps]] "7 WAVES"),
			group = "Default",
			id = "SevenWaves",
			maxWaves = 7,
		}),
		}),
	PlaceObj('ModItemFolder', {
		'name', "Code",
	}, {
		PlaceObj('ModItemCode', {
			'name', "Common",
			'comment', "Elements used by other files",
			'CodeFileName', "Code/Common.lua",
		}),
		PlaceObj('ModItemFolder', {
			'name', "Editor Definitions",
		}, {
			PlaceObj('ModItemCode', {
				'name', "CampaignConfigDefs",
				'comment', "Elements used by the in-game editor",
				'CodeFileName', "Code/CampaignConfigDefs.lua",
			}),
			PlaceObj('ModItemCode', {
				'name', "CampaignEffectDefs",
				'comment', "Effects for the Final Stand campaign",
				'CodeFileName', "Code/CampaignEffectDefs.lua",
			}),
			PlaceObj('ModItemCode', {
				'name', "FactionDefs",
				'CodeFileName', "Code/FactionDefs.lua",
			}),
			PlaceObj('ModItemCode', {
				'name', "AppearanceDefs",
				'CodeFileName', "Code/AppearanceDefs.lua",
			}),
			}),
		PlaceObj('ModItemFolder', {
			'name', "Game Logic",
		}, {
			PlaceObj('ModItemCode', {
				'name', "Appearance",
				'comment', "Logic for handling unit's appearance",
				'CodeFileName', "Code/Appearance.lua",
			}),
			PlaceObj('ModItemCode', {
				'name', "Start",
				'comment', "Logic for the start of Final Stand campaign",
				'CodeFileName', "Code/Start.lua",
			}),
			PlaceObj('ModItemCode', {
				'name', "Main",
				'comment', "Logic for the duration of Final Stand campaign",
				'CodeFileName', "Code/Main.lua",
			}),
			PlaceObj('ModItemCode', {
				'name', "Final",
				'comment', "Logic for the end of Final Stand campaign",
				'CodeFileName', "Code/Final.lua",
			}),
			}),
		PlaceObj('ModItemFolder', {
			'name', "Misc",
		}, {
			PlaceObj('ModItemCode', {
				'name', "UI",
				'comment', "Generated templates and handles logic for inserting into game menus",
				'CodeFileName', "Code/UI.lua",
			}),
			PlaceObj('ModItemCode', {
				'name', "Debugger",
				'comment', "Message Listeners for debug purposes",
				'CodeFileName', "Code/Debugger.lua",
			}),
			}),
		}),
	PlaceObj('ModItemFolder', {
		'name', "Messages",
	}, {
		PlaceObj('ModItemMsgDef', {
			Description = "Calculating progress per tick for sector",
			Params = "operation, progresses",
			comment = "Allows for modification of progress per tick for operation",
			group = "Zulu - Satellite",
			id = "OperationProgressPerTick",
		}),
		PlaceObj('ModItemMsgDef', {
			Description = "Calculating if operation is enabled",
			Params = "operation, reasons",
			comment = "Allows for modification of is enabled for operation",
			group = "Zulu - Satellite",
			id = "OperationIsEnabled",
		}),
		PlaceObj('ModItemMsgDef', {
			Description = "Checks for reasons to be a Final Stand Campaign",
			Params = "isFinalStandChecks",
			comment = "Checks for reasons to be a Final Stand Campaign",
			group = "Final Stand - Common",
			id = "isFinalStand",
		}),
		PlaceObj('ModItemMsgDef', {
			Description = "Final Stand Campaign is selected in the menu",
			Params = "newGameObj",
			comment = "Final Stand Campaign is selected in the menu",
			group = "Final Stand - UI",
			id = "FinalStandSelected",
		}),
		PlaceObj('ModItemMsgDef', {
			Description = "Final Stand Menu elements are about to be inserted into menu",
			Params = "templateId",
			comment = "Final Stand Menu elements are about to be inserted into menu",
			group = "Final Stand - UI",
			id = "FinalStandBeforeUIInsert",
		}),
		PlaceObj('ModItemMsgDef', {
			Description = "Final Stand Menu elements have been inserted into menu",
			Params = "parent, templateId",
			comment = "Final Stand Menu elements have been inserted into menu",
			group = "Final Stand - UI",
			id = "FinalStandUIInserted",
		}),
		PlaceObj('ModItemMsgDef', {
			Description = "Final Stand Menu elements have been removed from the menu",
			comment = "Final Stand Menu elements have been removed from the menu",
			group = "Final Stand - UI",
			id = "FinalStandUIRemoved",
		}),
		PlaceObj('ModItemMsgDef', {
			Description = "Game has been started and Final Stand has been configured",
			Params = "config",
			comment = "Game has been started and Final Stand has been configured",
			group = "Final Stand - Start",
			id = "FinalStandGameConfigured",
		}),
		PlaceObj('ModItemMsgDef', {
			Description = "Game has been started and Final Stand has been configured",
			Params = "config",
			comment = "Game's per wave flags have been reset",
			group = "Final Stand - Start",
			id = "FinalStandGamePerWaveFlagsReset",
		}),
		PlaceObj('ModItemMsgDef', {
			Description = "A wave has been scheduled, this is triggered before marker is created",
			Params = "scheduledStand, currentWave",
			comment = "A wave has been scheduled, this is triggered before marker is created",
			group = "Final Stand - Start",
			id = "FinalStandWaveScheduled",
		}),
		PlaceObj('ModItemMsgDef', {
			Description = "A set of enemy squads for spawn were picked",
			Params = "squads",
			comment = "A set of enemy squads were picked",
			group = "Final Stand - Main",
			id = "FinalStandAttackSquadsPicked",
		}),
		PlaceObj('ModItemMsgDef', {
			Description = "A set of enemy squads are about to spawn",
			Params = "squads",
			comment = "A set of enemy squads are about to spawn",
			group = "Final Stand - Main",
			id = "FinalStandAttackSquadsSpawning",
		}),
		PlaceObj('ModItemMsgDef', {
			Description = "Final Stand Appearance options loaded, allows to insert custom values into options.",
			Params = "AppearanceHandler",
			comment = "Checks for reasons to be a Final Stand Campaign",
			group = "Final Stand - Start",
			id = "FinalStandAppearanceOptionsLoaded",
		}),
		PlaceObj('ModItemMsgDef', {
			Description = "A wave has been ended",
			comment = "A wave has been ended",
			group = "Final Stand - Main",
			id = "FinalStandWaveEnded",
		}),
		PlaceObj('ModItemMsgDef', {
			Description = "Monetary reward is being dispatched",
			Params = "baseValue, modifiers, flatBonuses",
			comment = "Monetary reward is being dispatched",
			group = "Final Stand - Main",
			id = "FinalStandRewardMoney",
		}),
		PlaceObj('ModItemMsgDef', {
			Description = "XP reward is being dispatched",
			Params = "baseValue, modifiers, flatBonuses, units",
			comment = "XP reward is being dispatched",
			group = "Final Stand - Main",
			id = "FinalStandRewardXP",
		}),
		PlaceObj('ModItemMsgDef', {
			Description = "XP reward is being dispatched",
			Params = "baseValue, modifiers, flatBonuses, sector",
			comment = "Loyalty reward is being dispatched",
			group = "Final Stand - Main",
			id = "FinalStandRewardLoyalty",
		}),
		PlaceObj('ModItemMsgDef', {
			Description = "BobbyRay is being restocked and tier modified",
			Params = "bobbyRayValues",
			comment = "BobbyRay is being restocked and tier modified",
			group = "Final Stand - Main",
			id = "FinalStandBobbyRayRestock",
		}),
		PlaceObj('ModItemMsgDef', {
			Description = "Final Stand Campaign is ending and about to play Outtro.",
			comment = "Final Stand Campaign is ending and about to play Outtro.",
			group = "Final Stand - Finale",
			id = "FinalStandCampaignEnding",
		}),
		}),
	PlaceObj('ModItemFolder', {
		'name', "Tutorial Hints",
	}, {
		PlaceObj('ModItemTutorialHint', {
			PopupId = "FinalStandWelcome",
			SortKey = 1,
			campaign = "FinalStand",
			group = "StartingHelp",
			id = "FinalStandWelcome",
		}),
		PlaceObj('ModItemTutorialHint', {
			PopupId = "FinalStandStarting",
			SortKey = 2,
			campaign = "FinalStand",
			group = "StartingHelp",
			id = "FinalStandStarting",
		}),
		PlaceObj('ModItemTutorialHint', {
			PopupId = "FinalStandAboutEnemy",
			SortKey = 3,
			campaign = "FinalStand",
			group = "StartingHelp",
			id = "FinalStandAboutEnemy",
		}),
		PlaceObj('ModItemTutorialHint', {
			PopupId = "FinalStandWaveRewards",
			SortKey = 4,
			campaign = "FinalStand",
			group = "StartingHelp",
			id = "FinalStandWaveRewards",
		}),
		PlaceObj('ModItemTutorialHint', {
			PopupId = "FinalStandBuyingWeapons",
			SortKey = 5,
			campaign = "FinalStand",
			group = "StartingHelp",
			id = "FinalStandBuyingWeapons",
		}),
		PlaceObj('ModItemTutorialHint', {
			PopupId = "FinalStandGameOver",
			SortKey = 6,
			campaign = "FinalStand",
			group = "StartingHelp",
			id = "FinalStandGameOver",
		}),
		PlaceObj('ModItemPopupNotification', {
			Image = "UI/Messages/Tutorials/tutorial_satview",
			OnceOnly = true,
			Text = T(952919562654, --[[ModItemPopupNotification FinalStandWelcome Text]] "If you are playing this for the first time, it is <em>HIGHLY RECOMMENDED</em> that you use in-game help (usually F1 key-bind) and read about Final Stand's exclusive quirks and mechanics.<newline><newline>And remember, Final Stand is meant to be re-playable, win or lose, restart, try again, experiment with mercs, factions and weapons.<newline><newline>Oh, and, do not forget to check sector stash for starter gear, good luck!"),
			Title = T(732374827408, --[[ModItemPopupNotification FinalStandWelcome Title]] "Welcome to Final Stand!"),
			campaign = "FinalStand",
			group = "StartingHelp",
			id = "FinalStandWelcome",
		}),
		PlaceObj('ModItemPopupNotification', {
			Image = "UI/Messages/Tutorials/tutorial_repair",
			OnceOnly = true,
			Text = T(462780677873, --[[ModItemPopupNotification FinalStandStarting Text]] "To help you started in Final Stand, you are provided with set of gear and supplies, so make sure to check sector stash!<newline><newline>Additionally, every arriving merc will receive an experience boost.\n"),
			Title = T(723967414179, --[[ModItemPopupNotification FinalStandStarting Title]] "Starting Help"),
			campaign = "FinalStand",
			group = "StartingHelp",
			id = "FinalStandStarting",
		}),
		PlaceObj('ModItemPopupNotification', {
			Image = "UI/Messages/scouting_outcome",
			OnceOnly = true,
			Text = T(717669732999, --[[ModItemPopupNotification FinalStandAboutEnemy Text]] "Enemy waves in Final Stand come at random intervals, and their time of arrival will be displayed on the game timeline.<newline><newline>Once they arrive, you will have no choice but to make your stand.<newline><newline>\nEach new wave will feature more enemies with better gear. Make sure you prepare your mercs accordingly."),
			Title = T(159941001417, --[[ModItemPopupNotification FinalStandAboutEnemy Title]] "About Enemy"),
			campaign = "FinalStand",
			group = "StartingHelp",
			id = "FinalStandAboutEnemy",
		}),
		PlaceObj('ModItemPopupNotification', {
			Image = "UI/Messages/Tutorials/tutorial_resting",
			OnceOnly = true,
			Text = T(106755881020, --[[ModItemPopupNotification FinalStandWaveRewards Text]] "Each time you complete an enemy wave, you will receive XP, money and loyalty.<newline><newline>Additionally, BobbyRay's Shop tier will be increased and gear will be restocked. Level up your mercs, buy gear and perform operations.<newline><newline>Loyalty will also grant you increased rewards for the next waves and reduced costs of operations in the sector."),
			Title = T(496349939142, --[[ModItemPopupNotification FinalStandWaveRewards Title]] "Wave Completion Rewards"),
			campaign = "FinalStand",
			group = "StartingHelp",
			id = "FinalStandWaveRewards",
		}),
		PlaceObj('ModItemPopupNotification', {
			Image = "UI/Messages/Tutorials/tutorial_combat_2",
			OnceOnly = true,
			Text = T(177634179175, --[[ModItemPopupNotification FinalStandBuyingWeapons Text]] "Congratulations on beating the first wave!<newline><newline>Things will only get harder from now on, so you will need better gear and supplies. Use BobbyRay's Shop just like in Hot Diamonds, but remember that orders still take time to arrive; plan accordingly."),
			Title = T(208267405410, --[[ModItemPopupNotification FinalStandBuyingWeapons Title]] "Buying Gear and Supplies"),
			campaign = "FinalStand",
			group = "StartingHelp",
			id = "FinalStandBuyingWeapons",
		}),
		PlaceObj('ModItemPopupNotification', {
			Image = "UI/Messages/game_over",
			OnceOnly = true,
			Text = T(891409899418, --[[ModItemPopupNotification FinalStandGameOver Text]] "If enemies defeat your squad and you lose control over sector, you will enter <em>Last Chance</em>.<newline><newline>This means you will be prompted to spend any money you have left to hire a new squad and take that sector back.<newline><newline>If you have no money or you fail to retake the sector, the game will end. However, if you succeed, you will exit <em>Last Chance</em> and can continue fighting."),
			Title = T(298883238277, --[[ModItemPopupNotification FinalStandGameOver Title]] "Final Chance and Game Over"),
			campaign = "FinalStand",
			group = "StartingHelp",
			id = "FinalStandGameOver",
		}),
		}),
}
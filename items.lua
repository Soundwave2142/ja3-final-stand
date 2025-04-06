return {
	PlaceObj('ModItemFolder', {
		'name', "Definitions",
		'comment', "Main Definitons of the mod",
	}, {
		PlaceObj('ModItemCampaignPreset', {
			Cities = {
				PlaceObj('CampaignCity', {
					'Id', "PortDiancie",
					'DisplayName', T(295166534598, --[[ModItemCampaignPreset FinalStand DisplayName]] "Port Cacao"),
				}),
			},
			DisclaimerOnStart = T(343258375424, --[[ModItemCampaignPreset FinalStand DisclaimerOnStart]] "Welcome to the Final Stand game mode. The premise is simple: survive the set amount of waves to win.\n\nEach time the enemy wave is coming, it is displayed on the game timeline. Each time you defeat the enemy wave, you will receive monetary compensation, and your mercs will gain an XP boost. \nIt's up to you to choose your roster, and BobbyRayShop is restocked every wave, but mercs and gear still take time to arrive, so plan accordingly.\n\nGood luck!"),
			DisplayName = T(500039653974, --[[ModItemCampaignPreset FinalStand DisplayName]] "Final Stand"),
			EffectsOnStart = {
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
				AllowRevealSectors({ "H4", "L8" })
			end,
			IsFinalStand = true,
			NameColor = 4292643868,
			Sectors = {
				PlaceObj('SatelliteSector', {
					'Id', "H4",
					'HideUnderground', true,
					'Map', "cfgT7U",
					'MapTier', 40,
					'Label1', "Ernie",
					'modId', "bzoQECK",
					'Label2', "Outpost",
					'display_name', T(621127133250, --[[ModItemCampaignPreset FinalStand display_name Sector name for H4]] "Fort L'Eau Bleu"),
					'Side', "neutral",
					'TerrainType', "Jungle",
					'WeatherZone', "Erny",
					'PatrolRespawnTime', 1728000,
					'TargetSectors', {
						"H2",
						"A2",
						"K10",
						"F7",
						"H7",
					},
					'ExtraDefenderSquads', {
						"LegionExtraDefenders_Balanced_Easy",
					},
					'EnemySquadsList', {
						"LegionAttackers_Balanced_Easy",
					},
					'StrongEnemySquadsList', {
						"LegionAttackers_Marksmen_Easy",
					},
					'Militia', true,
					'RAndRAllowed', true,
					'RepairShop', true,
					'bidirectionalRoadApply', true,
					'Roads', {
						South = false,
					},
					'bidirectionalBlockApply', true,
					'BlockTravel', set(),
					'BlockTravelRiver', set( "East", "North", "South", "West" ),
					'image', "UI/SatelliteView/SectorImages/H04",
					'DBDestinationSector', true,
					'MusicCombat', "Battle_Tough",
					'MusicConflict', "Outpost_Conflict",
					'MusicExploration', "Outpost_Exploration",
					'combatTaskAmount', 2,
				}),
				PlaceObj('SatelliteSector', {
					'Id', "L8",
					'HideUnderground', true,
					'Map', "PTFyTd4",
					'MapTier', 20,
					'Label1', "City",
					'modId', "bzoQECK",
					'display_name', T(187379373038, --[[ModItemCampaignPreset FinalStand display_name Sector name for L8]] "Port Cacao City"),
					'Side', "neutral",
					'TerrainType', "Urban",
					'WeatherZone', "SouthJungle",
					'City', "PortDiancie",
					'ShowCity', true,
					'Hospital', true,
					'Militia', true,
					'RAndRAllowed', true,
					'RepairShop', true,
					'bidirectionalRoadApply', true,
					'Roads', {},
					'bidirectionalBlockApply', true,
					'BlockTravel', {},
					'BlockTravelRiver', set( "East", "North", "South", "West" ),
					'image', "UI/SatelliteView/SectorImages/L08",
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
			starting_timestamp = 986104800,
			underground_file = "UI/SatelliteView/SatView_Underground",
		}),
		PlaceObj('ModItemFinalStandConfigDef', {
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
			Sectors = {
				PlaceObj('FinalStandConfigSector', {
					'Sector', "H4",
				}),
				PlaceObj('FinalStandConfigSector', {
					'Sector', "L8",
				}),
			},
			description = T(995080477580, --[[ModItemFinalStandConfigDef Default description]] "Default Final Stand config."),
			description_gamepad = T(876411840233, --[[ModItemFinalStandConfigDef Default description_gamepad]] "Default Final Stand config."),
			display_name = T(969651972519, --[[ModItemFinalStandConfigDef Default display_name]] "Default"),
			display_name_caps = T(570560636797, --[[ModItemFinalStandConfigDef Default display_name_caps]] "DEFAULT"),
			flavor_text = T(738336582644, --[[ModItemFinalStandConfigDef Default flavor_text]] "Default Final Stand config."),
			group = "Default",
			id = "Default",
		}),
		PlaceObj('ModItemFolder', {
			'name', "Friendly Factions",
		}, {
			PlaceObj('ModItemFolder', {
				'name', "General",
			}, {
				PlaceObj('ModItemFinalStandFriendlyFactionDef', {
					AttireHead = {},
					NameColor = 4286226623,
					SortKey = 1,
					comment = "(V) No modifiers or changes to Characters",
					description = T(740134134665, --[[ModItemFinalStandFriendlyFactionDef Mercs description]] "<em>Default faction</em>. Your mercs will not change their attire nor receive any bonuses or penalties.<newline><newline><flavor>You can not change the player faction when the campaign starts, but you can always start a new one and give it another run.</flavor>"),
					display_name = T(967105562153, --[[ModItemFinalStandFriendlyFactionDef Mercs display_name]] "Mercs"),
					display_name_caps = T(560481808058, --[[ModItemFinalStandFriendlyFactionDef Mercs display_name_caps]] "MERCS"),
					group = "Default",
					id = "Mercs",
				}),
				PlaceObj('ModItemFinalStandAttirePoolDef', {
					group = "General",
					id = "General",
				}),
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
									'EditableColor1', RGBA(9, 8, 8, 255),
									'EditableColor2', RGBA(32, 26, 22, 255),
									'EditableColor3', RGBA(22, 18, 15, 255),
								}),
							},
							'Chest', "Faction_Acc_Recon_02",
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
									'EditableColor1', RGBA(120, 85, 85, 255),
									'EditableColor2', RGBA(0, 0, 0, 255),
									'EditableColor3', RGBA(0, 0, 0, 255),
								}),
							},
							'Chest', "Faction_Acc_Demolition_Legion_02",
						}),
					},
					Specialization = "Mechanic",
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
					Specialization = "Mechanic",
					group = "General",
					id = "GeneralMechanic",
				}),
				}),
			PlaceObj('ModItemFolder', {
				'name', "Militia",
			}, {
				PlaceObj('ModItemFinalStandFriendlyFactionDef', {
					AttirePools = {
						PlaceObj('FinalStandFactionAttire', {
							'AttirePool', "Militia",
						}),
						PlaceObj('FinalStandFactionAttire', {
							'AttirePool', "General",
						}),
						PlaceObj('FinalStandFactionAttire', {
							'AttirePool', "GeneralDoctor",
						}),
						PlaceObj('FinalStandFactionAttire', {
							'AttirePool', "GeneralExplosives",
						}),
						PlaceObj('FinalStandFactionAttire', {
							'AttirePool', "GeneralLeader",
						}),
						PlaceObj('FinalStandFactionAttire', {
							'AttirePool', "GeneralMechanic",
						}),
						PlaceObj('FinalStandFactionAttire', {
							'AttirePool', "GeneralMarksmen",
						}),
					},
					NameColor = 4286226623,
					Parameters = {
						PlaceObj('PresetParamPercent', {
							'Name', "operationCheaper",
							'Value', 50,
							'Tag', "<operationCheaper>%",
						}),
						PlaceObj('PresetParamPercent', {
							'Name', "operationFaster",
							'Value', 35,
							'Tag', "<operationFaster>%",
						}),
					},
					comment = "Faster and cheaper sector operations, ability to train other rebels",
					display_name = T(315086321064, --[[ModItemFinalStandFriendlyFactionDef Militia display_name]] "Militia"),
					display_name_caps = T(838090083518, --[[ModItemFinalStandFriendlyFactionDef Militia display_name_caps]] "MILITIA"),
					group = "Default",
					id = "Militia",
					moneyModifier = 5,
					xpModifier = 20,
				}),
				PlaceObj('ModItemFinalStandAttirePoolDef', {
					Colors = {
						PlaceObj('ColorizationPropSet', {
							'EditableColor1', RGBA(57, 88, 27, 255),
							'EditableRoughness1', 37,
							'EditableColor2', RGBA(161, 126, 82, 255),
							'EditableColor3', RGBA(161, 131, 94, 255),
						}),
						PlaceObj('ColorizationPropSet', {
							'EditableColor1', RGBA(123, 58, 58, 255),
							'EditableColor2', RGBA(68, 107, 29, 255),
							'EditableColor3', RGBA(31, 43, 20, 255),
						}),
						PlaceObj('ColorizationPropSet', {
							'EditableColor1', RGBA(46, 60, 39, 255),
							'EditableColor2', RGBA(11, 11, 11, 255),
							'EditableColor3', RGBA(14, 14, 14, 255),
						}),
					},
					Hat = {
						PlaceObj('FinalStandAttirePoolHat', {
							'Gender', "Male",
							'Hat', "MilitiaCostumeMale_Mask_01",
							'HatSpot', "Origin",
						}),
						PlaceObj('FinalStandAttirePoolHat', {
							'Hat', "FactionMale_Hat_07",
						}),
					},
					NameColor = 4286226623,
					Pants = {
						PlaceObj('FinalStandAttirePoolPants', {
							'Gender', "Male",
							'Pants', "Faction_GrandChien_Bottom_03",
						}),
						PlaceObj('FinalStandAttirePoolPants', {
							'Gender', "Female",
							'Pants', "NPCCostumeFemale_Pants_05",
						}),
					},
					group = "Militia",
					id = "Militia",
				}),
				}),
			PlaceObj('ModItemFolder', {
				'name', "Rebels",
			}, {
				PlaceObj('ModItemFinalStandFriendlyFactionDef', {
					AttireHead = {},
					AttirePools = {
						PlaceObj('FinalStandFactionAttire', {
							'AttirePool', "Rebels",
						}),
						PlaceObj('FinalStandFactionAttire', {
							'AttirePool', "RebelsAllRounder",
						}),
						PlaceObj('FinalStandFactionAttire', {
							'AttirePool', "RebelsExplosive",
						}),
						PlaceObj('FinalStandFactionAttire', {
							'AttirePool', "RebelsMarksmen",
						}),
						PlaceObj('FinalStandFactionAttire', {
							'AttirePool', "RebelsLeader",
						}),
						PlaceObj('FinalStandFactionAttire', {
							'AttirePool', "RebelsMechanic",
						}),
						PlaceObj('FinalStandFactionAttire', {
							'AttirePool', "RebelsDoctor",
						}),
						PlaceObj('FinalStandFactionAttire', {
							'AttirePool', "General",
						}),
						PlaceObj('FinalStandFactionAttire', {
							'AttirePool', "GeneralDoctor",
						}),
						PlaceObj('FinalStandFactionAttire', {
							'AttirePool', "GeneralExplosives",
						}),
						PlaceObj('FinalStandFactionAttire', {
							'AttirePool', "GeneralLeader",
						}),
						PlaceObj('FinalStandFactionAttire', {
							'AttirePool', "GeneralMechanic",
						}),
						PlaceObj('FinalStandFactionAttire', {
							'AttirePool', "GeneralMarksmen",
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
					SortKey = 2,
					comment = "Faster BobbyRay delivery and higher tier each restock start",
					description = T(804842149252, --[[ModItemFinalStandFriendlyFactionDef Rebels description]] "<color 21 132 138> test </color> test"),
					display_name = T(943600656612, --[[ModItemFinalStandFriendlyFactionDef Rebels display_name]] "Maquis Rebels"),
					display_name_caps = T(960626436378, --[[ModItemFinalStandFriendlyFactionDef Rebels display_name_caps]] "MAQUIS REBELS"),
					group = "Default",
					id = "Rebels",
					moneyModifier = -25,
					msg_reactions = {
						PlaceObj('MsgReaction', {
							Event = "FinalStandBobbyRayRestock",
							Handler = function (self, bobbyRayValues)
								if not IsFinalStand() then return end
								if not self.id == GetFinalStandFriendlyFaction(true) then return end
								
								bobbyRayValues.nextTier = bobbyRayValues.nextTier + self:ResolveValue("bobbyRayTierModifier")
							end,
							param_bindings = false,
						}),
						PlaceObj('MsgReaction', {
							Event = "BobbyRayShopShipmentSent",
							Handler = function (self, shipment_details)
								if not IsFinalStand() then return end
								if not self.id == GetFinalStandFriendlyFaction(true) then return end
								
								local original_time = shipment_details.due_time - Game.CampaignTime
								local time_modified = (MulDivRound(original_time, 100 + self:ResolveValue("bobbyRaySpeedModifier"), 100) - original_time)
								
								local new_due_time = Game.CampaignTime + time_modified
								shipment_details.due_time = new_due_time
							end,
							param_bindings = false,
						}),
					},
					xpModifier = 5,
				}),
				PlaceObj('ModItemFinalStandAttirePoolDef', {
					Hat = {
						PlaceObj('FinalStandAttirePoolHat', {
							'Colors', {
								PlaceObj('ColorizationPropSet', {
									'EditableColor1', RGBA(44, 22, 13, 255),
									'EditableColor2', RGBA(10, 4, 2, 255),
									'EditableColor3', RGBA(0, 0, 0, 255),
								}),
							},
							'Hat', "FactionMale_Hat_07",
							'HatAttachOffsetX', -4,
							'HatAttachOffsetY', -2,
						}),
					},
					NameColor = 4286226623,
					group = "Rebels",
					id = "Rebels",
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
							'Body', "NPCCostumeFemale_Shirt_01",
							'BodyColorKey', "EditableColor2",
						}),
					},
					Hat = {
						PlaceObj('FinalStandAttirePoolHat', {
							'Colors', {
								PlaceObj('ColorizationPropSet', {
									'EditableColor1', RGBA(25, 39, 24, 255),
									'EditableColor2', RGBA(51, 85, 48, 255),
									'EditableColor3', RGBA(0, 0, 0, 255),
								}),
							},
							'Gender', "Male",
							'RollForHat2', false,
							'Hat', "MilitiaCostumeMale_Mask_01",
							'HatSpot', "Origin",
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
					Specialization = "Leader",
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
									'EditableColor2', RGBA(10, 4, 2, 255),
									'EditableColor3', RGBA(27, 64, 101, 255),
								}),
							},
							'Gender', "Male",
							'Body', "Faction_Rebels_Top_Recon",
							'BodyColorKey', "EditableColor1",
						}),
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
							'Gender', "Female",
							'Body', "NPCCostumeFemale_Shirt_01",
							'BodyColorKey', "EditableColor2",
						}),
					},
					Hat = {
						PlaceObj('FinalStandAttirePoolHat', {
							'Colors', {
								PlaceObj('ColorizationPropSet', {
									'EditableColor1', RGBA(8, 33, 55, 255),
								}),
								PlaceObj('ColorizationPropSet', {
									'EditableColor1', RGBA(8, 18, 26, 255),
								}),
							},
							'Gender', "Male",
							'RollForHat2', false,
							'Hat', "MilitiaCostumeMale_Mask_01",
							'HatSpot', "Origin",
						}),
					},
					NameColor = 4286226623,
					Pants = {
						PlaceObj('FinalStandAttirePoolPants', {
							'Colors', {
								PlaceObj('ColorizationPropSet', {
									'EditableColor1', RGBA(25, 29, 24, 255),
									'EditableColor2', RGBA(105, 105, 105, 255),
									'EditableRoughness2', 89,
									'EditableColor3', RGBA(0, 0, 0, 255),
								}),
								PlaceObj('ColorizationPropSet', {
									'EditableColor1', RGBA(30, 37, 27, 255),
									'EditableColor2', RGBA(25, 38, 18, 255),
									'EditableColor3', RGBA(0, 0, 0, 255),
								}),
								PlaceObj('ColorizationPropSet', {
									'EditableColor1', RGBA(46, 60, 39, 255),
									'EditableColor2', RGBA(25, 38, 18, 255),
									'EditableColor3', RGBA(0, 0, 0, 255),
								}),
								PlaceObj('ColorizationPropSet', {
									'EditableColor1', RGBA(32, 46, 38, 255),
									'EditableColor2', RGBA(167, 104, 44, 255),
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
							'Gender', "Female",
							'Pants', "EquipmentFemale_Pants_01",
						}),
					},
					Specialization = "Marksmen",
					group = "Rebels",
					id = "RebelsMarksmen",
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
							'Gender', "Female",
							'Body', "NPCCostumeFemale_Shirt_01",
							'BodyColorKey', "EditableColor2",
						}),
					},
					Hat = {
						PlaceObj('FinalStandAttirePoolHat', {
							'Colors', {
								PlaceObj('ColorizationPropSet', {
									'EditableColor1', RGBA(25, 39, 24, 255),
									'EditableColor2', RGBA(51, 85, 48, 255),
									'EditableColor3', RGBA(0, 0, 0, 255),
								}),
							},
							'Gender', "Male",
							'RollForHat2', false,
							'Hat', "MilitiaCostumeMale_Mask_01",
							'HatSpot', "Origin",
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
							'Gender', "Female",
							'Pants', "EquipmentFemale_Pants_01",
						}),
					},
					Specialization = "AllRounder",
					group = "Rebels",
					id = "RebelsAllRounder",
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
							'Body', "NPCCostumeFemale_Shirt_01",
							'BodyColorKey', "EditableColor2",
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
					Specialization = "ExplosiveExpert",
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
							'Gender', "Female",
							'Body', "NPCCostumeFemale_Shirt_01",
							'BodyColorKey', "EditableColor2",
						}),
					},
					Hat = {
						PlaceObj('FinalStandAttirePoolHat', {
							'Colors', {
								PlaceObj('ColorizationPropSet', {
									'EditableColor1', RGBA(25, 39, 24, 255),
									'EditableColor2', RGBA(51, 85, 48, 255),
									'EditableColor3', RGBA(0, 0, 0, 255),
								}),
							},
							'Gender', "Male",
							'RollForHat2', false,
							'Hat', "MilitiaCostumeMale_Mask_01",
							'HatSpot', "Origin",
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
							'Gender', "Female",
							'Pants', "EquipmentFemale_Pants_01",
						}),
					},
					Specialization = "Mechanic",
					group = "Rebels",
					id = "RebelsMechanic",
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
						'Squad', "LegionAttackers_Ordnance_Easy",
						'Waves', "1,3",
					}),
					PlaceObj('FinalStandEnemyFactionSquad', {
						'Squad', "LegionDefenders_Balanced_Easy",
						'Waves', "1,3",
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
						'Waves', "2,4,5",
					}),
					PlaceObj('FinalStandEnemyFactionSquad', {
						'Squad', "LegionAttackers_Marksmen_Hard",
						'Waves', "2,4,5",
					}),
					PlaceObj('FinalStandEnemyFactionSquad', {
						'Squad', "LegionAttackers_Ordnance_Hard",
						'Waves', "2,4,5",
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
				comment = "5% increase in Money and XP, easy enemies",
				display_name = T(625545314418, --[[ModItemFinalStandEnemyFactionDef Legion display_name]] "Legion"),
				group = "Default",
				id = "Legion",
				moneyModifier = 5,
				xpModifier = 5,
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
				comment = "10% increase in Money and XP, medium enemies",
				display_name = T(848092566579, --[[ModItemFinalStandEnemyFactionDef Adonis display_name]] "Adonis"),
				group = "Default",
				id = "Adonis",
				moneyModifier = 10,
				xpModifier = 10,
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
				comment = "15% increase in Money and XP, medium enemies",
				display_name = T(607354837385, --[[ModItemFinalStandEnemyFactionDef Army display_name]] "Army"),
				group = "Default",
				id = "Army",
				moneyModifier = 15,
				xpModifier = 15,
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
				comment = "25% increase in Money and XP, hard enemies",
				display_name = T(280034056377, --[[ModItemFinalStandEnemyFactionDef SuperSoldiers display_name]] "SuperSoldiers"),
				group = "Default",
				id = "SuperSoldiers",
				moneyModifier = 25,
				xpModifier = 25,
			}),
			}),
		PlaceObj('ModItemFolder', {
			'name', "Lengths",
		}, {
			PlaceObj('ModItemFinalStandLengthDef', {
				NameColor = 4291018156,
				SortKey = 1,
				description = T(469065984286, --[[ModItemFinalStandLengthDef ThreeWaves description]] "Survival <maxWaves> waves in order to win! This is the shortest and easiest way to experience the game-mode.<newline><newline><em>Attention:</em> The game is balanced around the amount of waves. If you want to experience harder enemies, it is recommended to choose the highest amount of waves.<newline><newline><flavor>You can not change the length of the game when the campaign starts.</flavor>"),
				display_name = T(400364955478, --[[ModItemFinalStandLengthDef ThreeWaves display_name]] "3 Waves"),
				display_name_caps = T(442614194967, --[[ModItemFinalStandLengthDef ThreeWaves display_name_caps]] "3 WAVES"),
				group = "Default",
				id = "ThreeWaves",
			}),
			PlaceObj('ModItemFinalStandLengthDef', {
				NameColor = 4291018156,
				SortKey = 2,
				description = T(286294288316, --[[ModItemFinalStandLengthDef FiveWaves description]] "Survival <maxWaves> in order to win!<em>Attention!</em>The game is balanced around the lengths and the amount of waves. If you want to experience harder enemies, it is recommended to choose highest amount of waves.<newline><newline><flavor>You can not change the length of the game when the campaign starts.</flavor>"),
				display_name = T(845045912590, --[[ModItemFinalStandLengthDef FiveWaves display_name]] "5 Waves"),
				display_name_caps = T(329343893497, --[[ModItemFinalStandLengthDef FiveWaves display_name_caps]] "5 WAVES"),
				group = "Default",
				id = "FiveWaves",
				maxWaves = 5,
			}),
			PlaceObj('ModItemFinalStandLengthDef', {
				NameColor = 4291018156,
				SortKey = 3,
				description = T(367987529496, --[[ModItemFinalStandLengthDef SevenWaves description]] "Survival <maxWaves> in order to win!<em>Attention!</em>The game is balanced around the lengths and the amount of waves. If you want to experience harder enemies, it is recommended to choose highest amount of waves.<newline><newline><flavor>You can not change the length of the game when the campaign starts.</flavor>"),
				display_name = T(880015722679, --[[ModItemFinalStandLengthDef SevenWaves display_name]] "7 Waves"),
				display_name_caps = T(467155438678, --[[ModItemFinalStandLengthDef SevenWaves display_name_caps]] "7 WAVES"),
				group = "Default",
				id = "SevenWaves",
				maxWaves = 7,
			}),
			}),
		PlaceObj('ModItemFolder', {
			'name', "Messages",
		}, {
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
				Params = "FinalStand",
				comment = "Game has been started and Final Stand has been configured",
				group = "Final Stand - Start",
				id = "FinalStandGameConfigured",
			}),
			PlaceObj('ModItemMsgDef', {
				Description = "A wave has been scheduled, this is triggered before marker is created",
				Params = "scheduledStand, currentWave",
				comment = "A wave has been scheduled, this is triggered before marker is created",
				group = "Final Stand - Start",
				id = "FinalStandWaveScheduled",
			}),
			PlaceObj('ModItemMsgDef', {
				Description = "A set of enemy squads are about to spawn",
				Params = "squads",
				comment = "A set of enemy squads are about to spawn",
				group = "Final Stand - Main",
				id = "FinalStandAttackSquadSpawning",
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
				Params = "baseValue, modifiers, flatBonuses",
				comment = "XP reward is being dispatched",
				group = "Final Stand - Main",
				id = "FinalStandRewardXP",
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
		}),
	PlaceObj('ModItemFolder', {
		'name', "Sectors",
	}, {
		PlaceObj('ModItemSector', {
			'mapName', "cfgT7U",
			'campaignId', "FinalStand",
			'sectorId', "H4",
			'SatelliteSectorObj', PlaceObj('SatelliteSector', {
				'Id', "H4",
				'HideUnderground', true,
				'Map', "cfgT7U",
				'MapTier', 40,
				'Label1', "Ernie",
				'modId', "bzoQECK",
				'Label2', "Outpost",
				'display_name', T(621127133250, --[[ModItemCampaignPreset FinalStand display_name Sector name for H4]] "Fort L'Eau Bleu"),
				'Side', "neutral",
				'TerrainType', "Jungle",
				'WeatherZone', "Erny",
				'PatrolRespawnTime', 1728000,
				'TargetSectors', {
					"H2",
					"A2",
					"K10",
					"F7",
					"H7",
				},
				'ExtraDefenderSquads', {
					"LegionExtraDefenders_Balanced_Easy",
				},
				'EnemySquadsList', {
					"LegionAttackers_Balanced_Easy",
				},
				'StrongEnemySquadsList', {
					"LegionAttackers_Marksmen_Easy",
				},
				'Militia', true,
				'RAndRAllowed', true,
				'RepairShop', true,
				'bidirectionalRoadApply', true,
				'Roads', {
					South = false,
				},
				'bidirectionalBlockApply', true,
				'BlockTravel', set(),
				'BlockTravelRiver', set( "East", "North", "South", "West" ),
				'image', "UI/SatelliteView/SectorImages/H04",
				'Events', {},
				'DBDestinationSector', true,
				'MusicCombat', "Battle_Tough",
				'MusicConflict', "Outpost_Conflict",
				'MusicExploration', "Outpost_Exploration",
				'combatTaskAmount', 2,
			}),
		}),
		PlaceObj('ModItemSector', {
			'mapName', "PTFyTd4",
			'campaignId', "FinalStand",
			'sectorId', "L8",
			'SatelliteSectorObj', PlaceObj('SatelliteSector', {
				'Id', "L8",
				'HideUnderground', true,
				'Map', "PTFyTd4",
				'MapTier', 20,
				'Label1', "City",
				'modId', "bzoQECK",
				'display_name', T(187379373038, --[[ModItemCampaignPreset FinalStand display_name Sector name for L8]] "Port Cacao City"),
				'Side', "neutral",
				'TerrainType', "Urban",
				'WeatherZone', "SouthJungle",
				'City', "PortDiancie",
				'ShowCity', true,
				'Hospital', true,
				'Militia', true,
				'RAndRAllowed', true,
				'RepairShop', true,
				'bidirectionalRoadApply', true,
				'Roads', {},
				'bidirectionalBlockApply', true,
				'BlockTravel', {},
				'BlockTravelRiver', set( "East", "North", "South", "West" ),
				'image', "UI/SatelliteView/SectorImages/L08",
				'Events', {},
				'MusicCombat', "Battle_Tough",
				'MusicConflict', "Town_Conflict",
				'MusicExploration', "Town_Exploration",
				'combatTaskAmount', 2,
			}),
		}),
		PlaceObj('ModItemFinalStandSectorDef', {
			Sector = "H4",
			comment = "Fort L'Eau Bleu",
			description = T(278354917183, --[[ModItemFinalStandSectorDef H4 description]] "Description of the sector!"),
			display_name = T(250583349994, --[[ModItemFinalStandSectorDef H4 display_name]] "H4 - Fort L'Eau Bleu"),
			group = "Default",
			id = "H4",
		}),
		PlaceObj('ModItemFinalStandSectorDef', {
			Sector = "L8",
			comment = "Port Cacao City",
			description = T(119457814568, --[[ModItemFinalStandSectorDef L8 description]] "Description of the sector!"),
			display_name = T(685381178936, --[[ModItemFinalStandSectorDef L8 display_name]] "L8 - Port Cacao City"),
			group = "Default",
			id = "L8",
		}),
		PlaceObj('ModItemSectorOperation', {
			Custom = false,
			GetTimelineEventDescription = function (self, sector_id, eventcontext)
				return T(300844268409, "<em><Nick></em> will finish resting.")
			end,
			HasOperation = function (self, merc)
				return false
			end,
			OnRemoveOperation = function (self, merc)
				merc.wounds_being_treated = 0
				if merc.RestTimer>0 and (Game.CampaignTime - merc.RestTimer) >= const.Satellite.UnitTirednessRestTime then				
						merc:SetTired(merc.Tiredness>0 and Max(merc.Tiredness-1, 0) or merc.Tiredness)
						merc.TravelTimerStart = 0
						merc.TravelTime = 0
						merc.WarnTired = true
				end
				merc.RestTimer = 0
			end,
			OnSetOperation = function (self, merc, arg)
				NetUpdateHash("OnSetOperation", self.id, merc.session_id)
				merc.wounds_being_treated = arg or PatientGetWoundedStacks(merc)
				merc.TravelTimerStart = 0
				if merc.RestTimer==0 then
					merc.RestTimer = Game.CampaignTime
				end
			end,
			Parameters = {
				PlaceObj('PresetParamNumber', {
					'Name', "HealPerTickBase",
					'Value', 10,
					'Tag', "<HealPerTickBase>",
				}),
				PlaceObj('PresetParamNumber', {
					'Name', "HealWoundThreshold",
					'Value', 1000,
					'Tag', "<HealWoundThreshold>",
				}),
			},
			ProgressCurrent = function (self, merc, sector)
				return merc.heal_wound_progress or 0
			end,
			ProgressPerTick = function (self, merc, prediction)
				if merc.wounds_being_treated >0 then
					return self:ResolveValue("HealPerTickBase")
				end
				return 0
			end,
			SectorMercsTick = function (self, merc)
				local busy = (g_ActiveBanters and #g_ActiveBanters > 0) or IsSetpiecePlaying() or GetDialog("ConversationDialog")
				local time = (Game.CampaignTime - merc.RestTimer)
				if not busy and (time % const.Satellite.UnitIdleTime) < 50 then
					local mercs = GetOperationProfessionals(merc:GetSector().Id, self.id)
					local actor = table.interaction_rand(mercs,"IdleVR")
					if actor then
						PlayVoiceResponse(actor, "Idle")
					end
				end
			end,
			ShowInCombatBadge = false,
			Tick = function (self, merc)
				UnitHealPerTick(merc, self:ProgressPerTick(merc), self:ResolveValue("HealWoundThreshold"))
			end,
			campaign = "FinalStand",
			description = T(396648182479, --[[ModItemSectorOperation FinalStandIdle description]] "Resting allows the merc to recover from Exhausted and Tired status effects while also restoring wounds and HP slowly."),
			display_name = T(727999289325, --[[ModItemSectorOperation FinalStandIdle display_name]] "Resting"),
			group = "Final Stand Operations",
			icon = "UI/SectorOperations/T_Icon_Activity_Resting",
			id = "FinalStandIdle",
			operation_type = set( "Healing" ),
			short_name = T(581651186726, --[[ModItemSectorOperation FinalStandIdle short_name]] "Resting"),
			sub_title = T(389723534268, --[[ModItemSectorOperation FinalStandIdle sub_title]] "No current tasks"),
		}),
		PlaceObj('ModItemSectorOperation', {
			CheckCompleted = function (self, merc, sector)
				if self:ProgressCurrent(merc[1], sector) >= self:ProgressCompleteThreshold(merc[1], sector) then
					local mercs = merc--GetOperationProfessionals(sector.Id, self.id)
					self:OnComplete(sector, mercs)
					local merc_names = {}
					-- move the merc that completed the operation last, because of the interrupt logic
					local count = #mercs
					for i=count,1, -1 do
						local m =  mercs[i]
					  	if self:ProgressCurrent(m, sector) >= self:ProgressCompleteThreshold(m, sector) then
								table.remove(mercs, i)
								table.insert(mercs, m)
							end
				    end
					for _, merc in ipairs(mercs) do
						merc_names[#merc_names + 1] = merc.Nick
						merc:SetCurrentOperation("Idle")
					end			
					if next(merc_names) then
						CombatLog("important", T{701411441832, "<em><mercs></em> finished <em>relaxing</em> in <SectorName(sector)>", mercs = ConcatListWithAnd(merc_names), sector = sector})
					end
					Msg("OperationCompleted", self, mercs, sector)
				end
			end,
			Complete = function (self, sector)
				local mercs = GetOperationProfessionals(sector.Id, self.id)
				local merc_names = {}
				for _, merc in ipairs(mercs) do
					merc_names[#merc_names + 1] = merc.Nick
					merc:SetCurrentOperation("Idle")
				end
				self:OnComplete(sector, mercs)
				if next(merc_names) then
					CombatLog("important", T{701411441832, "<em><mercs></em> finished <em>relaxing</em> in <SectorName(sector)>", mercs = ConcatListWithAnd(merc_names), sector = sector})
				end
				Msg("OperationCompleted", self, mercs, sector)
			end,
			Custom = false,
			GetOperationCost = function (self, merc, profession, idx)
				local sector = merc:GetSector()
				local loyalty = sector and GetCityLoyalty(sector.City) or 100
				local money_cost = self:ResolveValue("MoneyCostBase")
				if HasPerk(merc, "Negotiator") then
					local discount = CharacterEffectDefs.Negotiator:ResolveValue("discountPercent")
					money_cost = money_cost - MulDivRound(money_cost, discount, 100)
				end
				local money_cost_reduce = self:ResolveValue("MoneyCostLoyaltyReduce")
				local cost = money_cost -  MulDivRound(money_cost_reduce, loyalty, 100)
				return {[1] = {value = cost, resource = "Money"}}
			end,
			GetSectorSlots = function (self, prof, sector)
				return -1
			end,
			GetTimelineEventDescription = function (self, sector_id, eventcontext)
				if eventcontext.uId then
					return T(300844268409, "<em><Nick></em> will finish resting.")
				end	
				local mercs
				if eventcontext.mercs then
					mercs = table.map(eventcontext.mercs, function(id) return gv_UnitData[id].Nick end)
				else
					local professionId = self.Professions and self.Professions[1] and self.Professions[1].id
					mercs = GetOperationProfessionals(sector_id, self.id)
					mercs = table.map(professionId and mercs[professionId] or mercs, "Nick")
				end
				mercs = ConcatListWithAnd(mercs)
				return T{451827023939, "<em><mercs></em> will finish resting.", mercs = mercs}
			end,
			HasOperation = function (self, sector)
				return sector.RAndRAllowed
			end,
			OnComplete = function (self, sector, mercs)
				local scale = 4*self:ResolveValue("PerTickProgress") 
				for _,merc in ipairs(mercs) do	
					local progress = merc.randr_activity_progress
					if progress>=self:ResolveValue("ActivityDurationInHoursFull")*scale then
						merc:SetTired(const.utWellRested)
					elseif progress>=self:ResolveValue("ActivityDurationInHoursReduced")*scale then	
						merc:SetTired(Min(merc.Tiredness,0))
					elseif progress>=self:ResolveValue("ActivityDurationInHoursMin")*scale then	
						merc:SetTired(merc.Tiredness>0 and Max(merc.Tiredness-1, 0) or merc.Tiredness)
					end	
				end
			end,
			OnRemoveOperation = function (self, merc)
				self:OnComplete(merc:GetSector(), {merc})
				merc.randr_activity_progress = 0
				merc.wounds_being_treated = 0
			end,
			OnSetOperation = function (self, merc, arg)
				merc.randr_activity_progress = 0
				merc.wounds_being_treated = arg or PatientGetWoundedStacks(merc)
			end,
			Parameters = {
				PlaceObj('PresetParamNumber', {
					'Name', "HealPerTickBase",
					'Value', 14,
					'Tag', "<HealPerTickBase>",
				}),
				PlaceObj('PresetParamNumber', {
					'Name', "HealWoundThreshold",
					'Value', 900,
					'Tag', "<HealWoundThreshold>",
				}),
				PlaceObj('PresetParamNumber', {
					'Name', "MoneyCostBase",
					'Value', 250,
					'Tag', "<MoneyCostBase>",
				}),
				PlaceObj('PresetParamNumber', {
					'Name', "MoneyCostLoyaltyReduce",
					'Value', 200,
					'Tag', "<MoneyCostLoyaltyReduce>",
				}),
				PlaceObj('PresetParamNumber', {
					'Name', "ActivityDurationInHoursReduced",
					'Value', 8,
					'Tag', "<ActivityDurationInHoursReduced>",
				}),
				PlaceObj('PresetParamNumber', {
					'Name', "ActivityDurationInHoursMin",
					'Value', 6,
					'Tag', "<ActivityDurationInHoursMin>",
				}),
				PlaceObj('PresetParamNumber', {
					'Name', "ActivityDurationInHoursFull",
					'Value', 18,
					'Tag', "<ActivityDurationInHoursFull>",
				}),
				PlaceObj('PresetParamNumber', {
					'Name', "PerTickProgress",
					'Value', 800,
					'Tag', "<PerTickProgress>",
				}),
			},
			Professions = {
				PlaceObj('SectorOperationProfession', {
					'id', "Restman",
					'display_name', T(478932744129, --[[ModItemSectorOperation FinalStandRAndR display_name]] "Resting merc"),
					'description', T(714803161373, --[[ModItemSectorOperation FinalStandRAndR description]] "The Resting Mercs are actively resting restoring their strength for the coming fights."),
					'display_name_all_caps', T(443023391199, --[[ModItemSectorOperation FinalStandRAndR display_name_all_caps]] "RESTING MERC"),
					'display_name_plural', T(243610395022, --[[ModItemSectorOperation FinalStandRAndR display_name_plural]] "Resting mercs"),
					'display_name_plural_all_caps', T(962753856892, --[[ModItemSectorOperation FinalStandRAndR display_name_plural_all_caps]] "RESTING MERCS"),
				}),
			},
			ProgressCompleteThreshold = function (self, merc, sector, prediction)
				--8h,each tick is in 15min => 8*4 and scale 1000
				return self:ResolveValue("ActivityDurationInHoursFull")*4*self:ResolveValue("PerTickProgress")
			end,
			ProgressCurrent = function (self, merc, sector)
				return merc and merc.randr_activity_progress or 0
			end,
			ProgressPerTick = function (self, merc, prediction)
				local perTick = self:ResolveValue("PerTickProgress")
				if HasPerk(merc, "JackOfAllTrades") then
					local mod = CharacterEffectDefs.JackOfAllTrades:ResolveValue("activityDurationMod")
					perTick = perTick + MulDivRound(perTick, mod, 100)
				end
				return perTick
			end,
			RequiredResources = {
				"Money",
			},
			SectorMercsTick = function (self, merc)
				local sector = merc:GetSector()
				local mercs = GetOperationProfessionals(sector.Id, self.id)
				table.insert_unique(mercs, merc)
				
				local completed  = {}
				for _, m in ipairs( mercs) do
					UnitHealPerTick(m,self:ResolveValue("HealPerTickBase"), self:ResolveValue("HealWoundThreshold"))
					local progress_per_tick = self:ProgressPerTick(m)
					if CheatEnabled("FastActivity") then
						progress_per_tick = progress_per_tick*100
					end
					m.randr_activity_progress = m.randr_activity_progress + progress_per_tick
					if self:ProgressCurrent(m, sector) >= self:ProgressCompleteThreshold(m, sector) then
						completed[#completed +1] = m
					end
				end
				if next(completed) then	
					self:CheckCompleted(completed, sector)	
				end
			end,
			SortKey = 45,
			Tick = function (self, merc)
				return
			end,
			campaign = "FinalStand",
			description = T(879803200313, --[[ModItemSectorOperation FinalStandRAndR description]] "Spend some time for active rest and entertainment. HP are restored faster, Wounds naturally heal faster, and all exhaustion effects are removed."),
			display_name = T(769555243409, --[[ModItemSectorOperation FinalStandRAndR display_name]] "R&R"),
			group = "Final Stand Operations",
			icon = "UI/SectorOperations/T_Icon_Activity_R_R",
			id = "FinalStandRAndR",
			image = "UI/Messages/Operations/r&r",
			log_msg_start = T(183288123461, --[[ModItemSectorOperation FinalStandRAndR log_msg_start]] "<em><mercs></em> started <em>relaxing</em> in <SectorName(sector)>"),
			operation_type = set( "Healing" ),
			short_name = T(521708174086, --[[ModItemSectorOperation FinalStandRAndR short_name]] "R&R"),
			sub_title = T(501928600254, --[[ModItemSectorOperation FinalStandRAndR sub_title]] "Rest and Recreation"),
		}),
		PlaceObj('ModItemSectorOperation', {
			BoostProgress = function (self, perc, sector)
				return 0
			end,
			CheckCompleted = function (self, merc, sector)
				if #GetOperationProfessionals(sector.Id, self.id, "Patient") == 0 then
					self:Complete(sector)
				end
			end,
			Complete = function (self, sector)
				local mercs = GetOperationProfessionals(sector.Id, self.id)
				local merc_names = {}
				local merc_doctors = table.map(GetOperationProfessionals(sector.Id, self.id,"Doctor"), function (o) return o.Nick end)
				
				for _, merc in ipairs(mercs) do
					merc_names[#merc_names + 1] = merc.Nick
					merc:SetCurrentOperation("Idle")
				end
				self:OnComplete(sector, mercs)
				if next(merc_doctors) then
					CombatLog("short",T{270791010368, "<em><doctors></em> finished treating wounds in <SectorName(sector)>",doctors = ConcatListWithAnd(merc_doctors), sector = sector})
				end
				Msg("OperationCompleted", self, mercs, sector)
			end,
			Custom = false,
			FilterAvailable = function (self, merc, profession)
				if profession == "Patient" then
					return merc:HasStatusEffect("Wounded")
				else
					return not self.min_requirement_stat or merc[self.min_requirement_stat] >= self.min_requirement_stat_value
				end
			end,
			GetOperationCost = function (self, merc, profession)
				if profession == "Patient" then
					return  {[1] = {value = self:ResolveValue("MedicalCostPerWound") * PatientGetWoundsBeingTreated(merc), resource = "Meds"}}
				else
					return {}
				end
			end,
			GetSectorSlots = function (self, prof, sector)
				if prof == "Patient" then
					return #GetOperationProfessionals(sector.Id, self.id, "Doctor") * self:ResolveValue("PatientSlotsPerDoctor")
				end
				return -1
			end,
			GetTimelineEventDescription = function (self, sector_id, eventcontext)
				local doctors, patients
				local evmercs, prof
				if eventcontext.mercs then
					evmercs = table.map(eventcontext.mercs, function(id) return gv_UnitData[id].Nick end)
					prof = eventcontext.profession
				end
				local mercs = GetOperationProfessionalsGroupedByProfession(sector_id, self.id)
				if prof then
					if prof=="Doctor" then
						doctors = evmercs 
						patients = mercs["Patient"]
						patients = table.map(patients, "Nick")
					else
						doctors = mercs["Doctor"]
						doctors = table.map(doctors, "Nick")
						patients = evmercs
					end
				else
					patients = mercs["Patient"]
					patients = table.map(patients, "Nick")
					doctors = mercs["Doctor"]
					doctors = table.map(doctors, "Nick")
				end
				patients = ConcatListWithAnd(patients)
				doctors = ConcatListWithAnd(doctors)
				return T{622566473650, "<em><doctors></em> will finish treating <em><patients></em>.", doctors = doctors, patients = patients}
			end,
			HasOperation = function (self, sector)
				return true
			end,
			IsEnabled = function (self, sector)
				local mercs_available = GetAvailableMercs(sector, self, "Doctor")
				local mercs_current = GetOperationProfessionals(sector.Id,"Doctor")
				if #mercs_available == 0 and #mercs_current == 0 then
					return false, T(449205258912, "No doctors available")
				end
				
				local mercs = GetPlayerMercsInSector(sector.Id)
				local wounded, wounded_unavailable
				for _, id in ipairs(mercs) do
					local unit = gv_UnitData[id]
					if unit:HasStatusEffect("Wounded") then
						if unit.Operation=="Idle" then
							wounded = true
						else
							wounded_unavailable = true
						end	
					end
				end
				if not wounded and  wounded_unavailable then
					return false, T(457589824008, "Wounded mercs are busy with another operation")
				elseif not wounded then
					return false, T(709401245024, "No wounded mercs")
				end
				
				return true
			end,
			OnRemoveOperation = function (self, merc)
				if IsPatient(merc) then
					merc.wounds_being_treated = 0
				end	
			end,
			OnSetOperation = function (self, merc, arg)
				if IsPatient(merc) then
					merc.wounds_being_treated = arg or PatientGetWoundedStacks(merc)
				end
				RecalcOperationETAs(merc:GetSector(), "TreatWounds")
			end,
			Parameters = {
				PlaceObj('PresetParamNumber', {
					'Name', "MedicalCostPerWound",
					'Value', 5,
					'Tag', "<MedicalCostPerWound>",
				}),
				PlaceObj('PresetParamNumber', {
					'Name', "HealPerTickBase",
					'Value', 15,
					'Tag', "<HealPerTickBase>",
				}),
				PlaceObj('PresetParamNumber', {
					'Name', "HealWoundThreshold",
					'Value', 1500,
					'Tag', "<HealWoundThreshold>",
				}),
				PlaceObj('PresetParamNumber', {
					'Name', "PatientSlotsPerDoctor",
					'Value', 3,
					'Tag', "<PatientSlotsPerDoctor>",
				}),
			},
			Professions = {
				PlaceObj('SectorOperationProfession', {
					'id', "Doctor",
					'display_name', T(880912302653, --[[ModItemSectorOperation FinalStandTreatWounds display_name]] "Doctor"),
					'description', T(834682297223, --[[ModItemSectorOperation FinalStandTreatWounds description]] "The Doctor will gradually heal all wounds afflicting the Patients."),
					'display_name_all_caps', T(166935156623, --[[ModItemSectorOperation FinalStandTreatWounds display_name_all_caps]] "DOCTOR"),
					'display_name_plural', T(582482708212, --[[ModItemSectorOperation FinalStandTreatWounds display_name_plural]] "Doctors"),
					'display_name_plural_all_caps', T(386265932998, --[[ModItemSectorOperation FinalStandTreatWounds display_name_plural_all_caps]] "DOCTORS"),
				}),
				PlaceObj('SectorOperationProfession', {
					'id', "Patient",
					'display_name', T(693718842548, --[[ModItemSectorOperation FinalStandTreatWounds display_name]] "Patient"),
					'display_name_all_caps', T(684153907392, --[[ModItemSectorOperation FinalStandTreatWounds display_name_all_caps]] "PATIENT"),
					'display_name_plural', T(999084710039, --[[ModItemSectorOperation FinalStandTreatWounds display_name_plural]] "Patients"),
					'display_name_plural_all_caps', T(246646297449, --[[ModItemSectorOperation FinalStandTreatWounds display_name_plural_all_caps]] "PATIENTS"),
				}),
			},
			ProgressCompleteThreshold = function (self, merc, sector, prediction)
				if not merc or prediction~="Patient" then
					local slowest = 0
					for _, merc in ipairs(GetOperationProfessionals(sector.Id, self.id, "Patient")) do
						slowest = Max(slowest, PatientGetWoundsBeingTreated(merc) * self:ResolveValue("HealWoundThreshold"))
					end
					return slowest
				end
				
				return (IsPatient(merc) or prediction=="Patient") and PatientGetWoundsBeingTreated(merc) * self:ResolveValue("HealWoundThreshold") or 0
			end,
			ProgressCurrent = function (self, merc, sector, prediction)
				if not merc or prediction~="Patient"  then
					local slowest = 0
					for _, merc in ipairs(GetOperationProfessionals(sector.Id, self.id, "Patient")) do
						slowest = Max(slowest, merc.heal_wound_progress)
					end
					return slowest
				end
				return (IsPatient(merc) or prediction=="Patient") and merc.heal_wound_progress or 0
			end,
			ProgressPerTick = function (self, merc, prediction)
				if IsPatient(merc) or prediction == "Patient" then
					local bonus = GetHealingBonus(merc:GetSector(), self.id)
					local perTick = MulDivRound(self:ResolveValue("HealPerTickBase"), bonus, 100)
					if HasPerk(merc, "JackOfAllTrades") then
						local mod = CharacterEffectDefs.JackOfAllTrades:ResolveValue("activityDurationMod")
						perTick = perTick + MulDivRound(perTick, mod, 100)
					end
					return perTick
				end
				return 0
			end,
			RequiredResources = {
				"Meds",
			},
			SectorOperationStats = function (self, sector, check_only)
				if check_only then return true end
				local lines = {}
				if self.min_requirement_stat and self.min_requirement_stat_value then
					local prop = table.find_value(UnitPropertiesStats:GetProperties(), "id", self.min_requirement_stat)
					lines[#lines + 1] = {text =  T{300232421689, "Min Required <name>", name = prop.name},value= T{139355455984, "<min_requirement_stat_value>", self}}
				end
				local factor = GetHealingBonus(sector, self.id)
				if factor<=100 then
					lines[#lines + 1] = {text = T(517619818105, "Healing Factor"), value = T{881588660903, "<percent(factor)>", factor = factor}}
				else
					lines[#lines + 1] = {text = T(517619818105, "Healing Factor"), value = T{985654435134, "<FormatAsFloat(factor, 100,1)>x", factor = factor}}
				end
				return lines, false
			end,
			SortKey = 10,
			Tick = function (self, merc)
				local sector = merc:GetSector()
				if IsPatient(merc) then
					UnitHealPerTick(merc, self:ProgressPerTick(merc),self:ResolveValue("HealWoundThreshold"))
					local doctors = GetOperationProfessionals(sector.Id, self.id,"Doctor")
					if IsPatientReady(merc) or #doctors<=0 then
						if merc.OperationProfessions and merc.OperationProfessions.Doctor then
							merc.OperationProfession = "Doctor"	
							merc:RemoveOperationProfession("Patient")					
						else
							if PatientGetWoundedStacks(merc)==0 then
								CombatLog("important", T{730468857355, "<merc_name> has been <em>cured of all wounds</em>", merc_name = merc.Nick})
							end
							merc:SetCurrentOperation("Idle")
						end
					end
				end
				if IsDoctor(merc) then
					self:CheckCompleted(merc, sector)
				end
			end,
			campaign = "FinalStand",
			description = T(817030229403, --[[ModItemSectorOperation FinalStandTreatWounds description]] "Mercs with high <em>Medical</em> skill can treat the wounds of other mercs and themselves at the cost of <em>Meds</em>."),
			display_name = T(319005167583, --[[ModItemSectorOperation FinalStandTreatWounds display_name]] "Treat Wounds"),
			group = "Final Stand Operations",
			icon = "UI/SectorOperations/T_Icon_Activity_Healing",
			id = "FinalStandTreatWounds",
			image = "UI/Messages/Operations/treat_wounds",
			min_requirement_stat = "Medical",
			min_requirement_stat_value = 30,
			operation_type = {
				Healing = true,
			},
			related_stat = "Medical",
			short_name = T(443145376761, --[[ModItemSectorOperation FinalStandTreatWounds short_name]] "Healing"),
			sub_title = T(120812043018, --[[ModItemSectorOperation FinalStandTreatWounds sub_title]] "Spend Meds to heal wounded mercs"),
		}),
		PlaceObj('ModItemSectorOperation', {
			BoostProgress = function (self, perc, sector)
				return 0
			end,
			CheckCompleted = function (self, merc, sector)
				if #GetOperationProfessionals(sector.Id, "HospitalTreatment") == 0 then
					self:Complete(sector)
				end
			end,
			Complete = function (self, sector)
				local mercs = GetOperationProfessionals(sector.Id, self.id)
				for _, merc in ipairs(mercs) do
					merc:SetTired(const.utNormal)
				end
				local merc_names = {}
				for _, merc in ipairs(mercs) do
					merc_names[#merc_names + 1] = merc.Nick
					merc:SetCurrentOperation("Idle")
				end
				self:OnComplete(sector, mercs)
				if next(merc_names) then
					CombatLog("important", T{379238071985, "<em><mercs></em> were discharged from the <em>hospital</em> in <SectorName(sector)>", mercs = ConcatListWithAnd(merc_names),operation = self.display_name, sector = sector})
				end
				Msg("OperationCompleted", self, mercs, sector)
			end,
			Custom = false,
			FilterAvailable = function (self, merc, profession)
				return merc:HasStatusEffect("Wounded")
			end,
			GetOperationCost = function (self, merc, profession, idx)
				local cost = PatientGetWoundedStacks(merc) * self:ResolveValue("MoneyPerWound")
				if HasPerk(merc, "Negotiator") then
					local discount = CharacterEffectDefs.Negotiator:ResolveValue("discountPercent")
					cost = cost - MulDivRound(cost, discount, 100)
				end
				local sector = merc:GetSector()
				local loyalty = GetCityLoyalty(sector.City)
				local diff = cost * self:ResolveValue("min_loyalty_cost_mul") - cost
				cost = cost + MulDivRound(100 - loyalty,  diff, 100) -- scale by loyalty
				return {[1] = {value = cost, resource = "Money"}}
			end,
			GetSectorSlots = function (self, prof)
				return 5
			end,
			HasOperation = function (self, sector)
				return sector.Hospital and not sector.HospitalLocked
			end,
			IsEnabled = function (self, sector)
				local min_loyalty = self:ResolveValue("MinRequiredLoyalty")
				local loyalty = GetCityLoyalty(sector.City)
				if loyalty < min_loyalty then
					return false, T{203480257255, "The minimum required loyalty is <num>", num = min_loyalty}
				end
				return true
			end,
			OnRemoveOperation = function (self, merc)
				if IsPatient(merc) then
					merc.wounds_being_treated = 0
				end
			end,
			OnSetOperation = function (self, merc, arg)
				if IsPatient(merc) then
					merc.wounds_being_treated = arg or PatientGetWoundedStacks(merc)
				end
			end,
			Parameters = {
				PlaceObj('PresetParamNumber', {
					'Name', "HealPerTickBase",
					'Value', 40,
					'Tag', "<HealPerTickBase>",
				}),
				PlaceObj('PresetParamNumber', {
					'Name', "HealWoundThreshold",
					'Value', 500,
					'Tag', "<HealWoundThreshold>",
				}),
				PlaceObj('PresetParamNumber', {
					'Name', "MinRequiredLoyalty",
					'Value', 5,
					'Tag', "<MinRequiredLoyalty>",
				}),
				PlaceObj('PresetParamNumber', {
					'Name', "min_loyalty_cost_mul",
					'Value', 3,
					'Tag', "<min_loyalty_cost_mul>",
				}),
				PlaceObj('PresetParamNumber', {
					'Name', "MoneyPerWound",
					'Value', 600,
					'Tag', "<MoneyPerWound>",
				}),
			},
			Professions = {
				PlaceObj('SectorOperationProfession', {
					'id', "Patient",
					'display_name', T(942596624334, --[[ModItemSectorOperation FinalStandHospitalTreatment display_name]] "Patient"),
					'description', T(130703913670, --[[ModItemSectorOperation FinalStandHospitalTreatment description]] "All wounds will be gradually removed from the Patient."),
					'display_name_all_caps', T(817970522423, --[[ModItemSectorOperation FinalStandHospitalTreatment display_name_all_caps]] "PATIENT"),
					'display_name_plural', T(317413062800, --[[ModItemSectorOperation FinalStandHospitalTreatment display_name_plural]] "Patients"),
					'display_name_plural_all_caps', T(192521259317, --[[ModItemSectorOperation FinalStandHospitalTreatment display_name_plural_all_caps]] "PATIENTS"),
				}),
			},
			ProgressCompleteThreshold = function (self, merc, sector, prediction)
				if not merc or prediction~="Patient" then
					local slowest = 0
					for _, merc in ipairs(GetOperationProfessionals(sector.Id, self.id)) do
						slowest = Max(slowest, PatientGetWoundsBeingTreated(merc) * self:ResolveValue("HealWoundThreshold"))
					end
					return slowest
				end
				return PatientGetWoundsBeingTreated(merc) * self:ResolveValue("HealWoundThreshold")
			end,
			ProgressCurrent = function (self, merc, sector, prediction)
				if not merc or prediction~="Patient"  then
					local slowest = 0
					for _, merc in ipairs(GetOperationProfessionals(sector.Id, self.id)) do
						slowest = Max(slowest, merc.heal_wound_progress)
					end
					return slowest
				end
				return merc and merc.heal_wound_progress or 0
			end,
			ProgressPerTick = function (self, merc, prediction)
				local perTick = self:ResolveValue("HealPerTickBase")
				if HasPerk(merc, "JackOfAllTrades") then
					local mod = CharacterEffectDefs.JackOfAllTrades:ResolveValue("activityDurationMod")
					perTick = perTick + MulDivRound(perTick, mod, 100)
				end
				return perTick
			end,
			RequiredResources = {
				"Money",
			},
			SortKey = 1,
			Tick = function (self, merc)
				UnitHealPerTick(merc, self:ProgressPerTick(merc),self:ResolveValue("HealWoundThreshold"))
				if IsPatientReady(merc) then
				merc:SetCurrentOperation("Idle")
				end
				self:CheckCompleted(merc, merc:GetSector())
			end,
			campaign = "FinalStand",
			description = T(337909536357, --[[ModItemSectorOperation FinalStandHospitalTreatment description]] "Medical treatment in the local <em>hospital</em>. Faster than Treat Wounds operation. High cost in money but doesn't require Meds. High <em>Loyalty</em> in this sector decreases the cost of this Operation."),
			display_name = T(196420911439, --[[ModItemSectorOperation FinalStandHospitalTreatment display_name]] "Hospital Treatment"),
			group = "Final Stand Operations",
			icon = "UI/SectorOperations/T_Icon_Activity_Healing_Doctor",
			id = "FinalStandHospitalTreatment",
			image = "UI/Messages/Operations/hospital_treatment",
			log_msg_start = T(369130627252, --[[ModItemSectorOperation FinalStandHospitalTreatment log_msg_start]] "<em><mercs></em> are in a <em>hospital</em> in <SectorName(sector)>"),
			operation_type = {
				Healing = true,
			},
			short_name = T(216978568879, --[[ModItemSectorOperation FinalStandHospitalTreatment short_name]] "Hospital"),
			sub_title = T(571229091118, --[[ModItemSectorOperation FinalStandHospitalTreatment sub_title]] "Medical facility is available"),
		}),
		PlaceObj('ModItemSectorOperation', {
			CanPerformOperation = function (self, merc)
				local context = {activity = self.display_name}
				if merc.Mechanical == 0 then
					return "OperationMechanicalStatError", context
				else
					return self:CanPerformOperationBase(merc)
				end	
			end,
			Complete = function (self, sector)
				local mercs = GetOperationProfessionals(sector.Id, self.id)
				local merc_names = {}
				for _, merc in ipairs(mercs) do
					merc_names[#merc_names + 1] = merc.Nick
					merc:SetCurrentOperation("Idle")
				end
				self:OnComplete(sector, mercs)
				if next(merc_names) then
					CombatLog("important", T{258083168009, "<em><mercs></em> completed <em><activity></em> in <SectorName(sector)>", mercs = ConcatListWithAnd(merc_names),activity = self.display_name, sector = sector})
				end
				Msg("OperationCompleted", self, mercs, sector)
			end,
			Custom = false,
			GetSectorSlots = function (self, prof, sector)
				return 2
			end,
			GetTimelineEventDescription = function (self, sector_id, eventcontext)
				local mercs
				local professionId = self.Professions and self.Professions[1] and self.Professions[1].id
				if eventcontext.mercs then
					mercs = table.map(eventcontext.mercs, function(id) return gv_UnitData[id].Nick end)
				else
					mercs = GetOperationProfessionalsGroupedByProfession(sector_id, self.id)
					mercs = table.map(professionId and mercs[professionId] or mercs, "Nick")
				end
				mercs = ConcatListWithAnd(mercs)
				return T{177263993197, "<em><mercs></em> will finish repairing all items.", mercs = mercs}
			end,
			HasOperation = function (self, sector)
				return true
			end,
			IsEnabled = function (self, sector)
				local merc_ids=GetPlayerMercsInSector(sector.Id)
				local mercs = {}
				for _, id in ipairs(merc_ids) do
					mercs[#mercs+1] = gv_UnitData[id]
				end
				local to_repair= SectorOperationFillItemsToRepair(sector.Id,mercs,"checks")
				if not to_repair then
					return to_repair, T(348922386675, "No items that need repair")
				end
				return true
			end,
			OnRemoveOperation = function (self, merc)
				local sector = merc:GetSector()
				local mercs = GetOperationProfessionals(sector.Id, self.id,false, merc.session_id)
				-- reset items
				if #mercs<=0 then
					sector.sector_repair_items_queued = {}
					SectorOperationFillItemsToRepair(sector.Id,mercs)
					ObjModified(sector.sector_repair_items_queued)
					if sector.started_operations and sector.started_operations.RepairItems then
						NetSyncEvent("InterruptSectorOperation", sector.Id,"RepairItems")				
					end
					
					Msg("OperationCompleted", self, mercs, sector)
				end
			end,
			OnSetOperation = function (self, merc, arg)
				local sector = merc:GetSector()
				local mercs = GetOperationProfessionals(sector.Id, self.id)
				-- reset items
				sector.sector_repair_items_queued = {}
				SectorOperationFillItemsToRepair(sector.Id,mercs)
				ObjModified(sector.sector_repair_items_queued)
			end,
			Parameters = {
				PlaceObj('PresetParamNumber', {
					'Name', "restore_condition_per_Part",
					'Value', 20,
					'Tag', "<restore_condition_per_Part>",
				}),
				PlaceObj('PresetParamNumber', {
					'Name', "free_repair",
					'Value', 20,
					'Tag', "<free_repair>",
				}),
				PlaceObj('PresetParamNumber', {
					'Name', "min_time",
					'Value', 6,
					'Tag', "<min_time>",
				}),
				PlaceObj('PresetParamNumber', {
					'Name', "parts_per_step",
					'Value', 1,
					'Tag', "<parts_per_step>",
				}),
				PlaceObj('PresetParamNumber', {
					'Name', "stat_multiplier",
					'Value', 200,
					'Tag', "<stat_multiplier>",
				}),
			},
			Professions = {
				PlaceObj('SectorOperationProfession', {
					'id', "Repair",
					'display_name', T(635488689307, --[[ModItemSectorOperation FinalStandRepairItems display_name]] "Mechanic"),
					'description', T(265103206140, --[[ModItemSectorOperation FinalStandRepairItems description]] "The Mechanic will repair the selected items."),
					'display_name_all_caps', T(935681100300, --[[ModItemSectorOperation FinalStandRepairItems display_name_all_caps]] "MECHANICS"),
					'display_name_plural', T(506318673345, --[[ModItemSectorOperation FinalStandRepairItems display_name_plural]] "Mechanic"),
					'display_name_plural_all_caps', T(127888360853, --[[ModItemSectorOperation FinalStandRepairItems display_name_plural_all_caps]] "MECHANICS"),
				}),
			},
			ProgressCompleteThreshold = function (self, merc, sector, prediction)
				local item, data = SectorOperationItemToRepair(sector.Id, prediction)
				if not item then return 0 end
				local queue = SectorOperationItems_GetItemsQueue(sector.Id,"RepairItems")
				
				local max = 0
				for _, data in ipairs(queue) do
					local item = SectorOperationRepairItems_GetItemFromData(data)
					if item then
						local max_condition = item:GetMaxCondition()			
						max = max + max_condition*item.RepairCost
					end
				end
				return max
			end,
			ProgressCurrent = function (self, merc, sector, prediction)
				local item, dta = SectorOperationItemToRepair(sector.Id, prediction)
				if not item then return 0 end
				local queue = SectorOperationItems_GetItemsQueue(sector.Id, "RepairItems")
				local max = 0
				for _, data in ipairs(queue) do
					local item =  SectorOperationRepairItems_GetItemFromData(data)
					if item then
						local prev_cond = item.Condition
						max = max + prev_cond*item.RepairCost + item.repair_progress
						if not prediction then
							NetUpdateHash("RepairItem_ProgressCurrent", item.id, item.class, item.Condition, item.repair_progress)
						end
					end
				end
				return max
			end,
			ProgressPerTick = function (self, merc, prediction)
				if not merc then return 0 end
				local sector = merc:GetSector()
				local mercs = GetOperationProfessionals(sector.Id, self.id)
				table.insert_unique(mercs, merc)
				
				local item, data = SectorOperationItemToRepair(sector.Id, prediction)
				if not item then
					return 0
				end
				-- add progress
				local sum_stat = GetSumOperationStats(mercs, "Mechanical", self:ResolveValue("stat_multiplier"))			
				return  sum_stat
			end,
			RequiredResources = {
				"Parts",
			},
			SectorMercsTick = function (self, merc)
				local sector = merc:GetSector()
				local start_time = sector.started_operations[self.id]
				local min_time = self:ResolveValue("min_time")
				local timediff =  (Game.CampaignTime - start_time)
				local min_h = (min_time*const.Scale.h)
				local ticks_left = 1 
				if timediff<min_h then
					-- does not progress first 6 (min_time) hours
					 return	
				elseif timediff==min_h then
					-- add all progress for the first 6(min_time) hours
					ticks_left = min_time*4
				end
				
				local mercs = GetOperationProfessionals(sector.Id, self.id)
				table.insert_unique(mercs, merc)
				
				for i=1,ticks_left do
					local item, data = SectorOperationItemToRepair(sector.Id)
					if not item then
						assert(not next(sector.sector_reapir_items_queued))
						self:Complete(sector)
						return
					end
					-- add progress
					local sum_stat = GetSumOperationStats(mercs, "Mechanical", self:ResolveValue("stat_multiplier"))
					local prev_cond = item.Condition
					local prev_progress = item.repair_progress
					local max_condition = item:GetMaxCondition()
					local to_repair = max_condition - prev_cond
					AddScaledProgress(item, "repair_progress", "Condition", sum_stat,max_condition, item.RepairCost)
					
					local repaired = item.Condition - prev_cond
					
					--use parts
					if repaired > 0 then
						if to_repair <= self:ResolveValue("free_repair") then
						else
							-- get one part
							local border = 0
							while border<max_condition do
								border = border + self:ResolveValue("restore_condition_per_Part")
								if item.Condition<border then
									break
								end	
								if prev_cond<border and item.Condition>=border then
									-- pay parts
									local parts, m, mbag, slot_name
									for _, merc in ipairs(mercs) do
										parts = merc:GetItem("Parts")			
										if parts then
											m = merc			
											slot_name = merc:GetItemSlot(item)
											break
										else	
											local bag = merc.Squad and GetSquadBagInventory(merc.Squad)
											if bag then
												parts = bag:GetItem("Parts")
												if parts then
													mbag = bag
													slot_name = "Inventory"
												end	
												break
											end
										end
									end
									if parts then							
										parts.Amount = parts.Amount - self:ResolveValue("parts_per_step") 
										if parts.Amount<=0 then
											if m then
												m:RemoveItem(slot_name, parts)
												DoneObject(parts)
												ObjModified(m)
											end	
											if mbag then
												mbag:RemoveItem(slot_name,parts)
												DoneObject(parts)
												ObjModified(mbag)
											end
											parts = false
										end
										InventoryUIRespawn()
									else
										item.Condition = prev_cond
										item.repair_progress = prev_progress
										CombatLog("important", T{788054483744, "Not enough parts to continue <em><activity></em> Operation in sector <SectorName(sector)>.", sector = sector, activity = self.display_name})
										self:Complete(sector)
										gv_Sectors[sector.Id].sector_repair_items_queued = {}
										local queue = gv_Sectors[sector.Id].sector_repair_items_queued
										ObjModified(queue)
									end
									break
								end
							end
						end
					end
					-- unjam jammed weapon
					if item:IsWeapon() and item.jammed then
						item:RepairJammed(item.Condition, data and data.unit and gv_UnitData[data.unit])
					end
				end
			end,
			SortKey = 50,
			Tick = function (self, merc)
				return
			end,
			campaign = "FinalStand",
			description = T(862791644968, --[[ModItemSectorOperation FinalStandRepairItems description]] "Use mechanical parts to repair damaged equipment. High <em>Mechanical</em> stat will increase repair speed."),
			display_name = T(460264596686, --[[ModItemSectorOperation FinalStandRepairItems display_name]] "Repair Items"),
			group = "Final Stand Operations",
			icon = "UI/SectorOperations/T_Icon_Activity_Repair",
			id = "FinalStandRepairItems",
			image = "UI/Messages/Operations/repair_item",
			min_requirement_stat = "Mechanical",
			min_requirement_stat_value = 20,
			related_stat = "Mechanical",
			short_name = T(750535747873, --[[ModItemSectorOperation FinalStandRepairItems short_name]] "Repair"),
			sub_title = T(494961120795, --[[ModItemSectorOperation FinalStandRepairItems sub_title]] "Equipment needs repairs"),
		}),
		PlaceObj('ModItemSectorOperation', {
			Custom = false,
			GetOperationCost = function (self, merc, profession, idx)
				local sector = merc:GetSector()
				local loyalty = sector and GetCityLoyalty(sector.City) or 100
				local money_cost = self:ResolveValue("MoneyCostBase")
				if HasPerk(merc, "Negotiator") then
					local discount = CharacterEffectDefs.Negotiator:ResolveValue("discountPercent")
					money_cost = money_cost - MulDivRound(money_cost, discount, 100)
				end
				if loyalty>50 then
					money_cost = money_cost -  MulDivRound(money_cost,(loyalty-50) , 100)	
				end
				return {[1] = {value = money_cost, resource = "Money"}}
			end,
			GetSectorSlots = function (self, prof, sector)
				return 1
			end,
			HasOperation = function (self, sector)
				return false
			end,
			IsEnabled = function (self, sector)
				local mercs_available = GetAvailableMercs(sector, self)
				local prof = self.Professions[1]
				local mercs_current = GetOperationProfessionals(sector.Id, self.id, prof.id)
				if #mercs_available == 0 and #mercs_current == 0 then	
					return false, T{776447291880, "No <name> available", name = prof.display_name}
				end
				
				return true
			end,
			OnRemoveOperation = function (self, merc)
				local sector = merc:GetSector()
				local tbl = SetCraftOperationQueueTable(sector, self.id, {})
				SectorOperationValidateItemsToCraft(sector.Id, self.id, merc)
				ObjModified(tbl)
				sector.custom_operations[self.id] = nil
				if sector.started_operations and sector.started_operations[self.id] then
					NetSyncEvent("InterruptSectorOperation", sector.Id,self.id)				
				end
				SectorOperation_UpdateOnStop(self,{merc}, sector)
			end,
			OnSetOperation = function (self, merc, arg)
				local sector = merc:GetSector()
				local tbl = SetCraftOperationQueueTable(sector, self.id, {})
				SectorOperationValidateItemsToCraft(sector.Id, self.id, merc)
				SectorOperation_CraftTotalTime(sector.Id, self.id)
				ObjModified(tbl )
			end,
			Parameters = {
				PlaceObj('PresetParamNumber', {
					'Name', "PerTickProgress",
					'Value', 250,
					'Tag', "<PerTickProgress>",
				}),
				PlaceObj('PresetParamNumber', {
					'Name', "MoneyCostBase",
					'Value', 300,
					'Tag', "<MoneyCostBase>",
				}),
			},
			ProgressCompleteThreshold = function (self, merc, sector, prediction)
				if not merc then
					local mercs = GetOperationProfessionals(sector.Id, self.id)
					merc = mercs[1]
				end
				if not merc then return 0 end
				local stat = merc[self.related_stat]
				local calced_time = sector.custom_operations and sector.custom_operations[self.id] and sector.custom_operations[self.id].total_time or 0
				return calced_time
			end,
			ProgressCurrent = function (self, merc, sector, prediction)
				return  sector.custom_operations and sector.custom_operations[self.id] and sector.custom_operations[self.id].progress or -1
			end,
			ProgressPerTick = function (self, merc, prediction)
				if not merc then
					local mercs = GetOperationProfessionals(sector.Id, self.id)
					merc = mercs[1]
				end
				if not merc then return 0 end
				local progressPerTick = self:ResolveValue("PerTickProgress")
				if merc and HasPerk(merc, "JackOfAllTrades") then
					local mod = CharacterEffectDefs.JackOfAllTrades:ResolveValue("activityDurationMod")
					progressPerTick = progressPerTick + MulDivRound(progressPerTick, mod, 100)
				end
				if CheatEnabled("FastActivity") then
					progressPerTick = progressPerTick*100
				end
				
				return progressPerTick
			end,
			RequiredResources = {
				"Money",
			},
			SectorOperationStats = function (self, sector, check_only)
				local lines = {}				
				if self.min_requirement_stat and self.min_requirement_stat_value then
					local prop = table.find_value(UnitPropertiesStats:GetProperties(), "id", self.min_requirement_stat)
					if check_only then return true end
					lines[#lines + 1] = {text = T{300232421689, "Min Required <name>", name = prop.name}, value = T{139355455984, "<min_requirement_stat_value>",self}}					
				end
				return lines
			end,
			SortKey = 60,
			Tick = function (self, merc)
				local sector = merc:GetSector()
				local progress_per_tick = self:ProgressPerTick(merc)
				sector.custom_operations = sector.custom_operations or {}
				sector.custom_operations[self.id] = sector.custom_operations[self.id] or {}
				local prev_progress = (sector.custom_operations[self.id].progress or 0)
				sector.custom_operations[self.id].progress = prev_progress + progress_per_tick
				local cur_progress = sector.custom_operations[self.id].progress
				local queue = SectorOperationItems_GetItemsQueue(sector.Id, self.id) 
				local item_data
				local rem_progress 
				repeat
					if next(queue) then
						item_data = queue[1]
					end
					if not item_data then	
						self:Complete(sector)
						return
					end
					local mercs = gv_Squads[merc.Squad].units
					local recipe = CraftOperationsRecipes[item_data.recipe]
					local cur = sector.custom_operations[self.id].item_id
					if not cur or cur~=item_data.item_id then
						sector.custom_operations[self.id].item_id = item_data.item_id
						sector.custom_operations[self.id].item_id_start = rem_progress and rem_progress>0 and rem_progress or prev_progress
						rem_progress = 0
						-- get items
						for _, ingrd in ipairs(recipe.Ingredients) do
							--local result, results = InventoryFindItemInMercs(mercs, ingrd.item, ingrd.amount)
							local rem = TakeItemFromMercs(mercs, ingrd.item, ingrd.amount)
							if rem>0 then
								sector.custom_operations[self.id].item_id = false
								sector.custom_operations[self.id].item_id_start = 0
								CombatLog("important", T{788054483744, "Not enough parts to continue <em><activity></em> Operation in sector <SectorName(sector)>.", sector = sector, activity = self.display_name})
								self:Complete(sector)
								merc:SetCurrentOperation("Idle")
								return
							end
						end
					end	
					local cur_item_time =  SectorOperation_CraftItemTime(sector.Id,self.id,item_data.recipe )	
					if sector.custom_operations[self.id].item_id_start and cur_progress>=sector.custom_operations[self.id].item_id_start + cur_item_time then
						local used_time = sector.custom_operations[self.id].item_id_start + cur_item_time
						sector.custom_operations[self.id].item_id_start = 0
						sector.custom_operations[self.id].item_id = false
						local item = PlaceInventoryItem(recipe.ResultItem.item)
						if IsKindOf(item,"InventoryStack") then
							item.Amount = recipe.ResultItem.amount
						end	
						local items =  {item}
						AddItemsToSquadBag(merc.Squad, items)
						for idx, m in ipairs(mercs) do
							if #items<=0 then break end
							local unit = gv_UnitData[m]
							unit:AddItemsToInventory(items)
						end
						-- update queue
						rem_progress = used_time
						local tbl = GetCraftOperationQueueTable(gv_Sectors[sector.Id], self.id)
						table.remove(tbl, 1)			
						SetCraftOperationQueueTable(gv_Sectors[sector.Id], self.id, tbl)
						--SectorOperation_ItemsUpdateItemLists()
					end		
				until not next(queue) or (not rem_progress or rem_progress<=0)		
				self:CheckCompleted(merc, sector)
			end,
			campaign = "FinalStand",
			group = "Final Stand Operations",
			icon = "UI/SectorOperations/T_Icon_Activity_Repair",
			id = "FinalStandCraftCommonBase",
			image = "UI/Messages/Operations/craft_ammo",
			min_requirement_stat = "Explosives",
			min_requirement_stat_value = 50,
			related_stat = "Explosives",
		}),
		PlaceObj('ModItemSectorOperation', {
			Custom = false,
			GetOperationCost = function (self, merc, profession, idx)
				return SectorOperations["CraftCommonBase"].GetOperationCost(self, merc,profession, idx)
			end,
			GetSectorSlots = function (self, prof, sector)
				return 1
			end,
			HasOperation = function (self, sector)
				return sector.RepairShop
			end,
			IsEnabled = function (self, sector)
				return SectorOperations["CraftCommonBase"].IsEnabled(self, sector)
			end,
			OnRemoveOperation = function (self, merc)
				SectorOperations["CraftCommonBase"].OnRemoveOperation(self, merc)
			end,
			OnSetOperation = function (self, merc, arg)
				SectorOperations["CraftCommonBase"].OnSetOperation(self, merc, arg)
			end,
			Parameters = {
				PlaceObj('PresetParamNumber', {
					'Name', "PerTickProgress",
					'Value', 250,
					'Tag', "<PerTickProgress>",
				}),
				PlaceObj('PresetParamNumber', {
					'Name', "MoneyCostBase",
					'Value', 300,
					'Tag', "<MoneyCostBase>",
				}),
			},
			Professions = {
				PlaceObj('SectorOperationProfession', {
					'id', "Crafter",
					'display_name', T(247523611069, --[[ModItemSectorOperation FinalStandCraftAmmo display_name]] "Crafter"),
					'display_name_all_caps', T(527457075803, --[[ModItemSectorOperation FinalStandCraftAmmo display_name_all_caps]] "CRAFTER"),
					'display_name_plural', T(784763390799, --[[ModItemSectorOperation FinalStandCraftAmmo display_name_plural]] "Crafters"),
					'display_name_plural_all_caps', T(613290822561, --[[ModItemSectorOperation FinalStandCraftAmmo display_name_plural_all_caps]] "CRAFTERS"),
				}),
			},
			ProgressCompleteThreshold = function (self, merc, sector, prediction)
				return SectorOperations["CraftCommonBase"].ProgressCompleteThreshold(self, merc,sector, prediction)
			end,
			ProgressCurrent = function (self, merc, sector, prediction)
				return SectorOperations["CraftCommonBase"].ProgressCurrent(self, merc,sector, prediction)
			end,
			ProgressPerTick = function (self, merc, prediction)
				return SectorOperations["CraftCommonBase"].ProgressPerTick(self, merc, prediction)
			end,
			RequiredResources = {
				"Money",
				"Parts",
			},
			SectorOperationStats = function (self, sector, check_only)
				return SectorOperations["CraftCommonBase"].SectorOperationStats(self, sector, check_only)
			end,
			SortKey = 53,
			Tick = function (self, merc)
				return SectorOperations["CraftCommonBase"].Tick(self, merc)
			end,
			campaign = "FinalStand",
			description = T(824310584176, --[[ModItemSectorOperation FinalStandCraftAmmo description]] "Use mechanical Parts and other components to craft different types of ammo. High <em>Explosives</em> stat will increase crafting speed."),
			display_name = T(362673516635, --[[ModItemSectorOperation FinalStandCraftAmmo display_name]] "Craft Ammo"),
			group = "Final Stand Operations",
			icon = "UI/SectorOperations/T_Icon_Activity_Craft_Ammo",
			id = "FinalStandCraftAmmo",
			image = "UI/Messages/Operations/craft_ammo",
			min_requirement_stat = "Explosives",
			min_requirement_stat_value = 50,
			related_stat = "Explosives",
			short_name = T(968709845383, --[[ModItemSectorOperation FinalStandCraftAmmo short_name]] "Craft"),
		}),
		PlaceObj('ModItemSectorOperation', {
			Custom = false,
			GetOperationCost = function (self, merc, profession, idx)
				return SectorOperations["CraftCommonBase"].GetOperationCost(self, merc,profession, idx)
			end,
			GetSectorSlots = function (self, prof, sector)
				return 1
			end,
			HasOperation = function (self, sector)
				return sector.RepairShop
			end,
			IsEnabled = function (self, sector)
				return SectorOperations["CraftCommonBase"].IsEnabled(self, sector)
			end,
			OnRemoveOperation = function (self, merc)
				SectorOperations["CraftCommonBase"].OnRemoveOperation(self, merc)
			end,
			OnSetOperation = function (self, merc, arg)
				SectorOperations["CraftCommonBase"].OnSetOperation(self, merc, arg)
			end,
			Parameters = {
				PlaceObj('PresetParamNumber', {
					'Name', "PerTickProgress",
					'Value', 250,
					'Tag', "<PerTickProgress>",
				}),
				PlaceObj('PresetParamNumber', {
					'Name', "MoneyCostBase",
					'Value', 300,
					'Tag', "<MoneyCostBase>",
				}),
			},
			Professions = {
				PlaceObj('SectorOperationProfession', {
					'id', "Crafter",
					'display_name', T(375781920584, --[[ModItemSectorOperation FinalStandCraftExplosives display_name]] "Crafter"),
					'display_name_all_caps', T(737201236845, --[[ModItemSectorOperation FinalStandCraftExplosives display_name_all_caps]] "CRAFTER"),
					'display_name_plural', T(175816447317, --[[ModItemSectorOperation FinalStandCraftExplosives display_name_plural]] "Crafters"),
					'display_name_plural_all_caps', T(900073720120, --[[ModItemSectorOperation FinalStandCraftExplosives display_name_plural_all_caps]] "CRAFTERS"),
				}),
			},
			ProgressCompleteThreshold = function (self, merc, sector, prediction)
				return SectorOperations["CraftCommonBase"].ProgressCompleteThreshold(self, merc,sector, prediction)
			end,
			ProgressCurrent = function (self, merc, sector, prediction)
				return SectorOperations["CraftCommonBase"].ProgressCurrent(self, merc,sector, prediction)
			end,
			ProgressPerTick = function (self, merc, prediction)
				return SectorOperations["CraftCommonBase"].ProgressPerTick(self, merc, prediction)
			end,
			RequiredResources = {
				"Money",
				"Parts",
			},
			SectorOperationStats = function (self, sector, check_only)
				return SectorOperations["CraftCommonBase"].SectorOperationStats(self, sector, check_only)
			end,
			SortKey = 56,
			Tick = function (self, merc)
				return SectorOperations["CraftCommonBase"].Tick(self, merc)
			end,
			campaign = "FinalStand",
			description = T(778094050728, --[[ModItemSectorOperation FinalStandCraftExplosives description]] "Use mechanical Parts and other components to craft different types of explosives. High <em>Explosives</em> stat will increase crafting speed."),
			display_name = T(863032822757, --[[ModItemSectorOperation FinalStandCraftExplosives display_name]] "Craft Explosives"),
			group = "Final Stand Operations",
			icon = "UI/SectorOperations/T_Icon_Activity_Craft_Explosives",
			id = "FinalStandCraftExplosives",
			image = "UI/Messages/Operations/craft_explosives",
			min_requirement_stat = "Explosives",
			min_requirement_stat_value = 50,
			related_stat = "Explosives",
			short_name = T(382517489837, --[[ModItemSectorOperation FinalStandCraftExplosives short_name]] "Craft"),
		}),
		PlaceObj('ModItemSectorOperation', {
			Complete = function (self, sector)
				local stat = sector.training_stat
				local prop_meta = table.find_value(UnitPropertiesStats:GetProperties(), "id", stat)
				local stat_name = prop_meta.name	
				
				local mercs = GetOperationProfessionals(sector.Id, self.id, "Student")
				
				local merc_names = {}		
				for _, merc in ipairs(mercs) do	
					if merc.stat_learning then
						local learning_data = merc.stat_learning[stat] or empty_table
						local up_levels  = learning_data.up_levels or 0
						local progress = learning_data.progress or 0
						merc_names[up_levels] = merc_names[up_levels] or  {} 
						table.insert(merc_names[up_levels],merc.Nick)	
						if merc.stat_learning[stat] then
							merc.stat_learning[stat].up_levels = 0
						end
					end
				end
				
				local mercs = GetOperationProfessionals(sector.Id, self.id)
				for _, merc in ipairs(mercs) do
					merc:SetCurrentOperation("Idle")			
				end
				self:OnComplete(sector, mercs)
				if next (merc_names) then
					CombatLog("important", T{449926986206, "<stat_name> Training (<sector_id>) finished.",stat_name = stat_name, sector_id = GetSectorName(sector)})
					for up_levels, names in sorted_pairs(merc_names) do
						if up_levels == 0 then
							CombatLog("important", T{964788160766, "<merc_names> improved but not enough to gain a stat increase.", merc_names = ConcatListWithAnd(names) })
						else
							CombatLog("important", T{124938068325, "<em><unit></em> gained +<amount> <em><stat></em>",stat = stat_name, amount = Untranslated(up_levels), unit = ConcatListWithAnd(names)})
						end
					end					
				end
				Msg("OperationCompleted", self, mercs, sector)
			end,
			Custom = false,
			FilterAvailable = function (self, merc, profession)
				local sector = merc:GetSector()
				local stat = sector.training_stat
				if stat and profession == "Student" then
					if HasPerk(merc, "OldDog") then return false end
					local teachers = GetOperationProfessionals(sector.Id, self.id, "Teacher")
					local teacher = teachers[1]
					local solo = not teacher
					--if not teacher then return false end
					local max_learned_stat = self:ResolveValue("max_learned_stat")
					local teacher_stat = teacher and teacher[stat] or  self:ResolveValue("SoloTrainingStat")
					return  teacher_stat>merc[stat] and merc[stat]<=max_learned_stat
				else-- teacher
					local students = GetOperationProfessionals(sector.Id, self.id, "Student")
					for i_, st in ipairs(students) do
						if stat and st[stat] and merc[stat] and st[stat]>=merc[stat] then
							return false
						end	
					end
					return stat and  merc[stat] >= self.min_requirement_stat_value
				end
			end,
			GetRelatedStat = function (self, merc)
				local sector =  merc:GetSector()
				local stat = sector.training_stat
				if stat then
					return stat, merc[stat]
				end
			end,
			GetSectorSlots = function (self, prof, sector)
				if prof == "Student" then
					return  -1
				end
				return 1
			end,
			GetTimelineEventDescription = function (self, sector_id, eventcontext)
				local teachers, students
				local evmercs, prof
				if eventcontext.mercs then
					evmercs = table.map(eventcontext.mercs, function(id) return gv_UnitData[id].Nick end)
					prof = eventcontext.profession
				end
				local mercs = GetOperationProfessionalsGroupedByProfession(sector_id, self.id)
				local solo = not  next(mercs["Teacher"] )
				if prof then
					if prof=="Teacher" then
						teachers = evmercs 
						students = mercs["Student"]
						students = table.map(students, "Nick")
					else
						teachers = mercs["Teacher"]
						teachers = table.map(teachers, "Nick")
						students = evmercs
					end
				else
					students = mercs["Student"]
					students = table.map(students, "Nick")
					teachers = mercs["Teacher"]
					teachers = table.map(teachers, "Nick")
				end
				students = ConcatListWithAnd(students or empty_table)
				teachers = ConcatListWithAnd(teachers or empty_table)
				if solo then
					return T{178030548891, " <em><students></em> will finish training.", students = students}
				else
					return T{793160161691, "<em><teachers></em> will finish training <em><students></em>.", teachers = teachers, students = students}
				end
			end,
			HasOperation = function (self, sector)
				return true
			end,
			IsEnabled = function (self, sector)
				return true
			end,
			OnRemoveOperation = function (self, merc)
				merc.training_activity_progress = 0
			end,
			OnSetOperation = function (self, merc, arg)
				merc.training_activity_progress = 0
				if merc.OperationProfession=="Student" then
					local sector = merc:GetSector()
					local stat = sector.training_stat
					if merc.stat_learning and merc.stat_learning[stat] then
						merc.stat_learning[stat].up_levels = 0
					end
					return  merc.stat_learning and merc.stat_learning[stat] and merc.stat_learning[stat].progress or 0
				end
				RecalcOperationETAs(merc:GetSector(), "TrainMercs")		
			end,
			Parameters = {
				PlaceObj('PresetParamNumber', {
					'Name', "ActivityDurationInHoursFull",
					'Value', 48,
					'Tag', "<ActivityDurationInHoursFull>",
				}),
				PlaceObj('PresetParamNumber', {
					'Name', "PerTickProgress",
					'Value', 400,
					'Tag', "<PerTickProgress>",
				}),
				PlaceObj('PresetParamNumber', {
					'Name', "learning_speed",
					'Value', 250,
					'Tag', "<learning_speed>",
				}),
				PlaceObj('PresetParamNumber', {
					'Name', "wisdow_weight",
					'Value', 50,
					'Tag', "<wisdow_weight>",
				}),
				PlaceObj('PresetParamNumber', {
					'Name', "learning_base_bonus",
					'Value', 25,
					'Tag', "<learning_base_bonus>",
				}),
				PlaceObj('PresetParamNumber', {
					'Name', "max_learned_stat",
					'Value', 90,
					'Tag', "<max_learned_stat>",
				}),
				PlaceObj('PresetParamNumber', {
					'Name', "SoloTrainingStat",
					'Value', 80,
					'Tag', "<SoloTrainingStat>",
				}),
				PlaceObj('PresetParamPercent', {
					'Name', "SoloTrainingSpeedModifier",
					'Value', 300,
					'Tag', "<SoloTrainingSpeedModifier>%",
				}),
			},
			Professions = {
				PlaceObj('SectorOperationProfession', {
					'id', "Teacher",
					'display_name', T(447829238056, --[[ModItemSectorOperation FinalStandTrainMercs display_name]] "Teacher"),
					'description', T(113623886116, --[[ModItemSectorOperation FinalStandTrainMercs description]] "The Teacher will help the Students learn the selected skill."),
					'display_name_all_caps', T(325517340288, --[[ModItemSectorOperation FinalStandTrainMercs display_name_all_caps]] "TEACHER"),
					'display_name_plural', T(429155042796, --[[ModItemSectorOperation FinalStandTrainMercs display_name_plural]] "Teachers"),
					'display_name_plural_all_caps', T(842440864449, --[[ModItemSectorOperation FinalStandTrainMercs display_name_plural_all_caps]] "TEACHERS"),
				}),
				PlaceObj('SectorOperationProfession', {
					'id', "Student",
					'display_name', T(704342993735, --[[ModItemSectorOperation FinalStandTrainMercs display_name]] "Student"),
					'description', T(283488372790, --[[ModItemSectorOperation FinalStandTrainMercs description]] "Students train a selected attribute over time. The higher the attribute the more time it takes to increase it."),
					'display_name_all_caps', T(142860249427, --[[ModItemSectorOperation FinalStandTrainMercs display_name_all_caps]] "STUDENT"),
					'display_name_plural', T(180186165761, --[[ModItemSectorOperation FinalStandTrainMercs display_name_plural]] "Students"),
					'display_name_plural_all_caps', T(360401564187, --[[ModItemSectorOperation FinalStandTrainMercs display_name_plural_all_caps]] "STUDENTS"),
				}),
			},
			ProgressCompleteThreshold = function (self, merc, sector, prediction)
				--2 days,each tick is in 15min => 48*4 and scale 1000
				return self:ResolveValue("ActivityDurationInHoursFull")*4*self:ResolveValue("PerTickProgress")
			end,
			ProgressCurrent = function (self, merc, sector, prediction)
				if not merc then
					local mercs = GetOperationProfessionals(sector.Id, self.id, "Teacher") or GetOperationProfessionals(sector.Id, self.id, "Student")
					merc = mercs[1]	
				end	
				return merc and merc.training_activity_progress or 0
			end,
			ProgressPerTick = function (self, merc, prediction)
				local progressPerTick = self:ResolveValue("PerTickProgress")
				if merc and HasPerk(merc, "JackOfAllTrades") then
					local mod = CharacterEffectDefs.JackOfAllTrades:ResolveValue("activityDurationMod")
					progressPerTick = progressPerTick + MulDivRound(progressPerTick, mod, 100)
				end
				if CheatEnabled("FastActivity") then
					progressPerTick = progressPerTick*100
				end
				
				return progressPerTick
			end,
			SectorMercsTick = function (self, merc)
				local sector = merc:GetSector()
				local teacher = GetOperationProfessionals(sector.Id, self.id, "Teacher")
				local solo = not teacher
				local progress_per_tick = self:ProgressPerTick(teacher and teacher[1])
				local to_complete 
				merc.training_activity_progress = merc.training_activity_progress + progress_per_tick
				to_complete = self:ProgressCurrent(merc, sector) >= self:ProgressCompleteThreshold(merc, sector)
				merc.training_activity_progress = merc.training_activity_progress - progress_per_tick
				
				-- solo trianing
				--[[
				if not to_complete then
					local teachers = GetOperationProfessionals(sector.Id, self.id, "Teacher")
					if  not next(teachers) then
						to_complete = true 
					end
				end
				--]]
				if not to_complete then
					local students = GetOperationProfessionals(sector.Id, self.id, "Student")
					if not next(students) then
						to_complete = true
					end
				end
				-- call all mercs tick and complete after that		
				local mercs = GetOperationProfessionals(sector.Id, self.id)
				table.insert_unique(mercs, merc)
				for _, m in ipairs( mercs) do
					if to_complete then
						self:Tick(m)
					end
					m.training_activity_progress = m.training_activity_progress + progress_per_tick
				end
				if to_complete then
					self:Complete(sector)
				end
			end,
			SortKey = 40,
			Tick = function (self, merc)
				--Learning speed parameter defines the treshold of how much must be gained to gain 1 in a stat. Bigger number means slower.
				
				local sector = merc:GetSector()
				local stat = sector.training_stat
				if self:ProgressCurrent(merc, sector) >= self:ProgressCompleteThreshold(merc, sector) then
					return 
				end	
				local max_learned_stat = self:ResolveValue("max_learned_stat")
				local solo = false
				if merc.OperationProfession=="Student" then
					local teachers = GetOperationProfessionals(sector.Id, self.id, "Teacher")
					local teacher = teachers[1]
					solo = not  teacher
					local teacher_stat = teacher and teacher[stat] or  self:ResolveValue("SoloTrainingStat")
					local is_learned_max = merc[stat]>=teacher_stat or merc[stat]>max_learned_stat
					if is_learned_max then
						merc:SetCurrentOperation("Idle")
						return
					end
				end
				local solo_student =  solo and merc.OperationProfession=="Student"
				if merc.OperationProfession=="Teacher" or solo_student then
					-- teacher
					local students = GetOperationProfessionals(sector.Id, self.id, "Student")
					local t_stat = merc[stat] 
					if solo_student  then
						t_stat = self:ResolveValue("SoloTrainingStat")
						students = {merc}
					end
					for _, student in ipairs(students) do
						local is_learned_max = student[stat]>=t_stat or student[stat]>max_learned_stat
						if not is_learned_max then
							student.stat_learning = student.stat_learning or {}
							local progressPerTick = MulDivRound(t_stat,100 + merc.Leadership, 100) + self:ResolveValue("learning_base_bonus") 
							if HasPerk(merc, "Teacher") then
								local bonusPercent = CharacterEffectDefs.Teacher:ResolveValue("MercTrainingBonus")
								progressPerTick = progressPerTick + MulDivRound(progressPerTick, bonusPercent, 100)
							end			
							if solo_student then
								progressPerTick = MulDivRound(progressPerTick ,100, self:ResolveValue("SoloTrainingSpeedModifier"))--  training speed for solo practice should be 300% slower (3 times slower) 
							end
							if IsGameRuleActive("HardLessons") then
								progressPerTick = progressPerTick - MulDivRound(progressPerTick,GameRuleDefs.HardLessons:ResolveValue("TrainMercModifier"), 100)--  slow the attribute increase from training operation by 40%. 
							end
							student.stat_learning[stat] = student.stat_learning[stat] or {progress = 0, up_levels = 0}
							local learning_progress = student.stat_learning[stat].progress
							learning_progress = learning_progress + progressPerTick
							
							local progress_threshold = self:ResolveValue("learning_speed")*student[stat]*(100+self:ResolveValue("wisdow_weight") - Max(0,(student.Wisdom-50)*2))/100 
							if learning_progress >= progress_threshold then
								local gainAmount = 1
								local modId = string.format("StatTraining-%s-%s-%d", stat, student.session_id, GetPreciseTicks())
								GainStat(student, stat, gainAmount, modId, "Training")
					
								PlayVoiceResponse(student, "TrainingReceived")
								--CombatLog("important",T{424323552240, "<merc_nickname> gained +1 <stat_name> from training in <sector_id>", stat_name = stat_name, merc_nickname  =  student.Nick, sector_id = Untranslated(sector.Id)})
								learning_progress = 0
								student.stat_learning[stat].up_levels = student.stat_learning[stat].up_levels + 1
							end
							student.stat_learning[stat].progress = learning_progress
						end
					end
				end
				local students = GetOperationProfessionals(sector.Id, self.id, "Student")
				if not next(students) then
				--	self:Complete(sector)
					return
				end
			end,
			campaign = "FinalStand",
			description = T(582185757888, --[[ModItemSectorOperation FinalStandTrainMercs description]] "Assign a Trainer to improve the stats of the other mercs. The trainer must have a higher stat than the trained mercs. Practicing without a teacher is considerably slower and can't improve stats beyond a certain point."),
			display_name = T(697571699391, --[[ModItemSectorOperation FinalStandTrainMercs display_name]] "Train mercs"),
			group = "Final Stand Operations",
			icon = "UI/SectorOperations/T_Icon_Activity_TrainingMercs_Teacher",
			id = "FinalStandTrainMercs",
			image = "UI/Messages/Operations/train_merc",
			min_requirement_stat_value = 50,
			short_name = T(244796174105, --[[ModItemSectorOperation FinalStandTrainMercs short_name]] "Training"),
			sub_title = T(808099115467, --[[ModItemSectorOperation FinalStandTrainMercs sub_title]] "Spend some time to improve merc stats"),
		}),
		PlaceObj('ModItemSectorOperation', {
			CanPerformOperationBase = function (self, merc, profession)
				local cost = self:GetOperationCost(merc, profession)
				
				if CanPayOperation(cost, merc:GetSector()) then
					return "OperationResourceError", {activity = self.display_name}
				elseif merc:IsTravelling() then
					return "OperationTravelError", {activity = self.display_name}
				elseif self.RequiredItem and not merc:HasItem(self.RequiredItem) then
					return "OperationMissingItemError", {activity = self.display_name, item = InventoryItemDefs[self.RequiredItem].DisplayName}
				end
			end,
			Complete = function (self, sector)
				local mercs = GetOperationProfessionals(sector.Id, self.id)
				local merc_names = {}
				for _, merc in ipairs(mercs) do
					merc_names[#merc_names + 1] = merc.Nick
					merc:SetCurrentOperation("Idle")
				end
				self:OnComplete(sector, mercs)
				if next(merc_names) then
					CombatLog("important", T{258083168009, "<em><mercs></em> completed <em><activity></em> in <SectorName(sector)>", mercs = ConcatListWithAnd(merc_names),activity = self.display_name, sector = sector})
				end
				Msg("OperationCompleted", self, mercs, sector)
			end,
			Custom = false,
			GetAssignMessage = function (self, nameCombination, costTexts)
				costTexts = table.concat(costTexts, T(642697486575, ", "))
				return T{253336352123, "Training the locals to fight will require some additional funds. Do you want to pay <costTexts>", names = nameCombination, costTexts = costTexts}
			end,
			GetOperationCost = function (self, merc, profession, idx)
				local sector = merc:GetSector()
				local other = GetOperationProfessionals(sector.Id, self.id, false, merc.session_id) 
				if sector.militia_training and #other>0 and idx~="refund" then
					return {}
				end
				local cost = sector and sector.MilitiaTrainingCost
				if HasPerk(merc, "Negotiator") then
					local discount = CharacterEffectDefs.Negotiator:ResolveValue("discountPercent")
					cost = cost - MulDivRound(cost, discount, 100)
				end
				local loyalty = sector and GetCityLoyalty(sector.City) or 100
				local diff = cost * self:ResolveValue("min_loyalty_cost_mul") - cost
				return {[1] = {value = cost + (100 - loyalty) * diff / 100, resource = "Money", min = true}}
			end,
			GetSectorSlots = function (self, prof)
				return 2
			end,
			GetTimelineEventDescription = function (self, sector_id, eventcontext)
				local mercs
				local professionId = self.Professions and self.Professions[1] and self.Professions[1].id
				if eventcontext.mercs then
					mercs = table.map(eventcontext.mercs, function(id) return gv_UnitData[id].Nick end)
				else
					mercs = GetOperationProfessionalsGroupedByProfession(sector_id, self.id)
					mercs = table.map(professionId and mercs[professionId] or mercs, "Nick")
				end
				mercs = ConcatListWithAnd(mercs)
				return T{342825966200, "<em><mercs></em> will finish training militia.", mercs = mercs}
			end,
			HasOperation = function (self, sector)
				return sector.Militia
			end,
			IsEnabled = function (self, sector)
				if GetFinalStandFriendlyFaction(true) ~= "Militia" then
					return false , T(206699067234, "Only Militia Faction can train militia")
				end
				
				local militia_squad_id = sector.militia_squad_id 
				if not militia_squad_id then return true end
				local militia_squad = gv_Squads[militia_squad_id]
				if #(militia_squad.units or "") < sector.MaxMilitia then return true end	
				
				local ud = GetLeastExpMilitia(militia_squad.units)
				local least_exp_templ = ud and ud.class
				if least_exp_templ == "MilitiaVeteran" or least_exp_templ=="MilitiaElite" then 
					return false , T(764949488129, "Reached militia limit")
				end
				return true
			end,
			ModifyProgress = function (self, value, sector)
				sector.militia_training_progress = sector.militia_training_progress + value
			end,
			OnComplete = function (self, sector, mercs)
				CompleteCurrentMilitiaTraining(sector, mercs)
				sector.militia_training_progress = 0
			end,
			OnRemoveOperation = function (self, merc)
				local sector = merc:GetSector()
				local workers = GetOperationProfessionals(sector.Id, self.id, false, merc.session_id) or {}
				local last = #workers<=0
				if last then
					sector.militia_training_payed_cost = false
					sector.militia_training = false
				end
			end,
			OnSetOperation = function (self, merc, arg)
				local sector = merc:GetSector()
				if not sector.militia_training then
					sector.militia_training = true
				end
			end,
			Parameters = {
				PlaceObj('PresetParamNumber', {
					'Name', "min_progress",
					'Value', 10,
					'Tag', "<min_progress>",
				}),
				PlaceObj('PresetParamNumber', {
					'Name', "max_progress",
					'Value', 25,
					'Tag', "<max_progress>",
				}),
				PlaceObj('PresetParamNumber', {
					'Name', "min_loyalty_cost_mul",
					'Value', 3,
					'Tag', "<min_loyalty_cost_mul>",
				}),
			},
			Professions = {
				PlaceObj('SectorOperationProfession', {
					'id', "Trainer",
					'display_name', T(613489902900, --[[ModItemSectorOperation FinalStandMilitiaTraining display_name]] "Trainer"),
					'description', T(995197575478, --[[ModItemSectorOperation FinalStandMilitiaTraining description]] "The Trainer is working with the locals turning them into Militia troops."),
					'display_name_all_caps', T(283157718014, --[[ModItemSectorOperation FinalStandMilitiaTraining display_name_all_caps]] "TRAINER"),
					'display_name_plural', T(130677349829, --[[ModItemSectorOperation FinalStandMilitiaTraining display_name_plural]] "Trainers"),
					'display_name_plural_all_caps', T(995244726729, --[[ModItemSectorOperation FinalStandMilitiaTraining display_name_plural_all_caps]] "TRAINERS"),
				}),
			},
			ProgressCompleteThreshold = function (self, merc)
				return const.Satellite.MilitiaTrainingThreshold
			end,
			ProgressCurrent = function (self, merc, sector)
				return sector.militia_training_progress or 0
			end,
			ProgressPerTick = function (self, merc, prediction)
				local sector = merc:GetSector()
				local min_progress = self:ResolveValue("min_progress")
				local max_progress = self:ResolveValue("max_progress")
				local progress = min_progress + (merc.Leadership) * (max_progress - min_progress) / 100
				if HasPerk(merc, "Teacher") then
					local trainingBonusPercent = CharacterEffectDefs.Teacher:ResolveValue("MilitiaTrainingBonusPercent") 
					progress = progress + MulDivRound(progress, trainingBonusPercent, 100)
				end
				if HasPerk(merc, "JackOfAllTrades") then
					local mod = CharacterEffectDefs.JackOfAllTrades:ResolveValue("activityDurationMod")
					progress = progress + MulDivRound(progress, mod, 100)
				end
				return progress
			end,
			RequiredResources = {
				"Money",
			},
			SectorOperationStats = function (self, sector, check_only)
				if check_only then return true end
				
				local lines = {}
				lines[#lines + 1] = {text = T(231988048655, "City Loyalty"), value = T{257328164584, "<percent(value)>", value = sector.City ~= "none" and gv_Cities[sector.City].Loyalty or 0}}
				local progressVal = MulDivRound(sector.militia_training_progress, 100, self:ProgressCompleteThreshold())
					
				local militia_squad_id = sector.militia_squad_id 	
				local militia_squad = militia_squad_id and gv_Squads[militia_squad_id]
				lines[#lines + 1] = {text = T(718591666122, "Active Militia"), value  = T{702630905213, "<current>/<max>", current =  #(militia_squad and militia_squad.units or ""), max =sector.MaxMilitia }}
				
				return lines, progressVal
			end,
			ShowPauseProgress = true,
			SortKey = 30,
			campaign = "FinalStand",
			description = T(895343657988, --[[ModItemSectorOperation FinalStandMilitiaTraining description]] "Whip the civilian population into shape, turning them into a local Militia able to defend against hostile troops. Picking a Trainer with high <em>Leadership</em> and a high <em>Loyalty</em> of the local population both contribute to faster training."),
			display_name = T(655156765018, --[[ModItemSectorOperation FinalStandMilitiaTraining display_name]] "Militia Training"),
			group = "Final Stand Operations",
			icon = "UI/SectorOperations/T_Icon_Activity_TrainingMilitia",
			id = "FinalStandMilitiaTraining",
			image = "UI/Messages/Operations/train_militia",
			log_msg_start = T(709495322375, --[[ModItemSectorOperation FinalStandMilitiaTraining log_msg_start]] "<em><mercs></em> started <em>training Militia</em> in <SectorName(sector)>"),
			param_bindings = {},
			related_stat = "Leadership",
			short_name = T(566332231591, --[[ModItemSectorOperation FinalStandMilitiaTraining short_name]] "Militia"),
			sub_title = T(624762689807, --[[ModItemSectorOperation FinalStandMilitiaTraining sub_title]] "Militia training is available"),
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
				'name', "UIPresets",
				'comment', "Holds Template presets that use to generate actual template presets in UI.lua",
				'CodeFileName', "Code/UIPresets.lua",
			}),
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
	PlaceObj('ModItemUnitDataCompositeDef', {
		'Group', "MercenariesOld",
		'Id', "TestF",
		'object_class', "UnitData",
		'Health', 85,
		'Agility', 76,
		'Dexterity', 93,
		'Strength', 68,
		'Wisdom', 78,
		'Leadership', 19,
		'Marksmanship', 94,
		'Mechanical', 5,
		'Explosives', 5,
		'Medical', 17,
		'Portrait', "UI/MercsPortraits/Raven",
		'BigPortrait', "UI/Mercs/Raven",
		'IsMercenary', true,
		'Name', T(775277976996, --[[ModItemUnitDataCompositeDef TestF Name]] "TEST F"),
		'Nick', T(736472653747, --[[ModItemUnitDataCompositeDef TestF Nick]] "Raven"),
		'AllCapsNick', T(696993136295, --[[ModItemUnitDataCompositeDef TestF AllCapsNick]] "RAVEN"),
		'Bio', T(943289334891, --[[ModItemUnitDataCompositeDef TestF Bio]] "While husband Ron and others kept Somali pirates attempting to board their cruise ship pinned down, Raven used the cover of night to systematically kill one after another using controlled bursts from a captured automatic rifle. A formidable markswoman with nerves of steel, Raven prefers to work alongside her husband but is an asset to any team that is looking to maintain a high standard of excellence and esprit de corps."),
		'Nationality', "USA",
		'Title', T(943286403870, --[[ModItemUnitDataCompositeDef TestF Title]] "Never More Badass"),
		'Email', T(619154713379, --[[ModItemUnitDataCompositeDef TestF Email]] "nevermore@aim.com"),
		'snype_nick', T(783026836966, --[[ModItemUnitDataCompositeDef TestF snype_nick]] "nevermore"),
		'Refusals', {
			PlaceObj('MercChatRefusal', {
				'Lines', {
					PlaceObj('ChatMessage', {
						'Text', T(328855564136, --[[ModItemUnitDataCompositeDef TestF Text MercChatRefusal Lines ChatMessage voice:TestF]] "I don't think I'm up to anything after Ron's death. Sorry, I need time to spend with my dogs and to grieve. Don't contact me again."),
					}),
				},
				'Conditions', {
					PlaceObj('UnitHireStatus', {
						Status = "Dead",
						TargetUnit = "Raider",
					}),
				},
			}),
			PlaceObj('MercChatRefusal', {
				'Lines', {
					PlaceObj('ChatMessage', {
						'Text', T(747999319859, --[[ModItemUnitDataCompositeDef TestF Text MercChatRefusal Lines ChatMessage voice:TestF]] "Your bank statement looks... lacking. I need to be sure I will get paid. I'm not in this just for the thrills, you know."),
					}),
				},
				'Conditions', {
					PlaceObj('MercChatConditionMoney', {}),
				},
			}),
		},
		'Haggles', {
			PlaceObj('MercChatHaggle', {
				'Lines', {
					PlaceObj('ChatMessage', {
						'Text', T(407540800841, --[[ModItemUnitDataCompositeDef TestF Text MercChatHaggle Lines ChatMessage voice:TestF]] "I don't know much about you. In fact, I don't know anything about you. "),
					}),
					PlaceObj('ChatMessage', {
						'Text', T(187341630244, --[[ModItemUnitDataCompositeDef TestF Text MercChatHaggle Lines ChatMessage voice:TestF]] "This means I must charge you a higher fee in case you turn out to be incompetent. "),
					}),
				},
				'Conditions', {
					PlaceObj('MercChatConditionRehire', {}),
				},
				'chanceToRoll', 20,
			}),
		},
		'Mitigations', {
			PlaceObj('MercChatMitigation', {
				'Lines', {
					PlaceObj('ChatMessage', {
						'Text', T(602523900358, --[[ModItemUnitDataCompositeDef TestF Text MercChatMitigation Lines ChatMessage voice:TestF]] "If my husband will work for you, so will I."),
					}),
					PlaceObj('ChatMessage', {
						'Text', T(619214845944, --[[ModItemUnitDataCompositeDef TestF Text MercChatMitigation Lines ChatMessage voice:TestF]] "Let's do it."),
					}),
				},
				'Conditions', {
					PlaceObj('UnitHireStatus', {
						Status = "Hired",
						TargetUnit = "Raider",
					}),
				},
				'chanceToRoll', 100,
			}),
		},
		'ExtraPartingWords', {
			PlaceObj('MercChatBranch', {
				'Lines', {
					PlaceObj('ChatMessage', {
						'Text', T(695410436374, --[[ModItemUnitDataCompositeDef TestF Text MercChatBranch Lines ChatMessage voice:TestF]] "I feel bad about leaving Ron alone at home. Honestly, he mopes around the house more than the dogs when I'm gone."),
					}),
					PlaceObj('ChatMessage', {
						'Text', T(113850879219, --[[ModItemUnitDataCompositeDef TestF Text MercChatBranch Lines ChatMessage voice:TestF]] "Why don't you give him a call? He's pretty good - not as good as me, but then again few are."),
					}),
				},
				'Conditions', {
					PlaceObj('UnitHireStatus', {
						TargetUnit = "Raider",
					}),
				},
			}),
		},
		'Offline', {
			PlaceObj('ChatMessage', {
				'Text', T(763892462843, --[[ModItemUnitDataCompositeDef TestF Text Offline ChatMessage voice:TestF]] "Hi, this is Charlene Higgens. I'm out and about. How about we postpone this for another time?"),
			}),
		},
		'GreetingAndOffer', {
			PlaceObj('ChatMessage', {
				'Text', T(227677773764, --[[ModItemUnitDataCompositeDef TestF Text GreetingAndOffer ChatMessage voice:TestF]] "Hi, this is Charlene Higgens. I understand you have a mission I could be interested in."),
			}),
		},
		'ConversationRestart', {
			PlaceObj('ChatMessage', {
				'Text', T(311904849854, --[[ModItemUnitDataCompositeDef TestF Text ConversationRestart ChatMessage voice:TestF]] "OK. Let's try this again."),
			}),
		},
		'IdleLine', {
			PlaceObj('ChatMessage', {
				'Text', T(318985828088, --[[ModItemUnitDataCompositeDef TestF Text IdleLine ChatMessage voice:TestF]] "I'm good at night ops stuff and shooting stuff and being a badass in general. Just something to keep in mind while you're pondering."),
			}),
		},
		'PartingWords', {
			PlaceObj('ChatMessage', {
				'Text', T(431309677267, --[[ModItemUnitDataCompositeDef TestF Text PartingWords ChatMessage voice:TestF]] "Great. Can't wait to start. Just need to find a dog sitter."),
			}),
		},
		'RehireIntro', {
			PlaceObj('ChatMessage', {
				'Text', T(718690222165, --[[ModItemUnitDataCompositeDef TestF Text RehireIntro ChatMessage voice:TestF]] "My contract's about up for renewal. I'm interested, if you are."),
			}),
		},
		'RehireOutro', {
			PlaceObj('ChatMessage', {
				'Text', T(249755983578, --[[ModItemUnitDataCompositeDef TestF Text RehireOutro ChatMessage voice:TestF]] "Good. I like this arrangement."),
			}),
		},
		'StartingSalary', 1650,
		'SalaryIncrease', 230,
		'SalaryLv1', 1100,
		'SalaryMaxLv', 7300,
		'LegacyNotes', '"Former L.A.P.D. SWAT team sharpshooter, Sgt. Charlene Higgens left the force for A.I.M. so she could work alongside her husband, Ron Higgens. They prefer to take assignments together since operate with the precision of a solitary unit. If you listen to them though, you\'d never realize they\'re married; they rarely acknowledge their personal lives during work. Raven is qualified in night operations." - A.I.M. dossier\n\nAdditional info:\n\nA female version of her husband. They belong together. Also good friends with Donna who is their unofficial go to doctor for treating injuries.\nLess obsessive about being in charge.\nA consummate professional that gets on well with everyone.\nLighter, more prone to humor\nMore open and outgoing.',
		'StartingLevel', 2,
		'CustomEquipGear', function (self, items)
			self:TryEquip(items, "Handheld A", "Firearm")
			self:TryEquip(items, "Handheld B", "Firearm")
		end,
		'MaxHitPoints', 85,
		'Likes', {
			"Raider",
		},
		'StartingPerks', {
			"AutoWeapons",
			"Spotter",
			"Deadeye",
		},
		'AppearancesList', {
			PlaceObj('AppearanceWeight', {
				'Preset', "TestAppearanceF",
			}),
		},
		'Equipment', {
			"Raven",
		},
		'Tier', "Veteran",
		'Specialization', "Marksmen",
		'pollyvoice', "Emma",
		'gender', "Female",
		'VoiceResponseId', "Raven",
	}),
	PlaceObj('ModItemAppearancePreset', {
		Armor = "EquipmentFemale_FlackVest",
		Body = "EquipmentLivewire_Top",
		BodyColor = PlaceObj('ColorizationPropSet', {
			'EditableColor1', RGBA(73, 8, 8, 255),
			'EditableColor2', RGBA(187, 64, 35, 255),
			'EditableColor3', RGBA(109, 83, 55, 255),
		}),
		Chest = "Faction_Acc_Heavy_02",
		Hat = "",
		Head = "Head_Livewire",
		Pants = "NPCCostumeFemale_Pants_01",
		group = "Default",
		id = "TestAppearanceF",
	}),
	PlaceObj('ModItemUnitDataCompositeDef', {
		'Group', "MercenariesOld",
		'Id', "TestM",
		'object_class', "UnitData",
		'Health', 94,
		'Agility', 69,
		'Dexterity', 51,
		'Strength', 95,
		'Wisdom', 72,
		'Leadership', 18,
		'Marksmanship', 79,
		'Mechanical', 24,
		'Explosives', 37,
		'Medical', 8,
		'Portrait', "UI/MercsPortraits/Grizzly",
		'BigPortrait', "UI/Mercs/Grizzly",
		'IsMercenary', true,
		'Name', T(221851204204, --[[ModItemUnitDataCompositeDef TestM Name]] "TEST M"),
		'Nick', T(501761184263, --[[ModItemUnitDataCompositeDef TestM Nick]] "Grizzly"),
		'AllCapsNick', T(328682788747, --[[ModItemUnitDataCompositeDef TestM AllCapsNick]] "GRIZZLY"),
		'Bio', T(313276093378, --[[ModItemUnitDataCompositeDef TestM Bio]] "Steve Bornell is so tough he doesn't just spit nails when he eats iron, he swallows rocks and craps out concrete bunkers. Never one to shy away from a fight, he can beat you to a pulp with his bare hands or take out the tank you're driving with a rocket launcher. And when you need a friend, Grizzly is the big cuddly bear in your corner."),
		'Nationality', "USA",
		'Title', T(138989584994, --[[ModItemUnitDataCompositeDef TestM Title]] "A Bear of a Man"),
		'Email', T(539118642155, --[[ModItemUnitDataCompositeDef TestM Email]] "grizz@aim.com"),
		'snype_nick', T(278856531370, --[[ModItemUnitDataCompositeDef TestM snype_nick]] "grizz"),
		'Refusals', {
			PlaceObj('MercChatRefusal', {
				'Lines', {
					PlaceObj('ChatMessage', {
						'Text', T(759786796055, --[[ModItemUnitDataCompositeDef TestM Text MercChatRefusal Lines ChatMessage voice:TestM]] "I don't work with Dr. Q., and take my advice, you shouldn't either. Word to the wise, beware of him."),
					}),
				},
				'Conditions', {
					PlaceObj('UnitHireStatus', {
						Status = "Hired",
						TargetUnit = "DrQ",
					}),
				},
			}),
		},
		'Haggles', {
			PlaceObj('MercChatHaggle', {
				'Lines', {
					PlaceObj('ChatMessage', {
						'Text', T(369175593795, --[[ModItemUnitDataCompositeDef TestM Text MercChatHaggle Lines ChatMessage voice:TestM]] "You've got too many foreigners in that team of yours. I'm looking to hang out with some good old US soldiers, dammit. I'm not racist, but if I'm gonna be trusting damn foreigners with my life, it's gonna cost extra."),
					}),
				},
				'Conditions', {
					PlaceObj('CheckExpression', {
						Expression = function (self, obj)
							return table.count(gv_UnitData, "HireStatus", "Hired") > 3 and table.count(gv_UnitData, function(i, ud) return ud.HireStatus == "Hired" and ud.Nationality ~= "USA" end) >= 2
						end,
					}),
				},
			}),
		},
		'Mitigations', {
			PlaceObj('MercChatMitigation', {
				'Lines', {
					PlaceObj('ChatMessage', {
						'Text', T(575730482641, --[[ModItemUnitDataCompositeDef TestM Text MercChatMitigation Lines ChatMessage voice:TestM]] "Hey, me and my Shadow. We're two of a kind, man. I'm in."),
					}),
				},
				'Conditions', {
					PlaceObj('UnitHireStatus', {
						Status = "Hired",
						TargetUnit = "Shadow",
					}),
				},
				'chanceToRoll', 100,
			}),
			PlaceObj('MercChatMitigation', {
				'Lines', {
					PlaceObj('ChatMessage', {
						'Text', T(237128140731, --[[ModItemUnitDataCompositeDef TestM Text MercChatMitigation Lines ChatMessage voice:TestM]] "You got problems, but a chance to see the Wolf howl again... that appeals."),
					}),
				},
				'Conditions', {
					PlaceObj('UnitHireStatus', {
						Status = "Hired",
						TargetUnit = "Wolf",
					}),
				},
				'chanceToRoll', 100,
			}),
		},
		'ExtraPartingWords', {
			PlaceObj('MercChatBranch', {
				'Lines', {
					PlaceObj('ChatMessage', {
						'Text', T(585879264727, --[[ModItemUnitDataCompositeDef TestM Text MercChatBranch Lines ChatMessage voice:TestM]] "It will be good to have my Shadow back. Why don't you give him a call as well. We'll be formidable. "),
					}),
				},
				'Conditions', {
					PlaceObj('UnitHireStatus', {
						TargetUnit = "Shadow",
					}),
				},
			}),
			PlaceObj('MercChatBranch', {
				'Lines', {
					PlaceObj('ChatMessage', {
						'Text', T(421662110443, --[[ModItemUnitDataCompositeDef TestM Text MercChatBranch Lines ChatMessage voice:TestM]] "I remember Wolf howling way back when. Why don't you give him a call as well. He's an excellent soldier."),
					}),
				},
				'Conditions', {
					PlaceObj('UnitHireStatus', {
						TargetUnit = "Wolf",
					}),
				},
			}),
		},
		'Offline', {
			PlaceObj('ChatMessage', {
				'Text', T(895121142024, --[[ModItemUnitDataCompositeDef TestM Text Offline ChatMessage voice:TestM]] "Yeah, this is Steve Bornell. I'm not here right now, so that's that. Try me another time."),
			}),
		},
		'GreetingAndOffer', {
			PlaceObj('ChatMessage', {
				'Text', T(140722363768, --[[ModItemUnitDataCompositeDef TestM Text GreetingAndOffer ChatMessage voice:TestM]] "Bornell here. Whaddaya want?"),
			}),
		},
		'ConversationRestart', {
			PlaceObj('ChatMessage', {
				'Text', T(981369041292, --[[ModItemUnitDataCompositeDef TestM Text ConversationRestart ChatMessage voice:TestM]] "Let's do this again. We may sign a contract yet. "),
			}),
		},
		'IdleLine', {
			PlaceObj('ChatMessage', {
				'Text', T(337189788262, --[[ModItemUnitDataCompositeDef TestM Text IdleLine ChatMessage voice:TestM]] "Enough woolgathering. Get your head in the game. "),
			}),
		},
		'PartingWords', {
			PlaceObj('ChatMessage', {
				'Text', T(949032982386, --[[ModItemUnitDataCompositeDef TestM Text PartingWords ChatMessage voice:TestM]] "Excellent! I've been looking for some fun."),
			}),
		},
		'RehireIntro', {
			PlaceObj('ChatMessage', {
				'Text', T(883545559735, --[[ModItemUnitDataCompositeDef TestM Text RehireIntro ChatMessage voice:TestM]] "Yeah, about this contract. It's about up. Are we renewing, or what's the deal?"),
			}),
		},
		'RehireOutro', {
			PlaceObj('ChatMessage', {
				'Text', T(819364228198, --[[ModItemUnitDataCompositeDef TestM Text RehireOutro ChatMessage voice:TestM]] "It's always better the next time around, right? Right!"),
			}),
		},
		'MedicalDeposit', "none",
		'StartingSalary', 480,
		'SalaryIncrease', 270,
		'SalaryLv1', 175,
		'SalaryMaxLv', 3600,
		'LegacyNotes', '"A bear of a man, Grizzly Bornell carries the big guns of battle with authority. Even though heavy weapons are his specialty, he is just as lethal when left empty-handed. He\'s a soldier\'s soldier--all guts and no need for glory. Not surprisingly, his combat exploits are almost always the talk of the plane ride home."\n\nAdditional info:\nBig and burly, a bear of a man.\nHis toughness is to such an extent it borders on comical, yet understated. No need for kickass statements, it is simply understood.\nFriendly, and without pretence, he\'s the type of guy you\'d want next to you in combat.\nVoice: Deep, warm, reassuring.\nNot a big fan of traditional medical techniques, views them as crazy.',
		'StartingLevel', 2,
		'CustomEquipGear', function (self, items)
			self:TryEquip(items, "Handheld A", "Firearm")
			self:TryEquip(items, "Handheld B", "MeleeWeapon")
		end,
		'MaxHitPoints', 94,
		'Likes', {
			"Shadow",
			"Wolf",
		},
		'Dislikes', {
			"DrQ",
		},
		'StartingPerks', {
			"HeavyWeaponsTraining",
			"GrizzlyPerk",
			"BloodlustPerk",
		},
		'AppearancesList', {
			PlaceObj('AppearanceWeight', {
				'Preset', "TestAppearanceM",
			}),
		},
		'Equipment', {
			"Grizzly",
		},
		'Specialization', "AllRounder",
		'gender', "Male",
		'blocked_spots', set( "Weaponls", "Weaponrs" ),
	}),
	PlaceObj('ModItemAppearancePreset', {
		Armor = "EquipmentFemale_FlackVest",
		Body = "EquipmentBiff_Top",
		BodyColor = PlaceObj('ColorizationPropSet', {
			'EditableColor1', RGBA(154, 53, 30, 255),
			'EditableColor2', RGBA(73, 8, 8, 255),
			'EditableColor3', RGBA(109, 83, 55, 255),
		}),
		Head = "Head_Thor",
		Hip = "Faction_Acc_Artilery",
		Pants = "Faction_GrandChien_Bottom_01",
		group = "Default",
		id = "TestAppearanceM",
	}),
	PlaceObj('ModItemXTemplate', {
		__is_kind_of = "XButton",
		group = "Zulu",
		id = "NewGameMenuFinalStandEntryOld",
		PlaceObj('XTemplateWindow', {
			'__class', "XButton",
			'RolloverTemplate', "RolloverGenericFixedL",
			'RolloverAnchor', "right",
			'RolloverText', T(914391830806, --[[ModItemXTemplate NewGameMenuFinalStandEntryOld RolloverText]] "<description>"),
			'RolloverOffset', box(25, 0, 0, 0),
			'RolloverTitle', T(939410163843, --[[ModItemXTemplate NewGameMenuFinalStandEntryOld RolloverTitle]] "<display_name>"),
			'UIEffectModifierId', "MainMenuMainBar",
			'MinHeight', 64,
			'MaxHeight', 64,
			'LayoutMethod', "HList",
			'BorderColor', RGBA(0, 0, 0, 0),
			'Background', RGBA(255, 255, 255, 0),
			'OnContextUpdate', function (self, context, ...)
				if IsKindOf(self.context, "FinalStandLengthDef") then
				    local gameObj = Game or NewGameObj
				    if not gameObj then return end
				
				    if self.context.id == gameObj['FinalStandLengths'] then
				        self.idCheckmark:SetColumn(2)
				    else
				        self.idCheckmark:SetColumn(1)
				    end
				end
			end,
			'FXPress', "CheckBoxClick",
			'FXPressDisabled', "activityAssignSelectDisabled",
			'FocusedBorderColor', RGBA(0, 0, 0, 0),
			'FocusedBackground', RGBA(128, 128, 128, 0),
			'DisabledBorderColor', RGBA(0, 0, 0, 0),
			'OnPress', function (self, gamepad)
				if not GetUIStyleGamepad() then
				    self.parent:SetFocus(true)
				end
				
				for _, obj in ipairs(self.parent) do
				    if IsKindOf(obj, "XButton") and obj == self then
				        self.idCheckmark:SetColumn(2)
				        NewGameObj["FinalStandLengths"] = self.context.id
				        --NetChangeGameInfo({start_info = NewGameObj})
				        if netInGame and NetIsHost() then
				            local context = GetDialog(self):ResolveId("node").idSubMenu.context
				            if context and context.invited_player_id then
				                CreateRealTimeThread(function(invited_player_id)
				                    NetCall("rfnPlayerMessage", invited_player_id, "lobby-info",
				                        { start_info = NewGameObj, no_scroll = true })
				                end, context.invited_player_id)
				            end
				        end
				    elseif IsKindOf(obj, "XButton") and IsKindOf(obj.context, "FinalStandLengthDef") then
				        obj.idCheckmark:SetColumn(1)
				    end
				end
			end,
			'RolloverBackground', RGBA(255, 255, 255, 0),
			'PressedBackground', RGBA(255, 255, 255, 0),
		}, {
			PlaceObj('XTemplateWindow', {
				'__class', "XBlurRect",
				'Margins', box(0, 5, 0, 5),
				'Dock', "box",
				'BlurRadius', 10,
				'Mask', "UI/Common/mm_panel",
				'FrameLeft', 15,
				'FrameRight', 10,
			}),
			PlaceObj('XTemplateWindow', {
				'__class', "XFrame",
				'Id', "idEffect",
				'Margins', box(5, 5, 5, 5),
				'Dock', "box",
				'Transparency', 179,
				'HandleKeyboard', false,
				'DisabledBackground', RGBA(255, 255, 255, 255),
				'Image', "UI/Common/screen_effect",
				'ImageScale', point(100000, 1000),
				'TileFrame', true,
				'SqueezeX', false,
				'SqueezeY', false,
			}),
			PlaceObj('XTemplateWindow', {
				'__class', "XFrame",
				'UIEffectModifierId', "MainMenuMainBar",
				'Id', "idImg",
				'Dock', "box",
				'Transparency', 64,
				'HandleKeyboard', false,
				'DisabledBackground', RGBA(255, 255, 255, 255),
				'Image', "UI/Common/mm_panel",
				'SqueezeX', false,
				'SqueezeY', false,
			}),
			PlaceObj('XTemplateWindow', {
				'__class', "XFrame",
				'UIEffectModifierId', "MainMenuHighlight",
				'Id', "idImgBcgr",
				'Dock', "box",
				'Transparency', 255,
				'HandleKeyboard', false,
				'DisabledBackground', RGBA(255, 255, 255, 255),
				'Image', "UI/Common/mm_panel_selected",
				'SqueezeX', false,
				'SqueezeY', false,
			}),
			PlaceObj('XTemplateWindow', {
				'__class', "AutoFitText",
				'Id', "idName",
				'Margins', box(20, 0, 0, 0),
				'HAlign', "left",
				'VAlign', "center",
				'MinWidth', 300,
				'MaxWidth', 300,
				'HandleKeyboard', false,
				'HandleMouse', false,
				'FocusedBorderColor', RGBA(0, 0, 0, 0),
				'DisabledBorderColor', RGBA(0, 0, 0, 0),
				'TextStyle', "MMOptionEntry",
				'Translate', true,
				'Text', T(543433418361, --[[ModItemXTemplate NewGameMenuFinalStandEntryOld Text]] "<display_name>"),
				'TextVAlign', "center",
				'SafeSpace', 10,
			}),
			PlaceObj('XTemplateWindow', {
				'__class', "XImage",
				'Id', "idCheckmark",
				'Margins', box(0, 0, 50, 0),
				'Dock', "right",
				'HAlign', "center",
				'VAlign', "center",
				'MinWidth', 50,
				'FoldWhenHidden', true,
				'HandleKeyboard', false,
				'Image', "UI/Hud/checkmark",
				'Columns', 2,
			}),
			PlaceObj('XTemplateFunc', {
				'name', "OnSetRollover(self, rollover)",
				'func', function (self, rollover)
					                    self.idName:SetTextStyle(rollover and "MMOptionEntryHighlight" or "MMOptionEntry")
					                    if rollover then
					                        self.idCheckmark:SetImage("UI/Hud/checkmark_rollover")
					                    else
					                        self.idCheckmark:SetImage("UI/Hud/checkmark")
					                    end
					                    if rollover then
					                        PlayFX("MainMenuButtonRollover")
					                        self.idImgBcgr:SetTransparency(0, 150)
					                    else
					                        self.idImgBcgr:SetTransparency(255, 150)
					                    end
				end,
			}),
			PlaceObj('XTemplateFunc', {
				'name', "OnShortcut(self, shortcut, source, ...)",
				'func', function (self, shortcut, source, ...)
					                    if shortcut == "ButtonA" then
					                        self:Press()
					                    end
				end,
			}),
			PlaceObj('XTemplateFunc', {
				'name', "SetSelected(self, selected)",
				'func', function (self, selected)
					                    self:SetFocus(selected)
				end,
			}),
			PlaceObj('XTemplateFunc', {
				'name', "Open(self)",
				'func', function (self)
					                    XButton.Open(self)
				end,
			}),
			}),
		PlaceObj('XTemplateProperty', {
			'category', "General",
			'id', "Name",
			'editor', "text",
			'Set', function (self, value)
				self.idName:SetText(value)
			end,
			'Get', function (self)
				return self.idName:GetText()
			end,
			'name', T(897564294510, --[[ModItemXTemplate NewGameMenuFinalStandEntryOld name]] "Name"),
		}),
	}),
	PlaceObj('ModItemXTemplate', {
		__is_kind_of = "NewGameCategory",
		group = "Zulu",
		id = "NewGameMenuFinalStandOld",
		PlaceObj('XTemplateTemplate', {
			'comment', "Final Stand Waves",
			'__template', "NewGameCategory",
			'IdNode', false,
			'Name', T(892716651495, --[[ModItemXTemplate NewGameMenuFinalStandOld Name]] "Final Stand - Waves"),
		}),
		PlaceObj('XTemplateTemplate', {
			'comment', "3 Waves",
			'__context', function (parent, context) return FinalStandLengths["ThreeWaves"] end,
			'__template', "NewGameMenuFinalStandEntryOld",
			'Id', "idThreeWaves",
			'IdNode', false,
			'OnContextUpdate', function (self, context, ...)
				if IsKindOf(self.context, "FinalStandLengthDef") then
				    local gameObj = Game or NewGameObj
				    if not gameObj then return end
				
				    if self.context.id == gameObj['FinalStandLengths'] then
				        self.idCheckmark:SetColumn(2)
				    else
				        self.idCheckmark:SetColumn(1)
				    end
				end
			end,
			'OnPress', function (self, gamepad)
				if not GetUIStyleGamepad() then
				    self.parent:SetFocus(true)
				end
				
				for _, obj in ipairs(self.parent) do
				    if IsKindOf(obj, "XButton") and obj == self then
				        self.idCheckmark:SetColumn(2)
				        NewGameObj["FinalStandLengths"] = self.context.id
				        --NetChangeGameInfo({start_info = NewGameObj})
				        if netInGame and NetIsHost() then
				            local context = GetDialog(self):ResolveId("node").idSubMenu.context
				            if context and context.invited_player_id then
				                CreateRealTimeThread(function(invited_player_id)
				                    NetCall("rfnPlayerMessage", invited_player_id, "lobby-info",
				                        { start_info = NewGameObj, no_scroll = true })
				                end, context.invited_player_id)
				            end
				        end
				    elseif IsKindOf(obj, "XButton") and IsKindOf(obj.context, "FinalStandLengthDef") then
				        obj.idCheckmark:SetColumn(1)
				    end
				end
			end,
			'Name', T(511287105543, --[[ModItemXTemplate NewGameMenuFinalStandOld Name]] "3 Waves"),
		}),
		PlaceObj('XTemplateTemplate', {
			'comment', "5 Waves",
			'__context', function (parent, context) return FinalStandLengths["FiveWaves"] end,
			'__template', "NewGameMenuFinalStandEntryOld",
			'Id', "idFiveWaves",
			'IdNode', false,
			'OnContextUpdate', function (self, context, ...)
				if IsKindOf(self.context, "FinalStandLengthDef") then
				    local gameObj = Game or NewGameObj
				    if not gameObj then return end
				
				    if self.context.id == gameObj['FinalStandLengths'] then
				        self.idCheckmark:SetColumn(2)
				    else
				        self.idCheckmark:SetColumn(1)
				    end
				end
			end,
			'OnPress', function (self, gamepad)
				if not GetUIStyleGamepad() then
				    self.parent:SetFocus(true)
				end
				
				for _, obj in ipairs(self.parent) do
				    if IsKindOf(obj, "XButton") and obj == self then
				        self.idCheckmark:SetColumn(2)
				        NewGameObj["FinalStandLengths"] = self.context.id
				        --NetChangeGameInfo({start_info = NewGameObj})
				        if netInGame and NetIsHost() then
				            local context = GetDialog(self):ResolveId("node").idSubMenu.context
				            if context and context.invited_player_id then
				                CreateRealTimeThread(function(invited_player_id)
				                    NetCall("rfnPlayerMessage", invited_player_id, "lobby-info",
				                        { start_info = NewGameObj, no_scroll = true })
				                end, context.invited_player_id)
				            end
				        end
				    elseif IsKindOf(obj, "XButton") and IsKindOf(obj.context, "FinalStandLengthDef") then
				        obj.idCheckmark:SetColumn(1)
				    end
				end
			end,
			'Name', T(287157780620, --[[ModItemXTemplate NewGameMenuFinalStandOld Name]] "5 Waves"),
		}),
		PlaceObj('XTemplateTemplate', {
			'comment', "7 Waves",
			'__context', function (parent, context) return FinalStandLengths["SevenWaves"] end,
			'__template', "NewGameMenuFinalStandEntryOld",
			'Id', "idSevenWaves",
			'IdNode', false,
			'OnContextUpdate', function (self, context, ...)
				if IsKindOf(self.context, "FinalStandLengthDef") then
				    local gameObj = Game or NewGameObj
				    if not gameObj then return end
				
				    if self.context.id == gameObj['FinalStandLengths'] then
				        self.idCheckmark:SetColumn(2)
				    else
				        self.idCheckmark:SetColumn(1)
				    end
				end
			end,
			'OnPress', function (self, gamepad)
				if not GetUIStyleGamepad() then
				    self.parent:SetFocus(true)
				end
				
				for _, obj in ipairs(self.parent) do
				    if IsKindOf(obj, "XButton") and obj == self then
				        self.idCheckmark:SetColumn(2)
				        NewGameObj["FinalStandLengths"] = self.context.id
				        --NetChangeGameInfo({start_info = NewGameObj})
				        if netInGame and NetIsHost() then
				            local context = GetDialog(self):ResolveId("node").idSubMenu.context
				            if context and context.invited_player_id then
				                CreateRealTimeThread(function(invited_player_id)
				                    NetCall("rfnPlayerMessage", invited_player_id, "lobby-info",
				                        { start_info = NewGameObj, no_scroll = true })
				                end, context.invited_player_id)
				            end
				        end
				    elseif IsKindOf(obj, "XButton") and IsKindOf(obj.context, "FinalStandLengthDef") then
				        obj.idCheckmark:SetColumn(1)
				    end
				end
			end,
			'Name', T(260215724009, --[[ModItemXTemplate NewGameMenuFinalStandOld Name]] "7 Waves"),
		}),
	}),
}
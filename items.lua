return {
	PlaceObj('ModItemFolder', {
		'name', "Definitions",
		'comment', "Main Definitons of the mod",
	}, {
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
			DisclaimerOnStart = T(343258375424, --[[ModItemCampaignPreset FinalStand DisclaimerOnStart]] "Welcome to the Final Stand game mode. The premise is simple, the task is not: survive set amount of waves in order to win.<newline><newline>Each time the enemy wave is coming, it is displayed on the game timeline.<newline>Each time you defeat the enemy wave, you will receive monetary compensation, and your mercs will gain an XP boost.<newline>On top of that BobbyRayShop will be restocked, use the shop and operations to prepare for the next wave.<newline><newline>It's up to you to choose your roster, but mercs and gear still take time to arrive, so plan accordingly.<newline><newline>Good luck."),
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
			InitialSector = "D17",
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
			Parameters = {
				PlaceObj('PresetParamPercent', {
					'Name', "operationsProgressModifier",
					'Value', 50,
					'Tag', "<operationsProgressModifier>%",
				}),
				PlaceObj('PresetParamNumber', {
					'Name', "cityLoyaltyAmount",
					'Value', 5,
					'Tag', "<cityLoyaltyAmount>",
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
			baseXp = 12000,
			description = T(995080477580, --[[ModItemFinalStandConfigDef Default description]] "Default Final Stand configuration."),
			display_name = T(969651972519, --[[ModItemFinalStandConfigDef Default display_name]] "Default"),
			display_name_caps = T(570560636797, --[[ModItemFinalStandConfigDef Default display_name_caps]] "DEFAULT"),
			group = "Default",
			id = "Default",
			msg_reactions = {
				PlaceObj('MsgReaction', {
					Event = "FinalStandGameConfigured",
					Handler = function (self, FinalStand)
						-- add some starting items to stash
						--local sectorStash = GetSectorInventory(GetFinalStandSector())
						--local itemsCopy = table.copy(shipment_details.items)
						--if sectorStash then
						--    AddItemsToInventory(sectorStash, itemsCopy)
						--end
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
				PlaceObj('MsgReaction', {
					Event = "ConflictEnd",
					Handler = function (self, sector, bNoVoice, playerAttacking, playerWon, isAutoResolve)
						if not IsFinalStand() then return end
						if not IsFinalStandSectorPlayerControlled() then return end
						
						-- add loyalty to current sector
						local sector = GetFinalStandSector(true)
						local value = self:ResolveValue("cityLoyaltyAmount") * GetFinalStandCurrentWave()
						CityModifyLoyalty(sector.City, value, "")
					end,
					param_bindings = false,
				}),
			},
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
					comment = "No modifiers or changes to Characters",
					description = T(740134134665, --[[ModItemFinalStandFriendlyFactionDef Mercs description]] "<em>No Faction</em> - no bonuses or penalties, closer to vanilla experience.<newline><newline><flavor>This is a default non-themed faction, mercenaries will not wear faction attire.</flavor>"),
					display_name = T(967105562153, --[[ModItemFinalStandFriendlyFactionDef Mercs display_name]] "No Faction"),
					display_name_caps = T(560481808058, --[[ModItemFinalStandFriendlyFactionDef Mercs display_name_caps]] "NO FACTION"),
					group = "Default",
					id = "Mercs",
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
				}),
			PlaceObj('ModItemFolder', {
				'name', "Militia",
			}, {
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
					comment = "Faster ops, train militia, more xp, less money",
					description = T(795340958482, --[[ModItemFinalStandFriendlyFactionDef Militia description]] "<color 161 161 161>Push back against the oppressors with the <em>Militia</em> faction.</color><newline><newline><color 21 132 138>Homefront</color> - sector operations are faster. You can also <em>Train Militia</em>.<newline><newline><color 21 132 138>Eager Fighters</color> - units receive <em>more XP</em> for each wave completion.<newline><newline><color 204 51 0>Village Fund</color> - receive <em>less money</em> for wave completion.<newline><newline><flavor>This is a themed faction, mercenaries will wear faction attire.</flavor>"),
					display_name = T(315086321064, --[[ModItemFinalStandFriendlyFactionDef Militia display_name]] "Grand Chien Militia"),
					display_name_caps = T(838090083518, --[[ModItemFinalStandFriendlyFactionDef Militia display_name_caps]] "GRAND CHIEN MILITIA"),
					group = "Default",
					id = "Militia",
					moneyModifier = -25,
					msg_reactions = {
						PlaceObj('MsgReaction', {
							Event = "OperationIsEnabled",
							Handler = function (self, operation, reasons)
								if not IsFinalStand() then return end
								if operation.id ~= 'MilitiaTraining' then return end
								
								if self.id ~= GetFinalStandFriendlyFaction() then 
									-- limit militia training operation to anyone but militia
									reasons["faction_not_supported"] = {
										enabled = false,
										message = T(469065984286, "Only Militia faction can perform this operation.")
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
					},
					xpModifier = 25,
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
				}),
			PlaceObj('ModItemFolder', {
				'name', "Rebels",
			}, {
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
					comment = "Faster BobbyRay + higher tier, less xp, slightly more money",
					description = T(804842149252, --[[ModItemFinalStandFriendlyFactionDef Rebels description]] "<color 161 161 161>Fight for the revolution with the <em>Maquis Rebels</em> faction.</color><newline><newline><color 21 132 138>Connections</color> - each restock of BobbyRayShop <em>increases tier by 2</em>, instead of 1. <em>Deliveries</em> from said shop arrive twice as <em>fast</em> despite what it says on the website.<newline><newline><color 21 132 138>Mysterious Funding</color> - receive <em>more money</em> for each wave completion.<newline><newline><color 204 51 0>War Veterans</color> - units receive <em>less XP</em> for wave completion.<newline><newline><flavor>This is a themed faction, mercenaries will wear faction attire.</flavor>"),
					display_name = T(943600656612, --[[ModItemFinalStandFriendlyFactionDef Rebels display_name]] "Maquis Rebels"),
					display_name_caps = T(960626436378, --[[ModItemFinalStandFriendlyFactionDef Rebels display_name_caps]] "MAQUIS REBELS"),
					group = "Default",
					id = "Rebels",
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
					xpModifier = -40,
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
						'Squad', "LegionAttackers_Ordnance_Easy",
						'Waves', "2,3",
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
				description = T(163165721641, --[[ModItemFinalStandEnemyFactionDef Legion description]] "<color 161 161 161>Major's ruthless, one could even dare to say, para-military.</color><newline><newline><em>Piece of Cake</em> - this faction is overall easy to fight, <em>no money or XP increase</em> from base rewards.<newline><newline>"),
				display_name = T(625545314418, --[[ModItemFinalStandEnemyFactionDef Legion display_name]] "Legion"),
				display_name_caps = T(928522287632, --[[ModItemFinalStandEnemyFactionDef Legion display_name_caps]] "LEGION"),
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
				comment = "20% increase in Money and XP, medium enemies",
				description = T(570856303260, --[[ModItemFinalStandEnemyFactionDef Adonis description]] "<color 161 161 161>Army of soldiers from the powerful corporation.</color><newline><newline><em>Slight Challenge</em> - this faction is overall not a walk in a park, <em><percent(moneyModifier)> increase in XP and money</em> from base rewards.<newline><newline>"),
				display_name = T(848092566579, --[[ModItemFinalStandEnemyFactionDef Adonis display_name]] "Adonis"),
				display_name_caps = T(487895655216, --[[ModItemFinalStandEnemyFactionDef Adonis display_name_caps]] "ADONIS"),
				group = "Default",
				id = "Adonis",
				moneyModifier = 20,
				xpModifier = 20,
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
				comment = "40% increase in Money and XP, hard enemies",
				description = T(398191236510, --[[ModItemFinalStandEnemyFactionDef Army description]] "<color 161 161 161>Well-organized military force of Grand Chien.</color><newline><newline><em>Tough Fight</em> - this faction is overall hard to fight, <em><percent(moneyModifier)> increase in XP and money</em> from base rewards.<newline><newline>"),
				display_name = T(607354837385, --[[ModItemFinalStandEnemyFactionDef Army display_name]] "Grand Chien Army"),
				display_name_caps = T(376620708541, --[[ModItemFinalStandEnemyFactionDef Army display_name_caps]] "GRAND CHIEN ARMY"),
				group = "Default",
				id = "Army",
				moneyModifier = 40,
				xpModifier = 40,
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
				comment = "60% increase in Money and XP, hard enemies",
				description = T(345842431232, --[[ModItemFinalStandEnemyFactionDef SuperSoldiers description]] "<color 161 161 161>Siegfried's Super Soldiers.</color><newline><newline><em>ÜBER</em> - extremely nasty enemy to face, <em><percent(moneyModifier)> increase in XP and money</em> from base rewards.<newline><newline>"),
				display_name = T(280034056377, --[[ModItemFinalStandEnemyFactionDef SuperSoldiers display_name]] "Siegfried's Guard"),
				display_name_caps = T(904780289973, --[[ModItemFinalStandEnemyFactionDef SuperSoldiers display_name_caps]] "SIEGFRIED'S GUARD"),
				group = "Default",
				id = "SuperSoldiers",
				moneyModifier = 60,
				xpModifier = 60,
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
		}),
		PlaceObj('ModItemFinalStandSectorDef', {
			Sector = "L8",
			SortKey = 3,
			comment = "Port Cacao City (city/mansion)",
			description = T(119457814568, --[[ModItemFinalStandSectorDef L8 description]] "City center of Port Cacao.<newline><newline><image UI/SatelliteView/SectorImages/L08 1600>"),
			display_name = T(685381178936, --[[ModItemFinalStandSectorDef L8 display_name]] "Port Cacao City (L8)"),
			group = "Default",
			id = "L8",
		}),
		PlaceObj('ModItemFinalStandSectorDef', {
			Sector = "D7",
			SortKey = 4,
			comment = "Pantagruel Slums (city/open area)",
			description = T(642687711828, --[[ModItemFinalStandSectorDef D7 description]] "Densely populated slums west of Pantagruel center.<newline><newline><image UI/SatelliteView/SectorImages/D07 1600>"),
			display_name = T(976812820692, --[[ModItemFinalStandSectorDef D7 display_name]] "Pantagruel Slums (D7)"),
			group = "Default",
			id = "D7",
		}),
		PlaceObj('ModItemFinalStandSectorDef', {
			Sector = "D17",
			SortKey = 5,
			comment = "Ille Morat",
			description = T(429721753974, --[[ModItemFinalStandSectorDef D17 description]] "Ille Morat village port.<newline><newline><image UI/SatelliteView/SectorImages/D17 1600>"),
			display_name = T(412313514242, --[[ModItemFinalStandSectorDef D17 display_name]] "Ille Morat (D17)"),
			group = "Default",
			id = "D17",
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
}
UndefineClass('TestF')
DefineClass.TestF = {
	__parents = { "UnitData" },
	__generated_by_class = "ModItemUnitDataCompositeDef",


	object_class = "UnitData",
	Health = 85,
	Agility = 76,
	Dexterity = 93,
	Strength = 68,
	Wisdom = 78,
	Leadership = 19,
	Marksmanship = 94,
	Mechanical = 5,
	Explosives = 5,
	Medical = 17,
	Portrait = "UI/MercsPortraits/Raven",
	BigPortrait = "UI/Mercs/Raven",
	IsMercenary = true,
	Name = T(775277976996, --[[ModItemUnitDataCompositeDef TestF Name]] "TEST F"),
	Nick = T(736472653747, --[[ModItemUnitDataCompositeDef TestF Nick]] "Raven"),
	AllCapsNick = T(696993136295, --[[ModItemUnitDataCompositeDef TestF AllCapsNick]] "RAVEN"),
	Bio = T(943289334891, --[[ModItemUnitDataCompositeDef TestF Bio]] "While husband Ron and others kept Somali pirates attempting to board their cruise ship pinned down, Raven used the cover of night to systematically kill one after another using controlled bursts from a captured automatic rifle. A formidable markswoman with nerves of steel, Raven prefers to work alongside her husband but is an asset to any team that is looking to maintain a high standard of excellence and esprit de corps."),
	Nationality = "USA",
	Title = T(943286403870, --[[ModItemUnitDataCompositeDef TestF Title]] "Never More Badass"),
	Email = T(619154713379, --[[ModItemUnitDataCompositeDef TestF Email]] "nevermore@aim.com"),
	snype_nick = T(783026836966, --[[ModItemUnitDataCompositeDef TestF snype_nick]] "nevermore"),
	Refusals = {
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
	Haggles = {
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
	Mitigations = {
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
	ExtraPartingWords = {
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
	Offline = {
		PlaceObj('ChatMessage', {
			'Text', T(763892462843, --[[ModItemUnitDataCompositeDef TestF Text Offline ChatMessage voice:TestF]] "Hi, this is Charlene Higgens. I'm out and about. How about we postpone this for another time?"),
		}),
	},
	GreetingAndOffer = {
		PlaceObj('ChatMessage', {
			'Text', T(227677773764, --[[ModItemUnitDataCompositeDef TestF Text GreetingAndOffer ChatMessage voice:TestF]] "Hi, this is Charlene Higgens. I understand you have a mission I could be interested in."),
		}),
	},
	ConversationRestart = {
		PlaceObj('ChatMessage', {
			'Text', T(311904849854, --[[ModItemUnitDataCompositeDef TestF Text ConversationRestart ChatMessage voice:TestF]] "OK. Let's try this again."),
		}),
	},
	IdleLine = {
		PlaceObj('ChatMessage', {
			'Text', T(318985828088, --[[ModItemUnitDataCompositeDef TestF Text IdleLine ChatMessage voice:TestF]] "I'm good at night ops stuff and shooting stuff and being a badass in general. Just something to keep in mind while you're pondering."),
		}),
	},
	PartingWords = {
		PlaceObj('ChatMessage', {
			'Text', T(431309677267, --[[ModItemUnitDataCompositeDef TestF Text PartingWords ChatMessage voice:TestF]] "Great. Can't wait to start. Just need to find a dog sitter."),
		}),
	},
	RehireIntro = {
		PlaceObj('ChatMessage', {
			'Text', T(718690222165, --[[ModItemUnitDataCompositeDef TestF Text RehireIntro ChatMessage voice:TestF]] "My contract's about up for renewal. I'm interested, if you are."),
		}),
	},
	RehireOutro = {
		PlaceObj('ChatMessage', {
			'Text', T(249755983578, --[[ModItemUnitDataCompositeDef TestF Text RehireOutro ChatMessage voice:TestF]] "Good. I like this arrangement."),
		}),
	},
	StartingSalary = 1650,
	SalaryIncrease = 230,
	SalaryLv1 = 1100,
	SalaryMaxLv = 7300,
	LegacyNotes = '"Former L.A.P.D. SWAT team sharpshooter, Sgt. Charlene Higgens left the force for A.I.M. so she could work alongside her husband, Ron Higgens. They prefer to take assignments together since operate with the precision of a solitary unit. If you listen to them though, you\'d never realize they\'re married; they rarely acknowledge their personal lives during work. Raven is qualified in night operations." - A.I.M. dossier\n\nAdditional info:\n\nA female version of her husband. They belong together. Also good friends with Donna who is their unofficial go to doctor for treating injuries.\nLess obsessive about being in charge.\nA consummate professional that gets on well with everyone.\nLighter, more prone to humor\nMore open and outgoing.',
	StartingLevel = 2,
	CustomEquipGear = function (self, items)
		self:TryEquip(items, "Handheld A", "Firearm")
		self:TryEquip(items, "Handheld B", "Firearm")
	end,
	MaxHitPoints = 85,
	Likes = {
		"Raider",
	},
	StartingPerks = {
		"AutoWeapons",
		"Spotter",
		"Deadeye",
	},
	AppearancesList = {
		PlaceObj('AppearanceWeight', {
			'Preset', "TestAppearanceF",
		}),
	},
	Equipment = {
		"Raven",
	},
	Tier = "Veteran",
	Specialization = "Marksmen",
	pollyvoice = "Emma",
	gender = "Female",
	VoiceResponseId = "Raven",
}


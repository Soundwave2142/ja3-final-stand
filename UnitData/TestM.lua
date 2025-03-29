UndefineClass('TestM')
DefineClass.TestM = {
	__parents = { "UnitData" },
	__generated_by_class = "ModItemUnitDataCompositeDef",


	object_class = "UnitData",
	Health = 94,
	Agility = 69,
	Dexterity = 51,
	Strength = 95,
	Wisdom = 72,
	Leadership = 18,
	Marksmanship = 79,
	Mechanical = 24,
	Explosives = 37,
	Medical = 8,
	Portrait = "UI/MercsPortraits/Grizzly",
	BigPortrait = "UI/Mercs/Grizzly",
	IsMercenary = true,
	Name = T(221851204204, --[[ModItemUnitDataCompositeDef TestM Name]] "TEST M"),
	Nick = T(501761184263, --[[ModItemUnitDataCompositeDef TestM Nick]] "Grizzly"),
	AllCapsNick = T(328682788747, --[[ModItemUnitDataCompositeDef TestM AllCapsNick]] "GRIZZLY"),
	Bio = T(313276093378, --[[ModItemUnitDataCompositeDef TestM Bio]] "Steve Bornell is so tough he doesn't just spit nails when he eats iron, he swallows rocks and craps out concrete bunkers. Never one to shy away from a fight, he can beat you to a pulp with his bare hands or take out the tank you're driving with a rocket launcher. And when you need a friend, Grizzly is the big cuddly bear in your corner."),
	Nationality = "USA",
	Title = T(138989584994, --[[ModItemUnitDataCompositeDef TestM Title]] "A Bear of a Man"),
	Email = T(539118642155, --[[ModItemUnitDataCompositeDef TestM Email]] "grizz@aim.com"),
	snype_nick = T(278856531370, --[[ModItemUnitDataCompositeDef TestM snype_nick]] "grizz"),
	Refusals = {
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
	Haggles = {
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
	Mitigations = {
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
	ExtraPartingWords = {
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
	Offline = {
		PlaceObj('ChatMessage', {
			'Text', T(895121142024, --[[ModItemUnitDataCompositeDef TestM Text Offline ChatMessage voice:TestM]] "Yeah, this is Steve Bornell. I'm not here right now, so that's that. Try me another time."),
		}),
	},
	GreetingAndOffer = {
		PlaceObj('ChatMessage', {
			'Text', T(140722363768, --[[ModItemUnitDataCompositeDef TestM Text GreetingAndOffer ChatMessage voice:TestM]] "Bornell here. Whaddaya want?"),
		}),
	},
	ConversationRestart = {
		PlaceObj('ChatMessage', {
			'Text', T(981369041292, --[[ModItemUnitDataCompositeDef TestM Text ConversationRestart ChatMessage voice:TestM]] "Let's do this again. We may sign a contract yet. "),
		}),
	},
	IdleLine = {
		PlaceObj('ChatMessage', {
			'Text', T(337189788262, --[[ModItemUnitDataCompositeDef TestM Text IdleLine ChatMessage voice:TestM]] "Enough woolgathering. Get your head in the game. "),
		}),
	},
	PartingWords = {
		PlaceObj('ChatMessage', {
			'Text', T(949032982386, --[[ModItemUnitDataCompositeDef TestM Text PartingWords ChatMessage voice:TestM]] "Excellent! I've been looking for some fun."),
		}),
	},
	RehireIntro = {
		PlaceObj('ChatMessage', {
			'Text', T(883545559735, --[[ModItemUnitDataCompositeDef TestM Text RehireIntro ChatMessage voice:TestM]] "Yeah, about this contract. It's about up. Are we renewing, or what's the deal?"),
		}),
	},
	RehireOutro = {
		PlaceObj('ChatMessage', {
			'Text', T(819364228198, --[[ModItemUnitDataCompositeDef TestM Text RehireOutro ChatMessage voice:TestM]] "It's always better the next time around, right? Right!"),
		}),
	},
	MedicalDeposit = "none",
	StartingSalary = 480,
	SalaryIncrease = 270,
	SalaryLv1 = 175,
	SalaryMaxLv = 3600,
	LegacyNotes = '"A bear of a man, Grizzly Bornell carries the big guns of battle with authority. Even though heavy weapons are his specialty, he is just as lethal when left empty-handed. He\'s a soldier\'s soldier--all guts and no need for glory. Not surprisingly, his combat exploits are almost always the talk of the plane ride home."\n\nAdditional info:\nBig and burly, a bear of a man.\nHis toughness is to such an extent it borders on comical, yet understated. No need for kickass statements, it is simply understood.\nFriendly, and without pretence, he\'s the type of guy you\'d want next to you in combat.\nVoice: Deep, warm, reassuring.\nNot a big fan of traditional medical techniques, views them as crazy.',
	StartingLevel = 2,
	CustomEquipGear = function (self, items)
		self:TryEquip(items, "Handheld A", "Firearm")
		self:TryEquip(items, "Handheld B", "MeleeWeapon")
	end,
	MaxHitPoints = 94,
	Likes = {
		"Shadow",
		"Wolf",
	},
	Dislikes = {
		"DrQ",
	},
	StartingPerks = {
		"HeavyWeaponsTraining",
		"GrizzlyPerk",
		"BloodlustPerk",
	},
	AppearancesList = {
		PlaceObj('AppearanceWeight', {
			'Preset', "TestAppearanceM",
		}),
	},
	Equipment = {
		"Grizzly",
	},
	Specialization = "AllRounder",
	gender = "Male",
	blocked_spots = set( "Weaponls", "Weaponrs" ),
}


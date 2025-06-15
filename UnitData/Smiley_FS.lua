UndefineClass('Smiley_FS')
DefineClass.Smiley_FS = {
	__parents = { "UnitData" },
	__generated_by_class = "ModItemUnitDataCompositeDef",


	object_class = "UnitData",
	Health = 82,
	Agility = 78,
	Dexterity = 56,
	Strength = 73,
	Wisdom = 55,
	Leadership = 54,
	Marksmanship = 77,
	Mechanical = 5,
	Explosives = 5,
	Medical = 36,
	Portrait = "UI/MercsPortraits/Smiley",
	BigPortrait = "UI/Mercs/Smiley",
	IsMercenary = true,
	Name = T(385353787961, --[[ModItemUnitDataCompositeDef Smiley_FS Name]] 'Alejandro "Smiley" Diaz'),
	Nick = T(927331763383, --[[ModItemUnitDataCompositeDef Smiley_FS Nick]] "Smiley"),
	AllCapsNick = T(199872192967, --[[ModItemUnitDataCompositeDef Smiley_FS AllCapsNick]] "SMILEY"),
	Bio = T(279931735040, --[[ModItemUnitDataCompositeDef Smiley_FS Bio]] 'Alejandro "Smiley" Diaz came to Grand Chien as mercenary serving some unknown small group - which got totally obliterated by the Major a few weeks before your encounter with him. An Arulco native, he is eager to join up with you, as A.I.M. is held in great regard in the new order back at his home country.'),
	Nationality = "Arulco",
	Title = T(935852850455, --[[ModItemUnitDataCompositeDef Smiley_FS Title]] "Romeo in Combat Fatigues"),
	GreetingAndOffer = {
		PlaceObj('ChatMessage', {
			'Text', T(232075599586, --[[ModItemUnitDataCompositeDef Smiley_FS Text GreetingAndOffer ChatMessage voice:Smiley_FS]] "Hello, Alejandro's here!"),
		}),
	},
	ConversationRestart = {
		PlaceObj('ChatMessage', {
			'Text', T(130806600380, --[[ModItemUnitDataCompositeDef Smiley_FS Text ConversationRestart ChatMessage voice:Smiley_FS]] "Sure friend, let's try again!"),
		}),
	},
	IdleLine = {
		PlaceObj('ChatMessage', {
			'Text', T(753995661600, --[[ModItemUnitDataCompositeDef Smiley_FS Text IdleLine ChatMessage voice:Smiley_FS]] "Hello, is anyone still there?"),
		}),
	},
	PartingWords = {
		PlaceObj('ChatMessage', {
			'Text', T(600050519058, --[[ModItemUnitDataCompositeDef Smiley_FS Text PartingWords ChatMessage voice:Smiley_FS]] "Awesome, let's head out!"),
		}),
	},
	RehireIntro = {
		PlaceObj('ChatMessage', {
			'Text', T(137923880699, --[[ModItemUnitDataCompositeDef Smiley_FS Text RehireIntro ChatMessage voice:Smiley_FS]] "My contract is expiring, that shouldn't stop us from kicking ass!"),
		}),
	},
	RehireOutro = {
		PlaceObj('ChatMessage', {
			'Text', T(205470923832, --[[ModItemUnitDataCompositeDef Smiley_FS Text RehireOutro ChatMessage voice:Smiley_FS]] "Private Smiley ready for redeployment, cap!"),
		}),
	},
	StartingSalary = 1300,
	SalaryIncrease = 210,
	SalaryLv1 = 0,
	SalaryMaxLv = 0,
	StartingLevel = 2,
	CustomEquipGear = function (self, items)
		self:TryEquip(items, "Handheld A", "SubmachineGun")
		self:TryEquip(items, "Handheld B", "SniperRifle")
	end,
	MaxHitPoints = 85,
	LearnToLike = {
		"Kalyna",
		"Fox",
		"Buns",
	},
	StartingPerks = {
		"AutoWeapons",
		"Optimist",
		"RecklessAssault",
		"BeefedUp",
	},
	AppearancesList = {
		PlaceObj('AppearanceWeight', {
			'Preset', "Smiley",
		}),
	},
	Equipment = {
		"Smiley",
	},
	Specialization = "AllRounder",
	gender = "Male",
	VoiceResponseId = "Smiley",
	IsFinalStandOnly = true,
}


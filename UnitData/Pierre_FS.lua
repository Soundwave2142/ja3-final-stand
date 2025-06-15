UndefineClass('Pierre_FS')
DefineClass.Pierre_FS = {
	__parents = { "UnitData" },
	__generated_by_class = "ModItemUnitDataCompositeDef",


	object_class = "UnitData",
	Health = 81,
	Agility = 72,
	Dexterity = 68,
	Strength = 78,
	Wisdom = 56,
	Leadership = 39,
	Marksmanship = 77,
	Mechanical = 5,
	Explosives = 15,
	Medical = 12,
	Portrait = "UI/MercsPortraits/Pierre",
	BigPortrait = "UI/Mercs/Pierre",
	IsMercenary = true,
	Name = T(246681713040, --[[ModItemUnitDataCompositeDef Pierre_FS Name]] "Pierre Laurent"),
	Nick = T(797749909826, --[[ModItemUnitDataCompositeDef Pierre_FS Nick]] "Pierre"),
	AllCapsNick = T(649708061788, --[[ModItemUnitDataCompositeDef Pierre_FS AllCapsNick]] "PIERRE"),
	Nationality = "GrandChien",
	Title = T(722424084824, --[[ModItemUnitDataCompositeDef Pierre_FS Title]] "Welcome to the Jungle"),
	Offline = {
		PlaceObj('ChatMessage', {
			'Text', T(456813967077, --[[ModItemUnitDataCompositeDef Pierre_FS Text Offline ChatMessage voice:Pierre_FS]] "I'm currently away, probably fighting for the better of Grand Chien!"),
		}),
	},
	GreetingAndOffer = {
		PlaceObj('ChatMessage', {
			'Text', T(671368127123, --[[ModItemUnitDataCompositeDef Pierre_FS Text GreetingAndOffer ChatMessage voice:Pierre_FS]] "Pierre here, do you have a proposition for me?"),
		}),
	},
	ConversationRestart = {
		PlaceObj('ChatMessage', {
			'Text', T(631166197556, --[[ModItemUnitDataCompositeDef Pierre_FS Text ConversationRestart ChatMessage voice:Pierre_FS]] "Let's begin anew."),
		}),
	},
	IdleLine = {
		PlaceObj('ChatMessage', {
			'Text', T(953209711862, --[[ModItemUnitDataCompositeDef Pierre_FS Text IdleLine ChatMessage voice:Pierre_FS]] "I'm waiting for you to make a decision."),
		}),
	},
	PartingWords = {
		PlaceObj('ChatMessage', {
			'Text', T(835413137750, --[[ModItemUnitDataCompositeDef Pierre_FS Text PartingWords ChatMessage voice:Pierre_FS]] "This is a great honor, I won't disappoint you."),
		}),
	},
	RehireIntro = {
		PlaceObj('ChatMessage', {
			'Text', T(119701403323, --[[ModItemUnitDataCompositeDef Pierre_FS Text RehireIntro ChatMessage voice:Pierre_FS]] "My contract is expiring, but my job is far from finished, let us come to an agreement!"),
		}),
	},
	RehireOutro = {
		PlaceObj('ChatMessage', {
			'Text', T(184126608286, --[[ModItemUnitDataCompositeDef Pierre_FS Text RehireOutro ChatMessage voice:Pierre_FS]] "Be honorable to the end."),
		}),
	},
	StartingSalary = 2000,
	SalaryLv1 = 0,
	SalaryMaxLv = 0,
	LegacyNotes = "A local boy who joined the Legion years ago in a pursuit of adventure, and grew up to become a Legion warlord. He recently returned to Ernie with a band of raiders, only to rob his home town and break the heart of his father. \nYet he is as a person who lives by his own code – he dislikes unneeded violence and did restrain his Legion thugs from doing too much mischief.",
	StartingLevel = 3,
	CustomEquipGear = function (self, items)
		self:TryEquip(items, "Handheld A", "Firearm")
		self:TryEquip(items, "Handheld B", "MeleeWeapon")
	end,
	LearnToLike = {
		"Flay",
	},
	LearnToDislike = {
		"Grizzly",
	},
	StartingPerks = {
		"AutoWeapons",
		"GloryHog",
		"OptimalPerformance",
		"BloodlustPerk",
	},
	AppearancesList = {
		PlaceObj('AppearanceWeight', {
			'Preset', "Pierre",
		}),
	},
	Equipment = {
		"Pierre",
	},
	Tier = "Elite",
	Specialization = "Leader",
	gender = "Male",
	VoiceResponseId = "PierreMerc",
	IsFinalStandOnly = true,
}


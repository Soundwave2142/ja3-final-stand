UndefineClass('Flay_FS')
DefineClass.Flay_FS = {
	__parents = { "UnitData" },
	__generated_by_class = "ModItemUnitDataCompositeDef",


	object_class = "UnitData",
	Health = 79,
	Agility = 63,
	Dexterity = 78,
	Strength = 80,
	Wisdom = 79,
	Leadership = 12,
	Marksmanship = 84,
	Mechanical = 18,
	Explosives = 0,
	Medical = 50,
	Portrait = "UI/MercsPortraits/Flay",
	BigPortrait = "UI/Mercs/Flay",
	IsMercenary = true,
	Name = T(514100377590, --[[ModItemUnitDataCompositeDef Flay_FS Name]] 'Jacques "Flay" Bohen'),
	Nick = T(626801229932, --[[ModItemUnitDataCompositeDef Flay_FS Nick]] "Flay"),
	AllCapsNick = T(499866662138, --[[ModItemUnitDataCompositeDef Flay_FS AllCapsNick]] "FLAY"),
	Bio = T(493494355451, --[[ModItemUnitDataCompositeDef Flay_FS Bio]] "An experienced poacher, Flay has hunted every animal imaginable. Now is the time to track down and kill the only beasts he has never hunted so far - humans.\nA difficult man to like, he is skilled in what he does and won't take much convincing to join you as it is obvious you are his best vehicle to achieve the loathsome goal."),
	Nationality = "GrandChien",
	Title = T(280465339940, --[[ModItemUnitDataCompositeDef Flay_FS Title]] "Hunter Of Buckheads"),
	Offline = {
		PlaceObj('ChatMessage', {
			'Text', T(530509519160, --[[ModItemUnitDataCompositeDef Flay_FS Text Offline ChatMessage voice:Flay_FS]] "I'm currently stalking prey and cannot answer the device."),
		}),
	},
	GreetingAndOffer = {
		PlaceObj('ChatMessage', {
			'Text', T(327807807818, --[[ModItemUnitDataCompositeDef Flay_FS Text GreetingAndOffer ChatMessage voice:Flay_FS]] "Do you have des proies for me to kill, oui?"),
		}),
	},
	ConversationRestart = {
		PlaceObj('ChatMessage', {
			'Text', T(434058381357, --[[ModItemUnitDataCompositeDef Flay_FS Text ConversationRestart ChatMessage voice:Flay_FS]] "Oui?"),
		}),
	},
	IdleLine = {
		PlaceObj('ChatMessage', {
			'Text', T(490590211998, --[[ModItemUnitDataCompositeDef Flay_FS Text IdleLine ChatMessage voice:Flay_FS]] "I have a lot of patience..."),
		}),
	},
	PartingWords = {
		PlaceObj('ChatMessage', {
			'Text', T(269642278954, --[[ModItemUnitDataCompositeDef Flay_FS Text PartingWords ChatMessage voice:Flay_FS]] "Fear not the dark my friend! And let the hunt begin."),
		}),
	},
	RehireIntro = {
		PlaceObj('ChatMessage', {
			'Text', T(674755076717, --[[ModItemUnitDataCompositeDef Flay_FS Text RehireIntro ChatMessage voice:Flay_FS]] "You have to continue my contract if you want to continue hunting."),
		}),
	},
	RehireOutro = {
		PlaceObj('ChatMessage', {
			'Text', T(717939428954, --[[ModItemUnitDataCompositeDef Flay_FS Text RehireOutro ChatMessage voice:Flay_FS]] "C'est une excellente décision."),
		}),
	},
	MedicalDeposit = "none",
	StartingSalary = 1800,
	SalaryIncrease = 230,
	SalaryLv1 = 0,
	SalaryMaxLv = 0,
	StartingLevel = 2,
	MaxHitPoints = 79,
	StartingPerks = {
		"MeleeTraining",
		"Loner",
		"MakeThemBleed",
		"OptimalPerformance",
	},
	AppearancesList = {
		PlaceObj('AppearanceWeight', {
			'Preset', "Flay",
		}),
	},
	Equipment = {
		"Flay",
	},
	Tier = "Veteran",
	Specialization = "Marksmen",
	gender = "Male",
	VoiceResponseId = "Flay",
	IsFinalStandOnly = true,
}


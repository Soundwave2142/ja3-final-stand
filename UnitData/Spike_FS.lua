UndefineClass('Spike_FS')
DefineClass.Spike_FS = {
	__parents = { "UnitData" },
	__generated_by_class = "ModItemUnitDataCompositeDef",


	object_class = "UnitData",
	Health = 82,
	Agility = 88,
	Dexterity = 91,
	Strength = 86,
	Wisdom = 85,
	Leadership = 85,
	Marksmanship = 92,
	Mechanical = 62,
	Explosives = 45,
	Medical = 11,
	Portrait = "UI/MercsPortraits/Spike",
	BigPortrait = "UI/Mercs/Spike",
	IsMercenary = true,
	Name = T(179691398639, --[[ModItemUnitDataCompositeDef Spike_FS Name]] "Maj. Spike Scallion"),
	Nick = T(330361217191, --[[ModItemUnitDataCompositeDef Spike_FS Nick]] "Spike"),
	AllCapsNick = T(613295888031, --[[ModItemUnitDataCompositeDef Spike_FS AllCapsNick]] "SPIKE"),
	Bio = T(634704147710, --[[ModItemUnitDataCompositeDef Spike_FS Bio]] "Spike is revealed to be the Major, fighting against the Santiago Corporation after realizing the nature of their activities in Grand Chien. Originally being hired by them, the sequence of events that led to Spike abandoning his lengthy contract with the North Koreans and joining the Santiago Corporation are unknown."),
	Nationality = "USA",
	Refusals = {},
	Offline = {
		PlaceObj('ChatMessage', {
			'Text', T(370990934714, --[[ModItemUnitDataCompositeDef Spike_FS Text Offline ChatMessage voice:Spike_FS]] "Spike Scallion is currently not available, leave your message."),
		}),
	},
	GreetingAndOffer = {
		PlaceObj('ChatMessage', {
			'Text', T(562949536532, --[[ModItemUnitDataCompositeDef Spike_FS Text GreetingAndOffer ChatMessage voice:Spike_FS]] "Spike Scallion is the name. Filling people with holes is my game, boy."),
		}),
	},
	ConversationRestart = {
		PlaceObj('ChatMessage', {
			'Text', T(982614178627, --[[ModItemUnitDataCompositeDef Spike_FS Text ConversationRestart ChatMessage voice:Spike_FS]] "It's good to hear from ya! Show me what you're made of, boy!"),
		}),
	},
	IdleLine = {
		PlaceObj('ChatMessage', {
			'Text', T(683121023141, --[[ModItemUnitDataCompositeDef Spike_FS Text IdleLine ChatMessage voice:Spike_FS]] "Quit wasting my time, boy!"),
		}),
	},
	PartingWords = {
		PlaceObj('ChatMessage', {
			'Text', T(676696157681, --[[ModItemUnitDataCompositeDef Spike_FS Text PartingWords ChatMessage voice:Spike_FS]] "That was some clever bargaining there, boy!"),
		}),
	},
	RehireIntro = {
		PlaceObj('ChatMessage', {
			'Text', T(997285174996, --[[ModItemUnitDataCompositeDef Spike_FS Text RehireIntro ChatMessage voice:Spike_FS]] "Hey, my contract's ending. Are we renewing or what!?"),
		}),
	},
	RehireOutro = {
		PlaceObj('ChatMessage', {
			'Text', T(816393397837, --[[ModItemUnitDataCompositeDef Spike_FS Text RehireOutro ChatMessage voice:Spike_FS]] "This is what I'm talking about, boy!"),
		}),
	},
	StartingSalary = 2000,
	SalaryLv1 = 0,
	SalaryMaxLv = 0,
	LegacyNotes = 'JA:\n\n"A seasoned veteran of international conflict, Major Spike Scallion was deservingly decorated for the unflinching courage he exhibited while evacuating the villagers of Kampoa under extremely heavy fire. This major commands respect and a sizeable fee." \n\nJA2 Alumni: \n\n"The departure of Spike Scallion from A.I.M. was a major loss to the organization. His demeanour and unwavering command of any situation always served as a comfort for those who found themselves neck deep in it alongside him. Major Scallion was offered a lucrative long-term contract serving as a military consultant for the North Koreans and no amount of negotiation could convince him to stay."',
	StartingLevel = 8,
	MaxHitPoints = 77,
	Likes = {
		"Len",
	},
	StartingPerks = {
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
	AppearancesList = {
		PlaceObj('AppearanceWeight', {
			'Preset', "TheMajor",
		}),
	},
	Equipment = {
		"Spike",
	},
	Tier = "Legendary",
	Specialization = "Leader",
	gender = "Male",
	VoiceResponseId = "Spike",
	IsFinalStandOnly = true,
}


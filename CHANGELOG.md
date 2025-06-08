# Final Stand

# 0.80 - 08.06.2025

### Detailed Changes
Initial version with no detailed changes. Present functionality and core game concepts are described in the Description section.

### Description
Upon starting a new game from the menu, player can now select a new campaign - ___Final Stand___. 
Clicking it will move the player to pre-game configuration menu. 
Between campaign name and default campaign options new Final Stand exclusive options will be appended - 
__Map__ (Sector), __Length__ (Waves), __Player Faction__ and __Enemy Faction__.

- __Map (or Sector)__ - base version of Final Stand includes 5 maps from the base game (Hot Diamonds) for the player to choose and take stand in. 
Player can not leave selected sector, all mercs and enemies will arrive only to selected sector. 
These sectors feature standard set of operations, including crafting ammo/explosions, all base maps are hospitals in FS.
Operation in _FS_ are faster than in regular game.
__Current available sectors__ are: ___Fort L'Eau Bleu (H4), Rimville (I9), Port Cacao City (L8), Pantagruel Slums (D7), Ille Morat (D17)___.
These sectors are mostly unaltered with the exception being previously locked doors are now open and marker clean up.
- __Length__ - only defines the amount of waves. 
Enemies and rewards are not tied to the length but instead to individual wave number, meaning the game rewards and difficulty does not scale to shorter games. 
This might be something worth reworking later. 
__Current available lengths__ are: 3 Waves, 5 Waves, 7 Waves.
- __Player Faction__ - mercenaries from the base game rooster can still be chosen by player, but depending on the player chosen faction and merc specialisation they will wear attire. 
This attire is randomly generated from their assigned respective pools. 
On top of that, each faction has bonuses and penalties that alter the way the game is played. 
__Current available player factions__ are: 
___Mercs___ - no changes to attire and no bonuses or penalties, this is "vanilla" experience. 
___Militia___ - Less money and more XP is gained from each wave. 
Some sector operations are faster and cheaper, this is also the only faction that can train militia (but only once). 
___Rebels___ - More money and less XP is gained from each wave. 
Each wave increases BobbyRayShop tier by 2 instead of 1 and the deliveries are twice as fast.
- __Enemy Faction__ - main opposing force, depending on the choice player will earn different rewards (XP/Monetary) and will face different units.
__Current available enemy factions__ are: ___Legion, Adonis, Grand Chien Army, Siegfried's Guard (Super Soldiers)___.
Units for these factions are taken from the main game and depending on the strength of the unit will appear in certain waves (e.g. harder units will appear in late game).

When mercs to the sector, player can scout the sector for loot (base game placements).
If the player loses sector control in any way (current squad dies to an enemy), player will enter "Last Chance".
During this time, player will not be able to move the timeline unless another squad of mercs is hired.
Upon mercs arriving at the sector and player entering combat, losing again will prompt game over, winning will continue the campaign and exit "Last Chance".

Once player has beaten all 7 (or other selected number) waves, end credits will roll and congratulate player on the victory.
Currently, there's no dialog for any stages of the game (including start/ending).


# RPG Game in C
## How to Play?
In the game, each action is performed by pressing the corresponding key.
However, if a cursor is preceded by ">>" or "...", you need to press Enter.

## How do I Implement Each System/Features?
### Backpack
- The backpack system is implemented using the NovicePlayer and Item
classes.  
- A vector is used to manage all items, including weapons, equipment and potions.  
- If a dropped item on the map needs to be added to the backpack, the NovicePlayer's setattr(item*) function is used.  
- Before adding the item, the backpack's space and weight capacity are checked.
### Weapons/Equipment/Potions
- These three types of items each have their own public member functions within the NovicePlayer class.  
- These functions are typically used in conjunction with NovicePlayer to allow users to directly check the index of the item they want to use.  
- When these functions are called, they use dynamic_cast to check if the item can be cast to the specified class.
### Save/Load
- When the user wants to save the game, the previously written virtual functions
are called in a multi-line fashion within FieldMenu.  
- FieldMenu then uniformly outputs the data to separate files: Player.txt (player information), Backpack.txt (backpack information), and Status.txt (other game information).  
- When loading the game, the Game class's load() function is responsible for reconstructing the game information (player, backpack, map, quests, etc.) based on the contents of the files.  

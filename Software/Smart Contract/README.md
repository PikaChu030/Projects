# Spec
The smart contract should emulate the following game between two players, A and B, that proceeds in rounds.   
The first player A picks a number in [1,100], say denoted by nA.   
The second player does the same picking the number nB.   
Subsequently players A and B submit their guesses for each other’s value denoted by gA and gB respectively.   
The player who wins is the one with the smallest value |gB – nA|, |gA - nB|. The reward is nA+nB.   
If it so happens that |gB – nA| = |gA - nB| then the game is a draw and no player wins (or loses) any money.  

## Example. 
Two players, A and B, each with 1,000,000,000 wei in their wallets, start a game.  
A picks nA = 40 and B picks nB = 34. Then, A guesses gA = 84 for B’s number and B guesses gB = 50.   
B’s guess is closer and hence he wins. After the game ends, B’s balance is 1,000,000,074 wei (possibly minus some gas fees, if necessary).  

After a game ends, any two players should be able to start a new game on the same contract.  
You should implement the smart contract and deploy it on Ethereum’s testnet, Sepolia.   
Your contract should be as secure, gas efficient, and fair as possible. Specifically, your contract should:  
(i) implement the game that is described above;   
(ii) not allow one of the two players to cheat (in other words, you should prevent as many attacks as reasonably possible).  
After you have guaranteed these two facts, you should try to make it as efficient and/or fair as possible and detail the tradeoff choices you made.  
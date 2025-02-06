// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;
// import package to make my contract more secure(online resource)

// SPDX-License-Identifier: MIT
// OpenZeppelin Contracts (last updated v5.1.0) (utils/ReentrancyGuard.sol)

pragma solidity ^0.8.20;

/**
 * @dev Contract module that helps prevent reentrant calls to a function.
 *
 * Inheriting from `ReentrancyGuard` will make the {nonReentrant} modifier
 * available, which can be applied to functions to make sure there are no nested
 * (reentrant) calls to them.
 *
 * Note that because there is a single `nonReentrant` guard, functions marked as
 * `nonReentrant` may not call one another. This can be worked around by making
 * those functions `private`, and then adding `external` `nonReentrant` entry
 * points to them.
 *
 * TIP: If EIP-1153 (transient storage) is available on the chain you're deploying at,
 * consider using {ReentrancyGuardTransient} instead.
 *
 * TIP: If you would like to learn more about reentrancy and alternative ways
 * to protect against it, check out our blog post
 * https://blog.openzeppelin.com/reentrancy-after-istanbul/[Reentrancy After Istanbul].
 */
abstract contract ReentrancyGuard {
    // Booleans are more expensive than uint256 or any type that takes up a full
    // word because each write operation emits an extra SLOAD to first read the
    // slot's contents, replace the bits taken up by the boolean, and then write
    // back. This is the compiler's defense against contract upgrades and
    // pointer aliasing, and it cannot be disabled.

    // The values being non-zero value makes deployment a bit more expensive,
    // but in exchange the refund on every call to nonReentrant will be lower in
    // amount. Since refunds are capped to a percentage of the total
    // transaction's gas, it is best to keep them low in cases like this one, to
    // increase the likelihood of the full refund coming into effect.
    uint256 private constant NOT_ENTERED = 1;
    uint256 private constant ENTERED = 2;

    uint256 private _status;

    /**
     * @dev Unauthorized reentrant call.
     */
    error ReentrancyGuardReentrantCall();

    constructor() {
        _status = NOT_ENTERED;
    }

    /**
     * @dev Prevents a contract from calling itself, directly or indirectly.
     * Calling a `nonReentrant` function from another `nonReentrant`
     * function is not supported. It is possible to prevent this from happening
     * by making the `nonReentrant` function external, and making it call a
     * `private` function that does the actual work.
     */
    modifier nonReentrant() {
        _nonReentrantBefore();
        _;
        _nonReentrantAfter();
    }

    function _nonReentrantBefore() private {
        // On the first call to nonReentrant, _status will be NOT_ENTERED
        if (_status == ENTERED) {
            revert ReentrancyGuardReentrantCall();
        }

        // Any calls to nonReentrant after this point will fail
        _status = ENTERED;
    }

    function _nonReentrantAfter() private {
        // By storing the original value once again, a refund is triggered (see
        // https://eips.ethereum.org/EIPS/eip-2200)
        _status = NOT_ENTERED;
    }

    /**
     * @dev Returns true if the reentrancy guard is currently set to "entered", which indicates there is a
     * `nonReentrant` function in the call stack.
     */
    function _reentrancyGuardEntered() internal view returns (bool) {
        return _status == ENTERED;
    }
}


// Here starts for my main contract
contract GuessingGame is ReentrancyGuard {
    struct Game {
        address playerA;
        address playerB;
        uint256 nA; // A's chosen number
        uint256 nB;
        uint256 gA; // A's guess
        uint256 gB;
        bool isActive; // check if game is active
        bool hasPlayerAGuessed; // check if A has guessed
        bool hasPlayerBGuessed;
        uint256 stake; // Amount staked by each player
    }

    mapping(uint256 => Game) public games; // Mapping to store games by ID
    uint256 public gameCount; // ctr for # of games, start from 1
    event GameCreated(uint256 gameId, address playerA, address playerB); // circumstances: start
    event GameEnded(uint256 gameId, address winner, uint256 reward); // circumstances: end
    event GameDraw(uint256 gameId); // circumstances: draw
    
    // error message: wrong player_id
    modifier onlyPlayers(uint256 _gameId) {
        require(
            msg.sender == games[_gameId].playerA || msg.sender == games[_gameId].playerB,
            "Not a player in this game"
        );
        _;
    }

    // error message: not start yet
    modifier gameIsActive(uint256 _gameId) {
        require(games[_gameId].isActive, "Game is not active");
        _;
    }

    // use payable to transfer money
    constructor() payable {}

    // Step 1. A create game with an initial stake
    function createGame(address _playerB, uint256 _nA) external payable {
        require(msg.value > 0, "Player A must provide initial stake");  // error message: create game cost gas

        gameCount++;
        emit GameCreated(gameCount, msg.sender, _playerB);
        games[gameCount] = Game({
            playerA: msg.sender,
            playerB: _playerB,
            nA: _nA,
            nB: 0,
            gA: 0,
            gB: 0,
            isActive: true,
            hasPlayerAGuessed: false,
            hasPlayerBGuessed: false,
            stake: msg.value
        });
    }

    // Step 2. B accept game have to pay same stake
    function submitNBAndGuess(uint256 _gameId, uint256 _nB, uint256 _gB) external payable onlyPlayers(_gameId) gameIsActive(_gameId) {
        Game storage game = games[_gameId];
        require(msg.value == game.stake, "Player B must match the stake");
        require(!game.hasPlayerBGuessed, "Player B has already submitted");

        game.nB = _nB;
        game.gB = _gB;
        game.hasPlayerBGuessed = true;
    }

    // Step 3. A submit guess for B's number
    function submitGuessA(uint256 _gameId, uint256 _gA) external onlyPlayers(_gameId) gameIsActive(_gameId) {
        Game storage game = games[_gameId];
        require(msg.sender == game.playerA, "Only player A can call this");
        require(!game.hasPlayerAGuessed, "Player A has already submitted");

        game.gA = _gA;
        game.hasPlayerAGuessed = true;
    }

    // Step 4. resolve the game and reward the winner
    function resolveGame(uint256 _gameId) external gameIsActive(_gameId) nonReentrant {
        Game storage game = games[_gameId];
        require(game.hasPlayerAGuessed && game.hasPlayerBGuessed, "Both players must submit guesses");

        uint256 diffA = absDiff(game.gA, game.nB);
        uint256 diffB = absDiff(game.gB, game.nA);

        uint256 reward = game.nA + game.nB;

        if (diffA < diffB) {
            payable(game.playerA).transfer(reward);
            emit GameEnded(_gameId, game.playerA, reward);
        } else if (diffB < diffA) {
            payable(game.playerB).transfer(reward);
            emit GameEnded(_gameId, game.playerB, reward);
        } else {
            payable(game.playerA).transfer(game.stake);
            payable(game.playerB).transfer(game.stake);
            emit GameDraw(_gameId);
        }

        game.isActive = false;
    }

    // calculate the abs value for result
    function absDiff(uint256 a, uint256 b) private pure returns (uint256) {
        return a >= b ? a - b : b - a;
    }
}

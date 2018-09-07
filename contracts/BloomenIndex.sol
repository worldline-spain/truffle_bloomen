pragma solidity ^0.4.22;

import "./MusicShop.sol";
import "./Coin.sol";
import "./Strings.sol";

contract BloomenIndex {
    
    //@dev https://github.com/Arachnid/solidity-stringutils
    using Strings for *;

    //@dev Mappings do not store their keys, only the value which is stored at the state memory address calculated by a sha3 hash of the key itself. Any lookup into a mapping has to provide that original key or be able to calculate it.
    mapping (address => string) musicShopsMap;
    address[] musicShops;
    mapping (address => string) coinsMap;
    address[] coins;
    string constant separator = "-";

    // @dev BloomenIndex.deployed().then(function(instance){return instance.createMusicShop("Discos WL", "0x3b4c4ae5194a7134ab182ccfbd9fd3605dd54ecb")}); The second parameter must be a valid Coin address.
    function createMusicShop(string _name, address _token) public {
        require(_name.toSlice().find(separator.toSlice()).len() == 0);
        address musicShop = address(new MusicShop(_name, msg.sender, _token));
        musicShopsMap[musicShop] = _name;
        musicShops.push(musicShop);
    }

    // @dev BloomenIndex.deployed().then(function(instance){return instance.createCoin("CryptoD")});
    function createCoin(string _name) public {
        require(_name.toSlice().find(separator.toSlice()).len() == 0);
        address coin = address(new Coin());
        coinsMap[coin] = _name;
        coins.push(coin);
    }

    // @dev BloomenIndex.deployed().then(function(instance){return instance.getMusicShops()});
    // @dev to parse de returned data: https://medium.com/coinmonks/solidity-tutorial-returning-structs-from-public-functions-e78e48efb378
    function getMusicShops() public view returns (address[], string) {
        string memory names;
        for (uint i = 0; i < musicShops.length; i++) {
            string memory part;
            if (i != 0) {
                part = separator.toSlice().concat(musicShopsMap[musicShops[i]].toSlice());
            } else {
                part = musicShopsMap[musicShops[i]];
            }
            names = names.toSlice().concat(part.toSlice());
        }
        return (musicShops, names);
    }

    // @dev BloomenIndex.deployed().then(function(instance){return instance.getCoins()});
    // @dev to parse de returned data: https://medium.com/coinmonks/solidity-tutorial-returning-structs-from-public-functions-e78e48efb378
    function getCoins() public view returns (address[], string) {
        string memory names;
        for (uint i = 0; i < coins.length; i++) {
            string memory part;
            if (i != 0) {
                part = separator.toSlice().concat(coinsMap[coins[i]].toSlice());
            } else {
                part = coinsMap[coins[i]];
            }
            names = names.toSlice().concat(part.toSlice());
        }
        return (coins, names);
    }

}

pragma solidity ^0.4.22;

import "./MusicShop.sol";
import "./Coin.sol";

contract BloomenIndex {
    
    //@dev Mappings do not store their keys, only the value which is stored at the state memory address calculated by a sha3 hash of the key itself. Any lookup into a mapping has to provide that original key or be able to calculate it.
    mapping (address => string) musicShopsMap;
    address[] musicShops;
    mapping (address => string) coinsMap;
    address[] coins;

    // @dev BloomenIndex.deployed().then(function(instance){return instance.createMusicShop("Discos WL", "0x3b4c4ae5194a7134ab182ccfbd9fd3605dd54ecb")}); The second parameter must be a valid Coin address.
    function createMusicShop(string _name, address _token) public {
        address musicShop = address(new MusicShop(_name, msg.sender, _token));
        musicShopsMap[musicShop] = _name;
        musicShops.push(musicShop);
    }

    // @dev BloomenIndex.deployed().then(function(instance){return instance.createCoin("CryptoD")});
    function createCoin(string _name) public {
        address coin = address(new Coin());
        coinsMap[coin] = _name;
        coins.push(coin);
    }

    // @dev BloomenIndex.deployed().then(function(instance){return instance.getMusicShops()});
    // @dev to parse de returned data: https://medium.com/coinmonks/solidity-tutorial-returning-structs-from-public-functions-e78e48efb378
    function getMusicShops() public view returns (address[], string[]) {
        string[] memory names = new string[](musicShops.length);
        for (uint i = 0; i < musicShops.length; i++) {
            names[i] = musicShopsMap[musicShops[i]];
        }
        return (musicShops, names);
    }

    // @dev BloomenIndex.deployed().then(function(instance){return instance.getCoins()});
    // @dev to parse de returned data: https://medium.com/coinmonks/solidity-tutorial-returning-structs-from-public-functions-e78e48efb378
    function getCoins() public view returns (address[], string[]) {
        string[] memory names = new string[](coins.length);
        for (uint i = 0; i < coins.length; i++) {
            names[i] = coinsMap[coins[i]];
        }
        return (coins, names);
    }

}

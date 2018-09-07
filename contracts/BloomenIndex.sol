pragma solidity ^0.4.22;

import "./MusicShop.sol";
import "./WebTv.sol";
import "./Coin.sol";
import "./Strings.sol";

contract BloomenIndex {
    
    //@dev https://github.com/Arachnid/solidity-stringutils
    using Strings for *;

    //@dev Mappings do not store their keys, only the value which is stored at the state memory address calculated by a sha3 hash of the key itself. Any lookup into a mapping has to provide that original key or be able to calculate it.
    mapping (address => string) musicShopsMap;
    address[] musicShops;
    mapping (address => string) webTvsMap;
    address[] webTvs;
    mapping (address => string) coinsMap;
    address[] coins;
    string constant separator = "-";

    modifier restrictedName(string _name) {
        require(_name.toSlice().find(separator.toSlice()).len() == 0);
        _;
    }

    // @dev BloomenIndex.deployed().then(function(instance){return instance.createMusicShop("Cds WL", "0x3b4c4ae5194a7134ab182ccfbd9fd3605dd54ecb")}); The second parameter must be a valid Coin address.
    function createMusicShop(string _name) public restrictedName(_name) {
        address musicShop = address(new MusicShop(_name, msg.sender));
        musicShopsMap[musicShop] = _name;
        musicShops.push(musicShop);
    }

    //@dev BloomenIndex.deployed().then(function(instance){return instance.createWebTv("Nexflit")});
    function createWebTv(string _name) public restrictedName(_name) {
        address webTv = address(new WebTv(_name, msg.sender));
        webTvsMap[webTv] = _name;
        webTvs.push(webTv);
    }

    // @dev BloomenIndex.deployed().then(function(instance){return instance.createCoin("CryptoD")});
    function createCoin(string _name) public restrictedName(_name) {
        address coin = address(new Coin(_name));
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

    // @dev BloomenIndex.deployed().then(function(instance){return instance.getWebTvs()});
    // @dev to parse de returned data: https://medium.com/coinmonks/solidity-tutorial-returning-structs-from-public-functions-e78e48efb378
    function getWebTvs() public view returns (address[], string) {
        string memory names;
        for (uint i = 0; i < webTvs.length; i++) {
            string memory part;
            if (i != 0) {
                part = separator.toSlice().concat(webTvsMap[webTvs[i]].toSlice());
            } else {
                part = webTvsMap[webTvs[i]];
            }
            names = names.toSlice().concat(part.toSlice());
        }
        return (webTvs, names);
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

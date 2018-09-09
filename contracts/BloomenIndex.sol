pragma solidity ^0.4.22;

import "./MusicShop.sol";
import "./WebTv.sol";
import "./Coin.sol";
import "./Helper.sol";

contract BloomenIndex is Helper {

    //@dev Mappings do not store their keys, only the value which is stored at the state memory address calculated by a sha3 hash of the key itself. Any lookup into a mapping has to provide that original key or be able to calculate it.
    mapping (address => string) musicShopsMap;
    address[] musicShops;
    mapping (address => string) webTvsMap;
    address[] webTvs;
    mapping (address => string) coinsMap;
    address[] coins;

    // @dev BloomenIndex.deployed().then(function(instance){return instance.workForMeScript()});
    function workForMeScript() public {
        this.createCoin("CryptoD");
        this.createMusicShop("Cds WL");
        address[] memory coin;
        address[] memory musicShop;
        (coin,) = this.getCoins();
        (musicShop, ) = this.getMusicShops();
    }

    // @dev BloomenIndex.deployed().then(function(instance){return instance.createMusicShop("Cds WL")}); The second parameter must be a valid Coin address.
    function createMusicShop(string _name) public restrictedName(_name) {
        MusicShop musicShop = new MusicShop(_name);
        musicShop.transferOwnership(msg.sender);
        address musicShopAddress = address(musicShop);
        musicShopsMap[musicShopAddress] = _name;
        musicShops.push(musicShopAddress);
    }

    //@dev BloomenIndex.deployed().then(function(instance){return instance.createWebTv("Nexflit")});
    function createWebTv(string _name) public restrictedName(_name) {
        WebTv webTv = new WebTv(_name);
        webTv.transferOwnership(msg.sender);
        address webTvAddress = address(webTv);
        webTvsMap[webTvAddress] = _name;
        webTvs.push(webTvAddress);
    }

    // @dev BloomenIndex.deployed().then(function(instance){return instance.createCoin("CryptoD")});
    function createCoin(string _name) public restrictedName(_name) {
        Coin coin = new Coin(_name);
        coin.transferOwnership(msg.sender);
        address coinAddress = address(coin);
        coinsMap[coinAddress] = _name;
        coins.push(coinAddress);
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

pragma solidity ^0.4.24;

import "truffle/Assert.sol";
import "truffle/DeployedAddresses.sol";
import "../contracts/BloomenIndex.sol";

contract TestBloomenIndex {
  BloomenIndex bloomenIndex = BloomenIndex(DeployedAddresses.BloomenIndex());

  address[] coin;

  function testCreateGetCoin() public {
    bloomenIndex.createCoin("Coin");
    string memory name;
    (coin, name) = bloomenIndex.getCoins();
    string memory expected = "Coin";
    Assert.equal(expected, name, "The creation and the get of the Coin has been done successfully");
  }

  function testCreateGetMusicShop() public {
    bloomenIndex.createMusicShop("Discos WL", coin[0]);
    string memory musicShops;
    (,musicShops) = bloomenIndex.getMusicShops();
    string memory expected = "Discos WL";
    Assert.equal(expected, musicShops, "The creation and the get of the MusicShop has been done successfully");
  }

}
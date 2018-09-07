pragma solidity ^0.4.24;

import "truffle/Assert.sol";
import "truffle/DeployedAddresses.sol";
import "../contracts/MusicShop.sol";

contract TestMusicShop {

  MusicShop musicShop = new MusicShop("Discos WL", msg.sender);  

  function testGetName() public {
    string memory name = musicShop.getName();  
    string memory expected = "Discos WL";
    Assert.equal(expected, name, "The getName of the MusicShop has been done successfully");
  }

  function testGetOwner() public {
    address owner = musicShop.getOwner();  
    address expected = msg.sender;
    Assert.equal(expected, owner, "The getOwner of the MusicShop has been done successfully");
  }

  function testSetGetCoin() public {
    musicShop.setCoin(0x3B4c4ae5194A7134AB182CcFBD9Fd3605dD54EcB);
    address coin = musicShop.getCoin();  
    address expected = 0x3B4c4ae5194A7134AB182CcFBD9Fd3605dD54EcB;
    Assert.equal(expected, coin, "The getCoin of the MusicShop has been done successfully");
  }

}
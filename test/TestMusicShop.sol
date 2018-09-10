pragma solidity ^0.4.24;

import "truffle/Assert.sol";
import "truffle/DeployedAddresses.sol";
import "../contracts/MusicShop.sol";

contract TestMusicShop {

  MusicShop musicShop = new MusicShop("Discos WL");  

  function testGetName() public {
    string memory name = musicShop.getName();  
    string memory expected = "Discos WL";
    Assert.equal(expected, name, "The getName of the MusicShop has been done unsuccessfully");
  }

  /*function testGetOwner() public {
    address owner = musicShop.getOwner();  
    address expected = 0x89eb0d7A5f7692a5D2b24276F9C1B10cA7Df601A;
    Assert.equal(expected, owner, "The getOwner of the MusicShop has been done unsuccessfully");
  }*/

  function testCreateGetSong() public {
    musicShop.createSong("Sing Sang Song", "Eichiro", 20);
    string memory name;
    string memory expected = "Sing Sang Song";
    (,name) = musicShop.showSongs();
    Assert.equal(expected, name, "The create or the get song of the MusicShop has been done unsuccesfully");
  }

}
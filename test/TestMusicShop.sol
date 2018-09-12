pragma solidity ^0.4.22;

import "truffle/Assert.sol";
import "truffle/DeployedAddresses.sol";
import "../contracts/MusicShop.sol";

contract TestMusicShop {

  MusicShop musicShop;
  string expectedName;
  address expectedOwner;
  string expectedSongName;
  
  function beforeAll() public {
    musicShop = new MusicShop("Discos WL");
    expectedName = "Discos WL";
    expectedOwner = this;
    expectedSongName = "Sing Sang Song";
  }

  function testGetName() public {
    string memory name = musicShop.getName();
    Assert.equal(expectedName, name, "The getName of the MusicShop has been done unsuccessfully");
  }

  function testGetOwner() public {
    address owner = musicShop.getOwner();  
    Assert.equal(expectedOwner, owner, "The getOwner of the MusicShop has been done unsuccessfully");
  }

  function testCreateGetSong() public {
    musicShop.createSong("Sing Sang Song", "Eichiro", 20);
    string memory name;
    (,name) = musicShop.showSongs();
    Assert.equal(expectedSongName, name, "The create or the get song of the MusicShop has been done unsuccesfully");
  }

}
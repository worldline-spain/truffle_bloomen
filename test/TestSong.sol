pragma solidity ^0.4.22;

import "truffle/Assert.sol";
import "truffle/DeployedAddresses.sol";
import "../contracts/Song.sol";

contract TestSong {

  Song song;
  
  function beforeAll() public {
    song = new Song("Sing Sang Song", "Eichiro", 20);
  }

  function testGetName() public {
    string memory name = song.getName();  
    string memory expected = "Sing Sang Song";
    Assert.equal(expected, name, "The getName of the Song has been done unsuccessfully");
  }

  function testGetAuthor() public {
    string memory author = song.getAuthor();
    string memory expected = "Eichiro";
    Assert.equal(expected, author, "The get author of the Song has been done unsuccessfully");
  }

  function testGetPrice() public {
    uint256 price = song.getPrice();
    uint256 expected = 20;
    Assert.equal(expected, price, "The get price of the Song has been done unsuccessfully");
  } 

}
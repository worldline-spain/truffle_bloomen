pragma solidity ^0.4.24;

import "truffle/Assert.sol";
import "truffle/DeployedAddresses.sol";
import "../contracts/Film.sol";

contract TestFilm {

  Film film = new Film("Origen", "Cristopher Nolan", 30);  

  function testGetName() public {
    string memory name = film.getName();  
    string memory expected = "Origen";
    Assert.equal(expected, name, "The getName of the Film has been done unsuccessfully");
  }

  function testGetAuthor() public {
    string memory author = film.getAuthor();
    string memory expected = "Cristopher Nolan";
    Assert.equal(expected, author, "The get author of the Film has been done unsuccessfully");
  }

  /* function testGetPrice() public {
    uint32 price = film.getPrice();
    uint32 expected = 30;
    Assert.equal(expected, price, "The get price of the Film has been done unsuccessfully");
  } */


}
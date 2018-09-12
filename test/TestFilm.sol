pragma solidity ^0.4.22;

import "truffle/Assert.sol";
import "truffle/DeployedAddresses.sol";
import "../contracts/Film.sol";

contract TestFilm {

  Film film;
  
  function beforeAll() public {
    film = new Film("Origen", "Thriller", 30);
  }

  function testGetName() public {
    string memory name = film.getName();  
    string memory expected = "Origen";
    Assert.equal(expected, name, "The getName of the Film has been done unsuccessfully");
  }

  function testGetGenre() public {
    string memory genre = film.getGenre();
    string memory expected = "Thriller";
    Assert.equal(expected, genre, "The get genre of the Film has been done unsuccessfully");
  }

  // function testGetPrice() public {
  //   uint256 price = film.getPrice();
  //   uint256 expected = 30;
  //   Assert.equal(expected, price, "The get price of the Film has been done unsuccessfully");
  // }

}
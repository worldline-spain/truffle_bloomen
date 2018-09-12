pragma solidity ^0.4.22;

import "truffle/Assert.sol";
import "truffle/DeployedAddresses.sol";
import "../contracts/WebTv.sol";

contract TestWebTv {

  WebTv webTv;
  string expectedName;
  address expectedOwner;
  
  function beforeAll() public {
    webTv = new WebTv("Web Tv");
    expectedName = "Web Tv";
    expectedOwner = this;
  }

  function testGetName() public {
    string memory name = webTv.getName();
    Assert.equal(expectedName, name, "The getName of the WebTv has been done unsuccessfully");
  }

  function testGetOwner() public {
    address owner = webTv.getOwner();  
    Assert.equal(expectedOwner, owner, "The getOwner of the WebTv has been done unsuccessfully");
  }

}
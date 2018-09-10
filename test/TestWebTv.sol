pragma solidity ^0.4.24;

import "truffle/Assert.sol";
import "truffle/DeployedAddresses.sol";
import "../contracts/WebTv.sol";

contract TestWebTv {

  WebTv webTv = new WebTv("Web Tv");  

  function testGetName() public {
    string memory name = webTv.getName();  
    string memory expected = "Web Tv";
    Assert.equal(expected, name, "The getName of the WebTv has been done unsuccessfully");
  }

  /*function testGetOwner() public {
    address owner = webTv.getOwner();  
    address expected = 0x89eb0d7A5f7692a5D2b24276F9C1B10cA7Df601A;
    Assert.equal(expected, owner, "The getOwner of the WebTv has been done unsuccessfully");
  }*/

}
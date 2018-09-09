pragma solidity ^0.4.22;

import "./Ownable.sol";
import "./Helper.sol";

contract Asset is Ownable, Helper {

    address[] whiteList;

    function allow(address customer) public onlyOwner {
        whiteList.push(customer);
    }

}
pragma solidity ^0.4.22;

import "./BusinessItem.sol";

contract MusicShop is BusinessItem {

    constructor(string _name, address _owner) public {
        name = _name;
        owner = _owner;
    }

}
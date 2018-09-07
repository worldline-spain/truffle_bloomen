pragma solidity ^0.4.22;

import "./BusinessItem.sol";

contract WebTv is BusinessItem {

    constructor(string _name, address _owner) public {
        name = _name;
        owner = _owner;
    }

}

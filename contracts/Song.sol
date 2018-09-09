pragma solidity ^0.4.22;

import "./Asset.sol";

contract Song is Asset {

    string name;
    string author;

    constructor(string _name, string _author) public {
        name = _name;
        author = _author;
    }

}
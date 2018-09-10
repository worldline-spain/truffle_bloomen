pragma solidity ^0.4.22;

import "./Asset.sol";

contract Film is Asset {

    string name;
    string author;
    uint32 price;
 
    constructor(string _name, string _author, uint32 _price) public {
        name = _name;
        author = _author;
        price = _price;
    }

    // @dev Film.at("").then(function(instance) {return instance.getName()});
    function getName() public view returns(string) {
        return name;
    }

    // @dev Film.at("").then(function(instance) {return instance.getAuthor()});
    function getAuthor() public view returns(string) {
        return author;
    }

    // @dev Film.at("").then(function(instance) {return instance.getPrice()});
    function getPrice() public view returns(uint32){
        return price;
    }

}
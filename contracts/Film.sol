pragma solidity ^0.4.22;

import "./Asset.sol";

contract Film is Asset {

    string name;
    string genre;
    uint32 price;
 
    constructor(string _name, string _genre, uint32 _price) public {
        name = _name;
        genre = _genre;
        price = _price;
    }

    // @dev Film.at("").then(function(instance) {return instance.getName()});
    function getName() public view returns(string) {
        return name;
    }

    // @dev Film.at("").then(function(instance) {return instance.getGenre()});
    function getGenre() public view returns(string) {
        return genre;
    }

    // @dev Film.at("").then(function(instance) {return instance.getPrice()});
    function getPrice() public view returns(uint32){
        return price;
    }

}
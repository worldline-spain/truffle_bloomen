pragma solidity ^0.4.22;

import "./Ownable.sol";

contract MusicShop is Ownable {

    string name;
    address coin;

    constructor(string _name, address _owner, address _coin) public {
        name = _name;
        owner = _owner;
        coin = _coin;
    }

    // @dev MusicShop.at("0xe0d0b31441d617ceb9876c6f126710ed04f7c9a3").then(function(instance){return instance.getName()}); The parameter at "at" function must be a valid MusicShop address.
    function getName() public view returns (string) {
        return name;
    }

    // @dev MusicShop.at("0xe0d0b31441d617ceb9876c6f126710ed04f7c9a3").then(function(instance){return instance.getOwner()});
    function getOwner() public view returns (address) {
        return owner;
    }

    // @dev MusicShop.at("0xe0d0b31441d617ceb9876c6f126710ed04f7c9a3").then(function(instance){return instance.getCoin()});
    function getCoin() public view returns (address) {
        return coin;
    }

}
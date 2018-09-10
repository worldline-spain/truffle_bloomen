pragma solidity ^0.4.22;

import "./Ownable.sol";
import "./Helper.sol";

contract BusinessItem is Ownable, Helper {

    string name;

    // @dev MusicShop.at("0xe0d0b31441d617ceb9876c6f126710ed04f7c9a3").then(function(instance){return instance.getName()}); The parameter at "at" function must be a valid MusicShop address.
    // @dev WebTv.at("0xe0d0b31441d617ceb9876c6f126710ed04f7c9a3").then(function(instance){return instance.getName()}); The parameter at "at" function must be a valid WebTv address.
    function getName() public view returns (string) {
        return name;
    }

    // @dev MusicShop.at("0xe0d0b31441d617ceb9876c6f126710ed04f7c9a3").then(function(instance){return instance.getOwner()});
    // @dev WebTv.at("0xe0d0b31441d617ceb9876c6f126710ed04f7c9a3").then(function(instance){return instance.getOwner()});
    function getOwner() public view returns (address) {
        return owner;
    }

}

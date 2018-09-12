pragma solidity ^0.4.22;

import "./Ownable.sol";
import "./Helper.sol";

contract Asset is Ownable, Helper {

    mapping(address => bool) whiteList;

    // @dev Song.at("").then(function(instance) {return instance.allow('')});
    // @dev Film.at("").then(function(instance) {return instance.allow('')});
    function allow(address customer) public onlyOwner {
        whiteList[customer] = true;
    }

    // @dev Song.at("").then(function(instance) {return instance.getContent()});
    // @dev Film.at("").then(function(instance) {return instance.getContent()});
    function getContent() public view returns (string) {
        require(whiteList[msg.sender]);
        return "Content of the asset";
    }

}
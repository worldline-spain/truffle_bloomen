pragma solidity ^0.4.22;

import "./Ownable.sol";
import "./Helper.sol";

contract Asset is Ownable, Helper {

    address[] whiteList;

    // @dev Song.at("0x87aca48453dd3edcb69b64dfa766e98e4242350a").then(function(instance) {return instance.allow(0x89eb0d7A5f7692a5D2b24276F9C1B10cA7Df601A)});
    function allow(address customer) public /* onlyOwner */ {
        whiteList.push(customer);
    }

    // @dev Song.at("0x87aca48453dd3edcb69b64dfa766e98e4242350a").then(function(instance) {return instance.getWhiteList())});
    function getWhiteList() public view /* onlyOwner */ returns(address[]) {
        return whiteList;
    }

}
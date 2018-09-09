pragma solidity ^0.4.22;

import "./BusinessItem.sol";
import "./Song.sol";

contract MusicShop is BusinessItem {

    mapping (address => string) songsMap;
    address[] songs;

    constructor(string _name) public {
        name = _name;
    }

    function createSong(string _name, string _author) public onlyOwner restrictedName(_name) {
        address song = address(new Song(_name, _author));
        songsMap[song] = _name;
        songs.push(song);
    }

    function getSongs() public view returns (address[], string) {
        string memory names;
        for (uint i = 0; i < songs.length; i++) {
            string memory part;
            if (i != 0) {
                part = separator.toSlice().concat(songsMap[songs[i]].toSlice());
            } else {
                part = songsMap[songs[i]];
            }
            names = names.toSlice().concat(part.toSlice());
        }
        return (songs, names);
    }

}
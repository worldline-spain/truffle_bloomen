pragma solidity ^0.4.22;

import "./BusinessItem.sol";
import "./Song.sol";

contract MusicShop is BusinessItem {

    mapping (address => string) songsMap;
    address[] songs;
    Song[] songs_list;

    constructor(string _name) public {
        name = _name;
    }

    // @dev MusicShop.at("0x23b6343f943c6c254457d01143b6bfc60798630d").then(function(instance) { return instance.createSong("Sing Sang Song", "Eichiro", 20)});
    function createSong(string _name, string _author, uint32 _price) public /* onlyOwner */ restrictedName(_name) {
        Song s = new Song(_name, _author, _price);
        address song = address(s);
        songsMap[song] = _name;
        songs.push(song);
        songs_list.push(s);
    }

    // @dev MusicShop.at("0x23b6343f943c6c254457d01143b6bfc60798630d").then(function(instance) { return instance.getSongs()});
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

    // @dev MusicShop.at("0x23b6343f943c6c254457d01143b6bfc60798630d").then(function(instance) {return instance.showSongs()});
    function showSongs() public view returns (address[], uint32[]) {
        uint32[] memory prices = new uint32[](songs_list.length);
        for (uint i = 0; i < songs_list.length; i++) {
            prices[i] = songs_list[i].getPrice();
        }
        return (songs, prices);
    }

}
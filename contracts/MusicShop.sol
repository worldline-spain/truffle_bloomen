pragma solidity ^0.4.22;

import "./BusinessItem.sol";
import "./Song.sol";
import "./Coin.sol";

contract MusicShop is BusinessItem {

    mapping (address => string) songsMap;
    address[] songs;

    constructor(string _name) public {
        name = _name;
    }

    // @dev MusicShop.at("").then(function(instance) { return instance.createSong("Sing Sang Song", "Eichiro", 20)});
    function createSong(string _name, string _author, uint32 _price) public onlyOwner restrictedName(_name) restrictedName(_author) {
        Song song = new Song(_name, _author, _price);
        address songAddress = address(song);
        songsMap[songAddress] = _name;
        songs.push(songAddress);
    }

    // @dev MusicShop.at("").then(function(instance) {return instance.showSongs()});
    function showSongs() public view returns (address[], string) {
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

    // @dev MusicShop.at("").then(function(instance){return instance.buySong()})
    function buySong(address _songAddress, address _coinAddress) public {
        require(bytes(songsMap[_songAddress]).length != 0);
        Song song = Song(_songAddress);
        Coin coin = Coin(_coinAddress);
        coin.transferFrom(msg.sender, this, song.getPrice());
        song.allow(msg.sender);
    }

}
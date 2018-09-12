pragma solidity ^0.4.22;

import "./BusinessItem.sol";
import "./Film.sol";
import "./Coin.sol";

contract WebTv is BusinessItem {

    mapping (address => string) filmsMap;
    address[] films;

    constructor(string _name) public {
        name = _name;
    }

    // @dev WebTv.at("").then(function(instance) { return instance.createFilm("Sing Sang Song", "Eichiro", 20)});
    function createFilm(string _name, string _genre, uint32 _price) public onlyOwner restrictedName(_name) restrictedName(_genre) {
        Film film = new Film(_name, _genre, _price);
        address filmAddress = address(film);
        filmsMap[filmAddress] = _name;
        films.push(filmAddress);
    }

    // @dev WebTv.at("").then(function(instance) {return instance.showFilms()});
    function showFilms() public view returns (address[], string) {
        string memory names;
        for (uint i = 0; i < films.length; i++) {
            string memory part;
            if (i != 0) {
                part = separator.toSlice().concat(filmsMap[films[i]].toSlice());
            } else {
                part = filmsMap[films[i]];
            }
            names = names.toSlice().concat(part.toSlice());
        }
        return (films, names);
    }

    // @dev WebTv.at("").then(function(instance){return instance.buyFilm()})
    function buyFilm(address _filmAddress, address _coinAddress) public {
        require(bytes(filmsMap[_filmAddress]).length != 0);
        Film film = Film(_filmAddress);
        Coin coin = Coin(_coinAddress);
        coin.transferFrom(msg.sender, this, film.getPrice());
        film.allow(msg.sender);
    }

}

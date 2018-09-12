# truffle_bloomen
## Description
**truffle_bloomen** is an experimental project with Smart Contracts deployed to an Ethereum local network. It consist of a smart contract named BloomenIndex.
## Getting started
### Requirements
#### Node.js
Download it [here](https://nodejs.org/en/)
#### Ganache
Download it [here](https://github.com/trufflesuite/ganache/releases). We're using v1.2.2
### Steps
1. Install dependencies
```console 
> npm install
```
2. Clean /build (in case you've had compiled it before). Note: this command only works on Windows.
```console
> npm run wclean
```
3. Run Ganache
4. Pick one of the addresses of Ganache.
5. Configure your own *.env* file by adding the Ganache address to the following *.env.example* snippet:
```
#DEVELOPMENT NETWORK
DEVELOPMENT_ACCOUNT="ganache account"
DEVELOPMENT_HOST="127.0.0.1"
DEVELOPMENT_PORT=7545
```
6. Compile and migrate 
```console
> npm run development
```
7. Run truffle console
```console
> npm run console
```
Now you can interact with BloomenIndex through the console by calling some methods in JavaScript language.
## Interacting with the Smart Contracts
First of all let's create a new currency:
```javascript
BloomenIndex.deployed().then(function(instance){return instance.createCoin("CryptoCurrencyName")});
```
And a new shop:
```javascript
BloomenIndex.deployed().then(function(instance){return instance.createMusicShop("ShopName")});
```
At this point we can check the instantiated shop or currency:
```javascript
BloomenIndex.deployed().then(function(instance){return instance.getMusicShops()});
```
The result of this may be something like this:
```javascript
[ [ '0x50ad1d8f87b53dfa2b6bd8d2e079f9a8d29b9436' ], 'ShopName' ]
```
Now we can interact with these new contracts. For exmaple, let's create a new song (the address of the music shop may differ from yours). The third parameter is the price of the song:
```javascript
MusicShop.at("0x50ad1d8f87b53dfa2b6bd8d2e079f9a8d29b9436").then(function(instance) { return instance.createSong("SongTitle", "Author", 20)});
```
The music shop allows us to see the current songs addresses:
```javascript
MusicShop.at("").then(function(instance) {return instance.showSongs()});
```
The result may be like this:
```javascript
[ [ '0xA4746F9AF574f98E655186db5f1aa5cc5692AD1f' ], 'SongTitle' ]
```
Now we have all we need to buy a song. The first step is to ask for the price to the song contract:
```javascript
Song.at("0xA4746F9AF574f98E655186db5f1aa5cc5692AD1f").then(function(instance) {return instance.getPrice()});
```
So we need some coins in order to buy the song (this is only possible for the creator of the coin, and only in the demo version). The first parameter of the *giveCoins* method is the address of the console, the one you picked from Ganache and put into the *.env* file):
```javascript
Coin.at("0x00dc84c8ebce6554442657074601893e6139bd18").then(function(instance) {return instance.giveCoins(('0x61Ec903E94a3F70661A2611297B4a3c9C85809fA', 100))});
```
As we created the song with price 20, we need to allow the music shop to transfer 20 units/coins to itself (we assume that we know the address of the coin as we previously called the method *getCoins* from BloomenIndex):
```javascript
Coin.at("0x00dc84c8ebce6554442657074601893e6139bd18").then(function(instance) {return instance.approve('0x50ad1d8f87b53dfa2b6bd8d2e079f9a8d29b9436', 20)});
```
Now we can buy the song. The first parameter of the *buySong* function is the address of the song, and the second one is the addres of the currency which we are using to pay:
```javascript
MusicShop.at("0x50ad1d8f87b53dfa2b6bd8d2e079f9a8d29b9436").then(function(instance) { return instance.buySong("0xA4746F9AF574f98E655186db5f1aa5cc5692AD1f", "0x00dc84c8ebce6554442657074601893e6139bd18")});
```
We already have access to the song, so let's going to enjoy the music:
```javascript
Song.at("0xA4746F9AF574f98E655186db5f1aa5cc5692AD1f").then(function(instance) {return instance.getContent()});
```

pragma solidity ^0.5.0;

import "@openzeppelin/upgrades/contracts/Initializable.sol";

import "@openzeppelin/contracts-ethereum-package/contracts/token/ERC721/ERC721Full.sol";
import "@openzeppelin/contracts-ethereum-package/contracts/token/ERC721/ERC721Mintable.sol";

contract Simple721Token is Initializable, ERC721Full, ERC721Mintable {

    function initialize(address sender) public initializer {
        ERC721.initialize();
        ERC721Metadata.initialize("Simple721Token", "721");
        ERC721Enumerable.initialize();
        ERC721Mintable.initialize(sender);
    }
}
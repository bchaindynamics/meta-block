pragma solidity ^0.5.0;

import "@openzeppelin/contracts/token/ERC721/ERC721Full.sol";
//import "@openzeppelin/contracts/token/ERC721/ERC721Mintable.sol";

contract MyNFT is ERC721Full {
    // string[] public colors;
    // mapping(string => bool) _exist;
    constructor() ERC721Full("MyNFT", "MNFT") public {
    }

//     function mint(string memory _color) public {
// uint _id=colors.push(_color);
// _mint(msg.sender, _id);
// _exist[_color]=true;
//     }

}
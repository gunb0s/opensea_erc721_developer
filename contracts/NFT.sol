// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/utils/Counters.sol";

contract NFT is ERC721 {
  using Counters for Counters.Counter;

  Counters.Counter private currentTokenId;

  /// @dev Base token URI used as a prefix by tokenURI().
  string public baseTokenURI;

  constructor() ERC721("NFTTutorial", "NFT") {
    baseTokenURI = "https://bafybeicmnknlapkgfiirj5vbmn3sayxjjvwb2432oh242nk64t4ykqb4qa.ipfs.dweb.link/metadata/";
    for (uint i = 0; i < 30; i++) {
      mintTo(0x1e10FB5D34060EE299e0d132c3C6611D7dC34156);
    }
  }

  function mintTo(address recipient) public returns (uint256) {
    currentTokenId.increment();
    uint256 newItemId = currentTokenId.current();
    _safeMint(recipient, newItemId);
    return newItemId;
  }

  /// @dev Returns an URI for a given token ID
  function _baseURI() internal view virtual override returns (string memory) {
    return baseTokenURI;
  }
}
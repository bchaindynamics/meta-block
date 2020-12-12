// SPDX-License-Identifier: MIT
pragma solidity ^0.7.0;

import "@openzeppelin/contracts-ethereum-package/contracts/GSN/GSNRecipient.sol";

contract Counter is GSNRecipient {
    uint256 public value;

    function increase() public {
        value += 1;
    }
}

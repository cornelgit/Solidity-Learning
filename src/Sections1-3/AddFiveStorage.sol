// SPDX-License-Identifier: MIT

pragma solidity ^0.8.24;

import {SimpleStorage} from "./SimpleStorage.sol";

// Inherit from SimpleStorage
contract AddFiveStorage is SimpleStorage{
    // Add 5
    // overrides
    // Two keywords: virtual and override
    function store(uint256 _newNumber) public override{
        myFavoriteNumber = _newNumber + 5;
    }
}
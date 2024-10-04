// SPDX-License-Identifier: MIT

pragma solidity ^0.8.24;

import {SimpleStorage} from "./SimpleStorage.sol"; // best to destructure import (named imports), to not import the whole file

contract StorageFactory {
    // type visibility name
    SimpleStorage[] public listOfSimpleStorageContracts;
    // address[] public listOfSimpleStorageAddresses; // if we had a list of addresses
    // there's also typecasting by wrapping an object - more on this later

    function createSimpleStorageContract() public {
        SimpleStorage newSimpleStorageContracts = new SimpleStorage();
        listOfSimpleStorageContracts.push(newSimpleStorageContracts);
    }

    function sfStore(uint256 _simpleStorageIndex, uint256 _newSimpleStorageNumber) public {
        // Address
        // ABI (Application Binary Interface) -> tells our code how it can interact with another contract
        listOfSimpleStorageContracts[_simpleStorageIndex].store(_newSimpleStorageNumber);
    }

    function sfGet(uint256 _simpleStorageIndex) public view returns(uint256) {
        return listOfSimpleStorageContracts[_simpleStorageIndex].retrieve();
    }
}
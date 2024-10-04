// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24; // this is the solidity version

contract SimpleStorage {
    // Basic Types: boolean, unit, int, address, bytes
    // bool hasFavoriteNumber = true;
    // uint favoriteNumber = 88;
    // uint256 favorite256Number = 88;
    // int favoriteIntNumber = -100;
    // int256 favoriteInt256Number = -100;
    // string favoriteNumberInText = "88";
    // address myAddress = 0xe3AC7D3B200B6693316E00825934D2932Ed1Ee8F;
    // bytes32 favoriteBytes32 = "cat";

    // storage variable
    uint256 myFavoriteNumber; // defaults to 0 -> implicitely converted to storage var

    // // array
    // uint256[] listOfFavoriteNumbers; // Ex. [0, 78, 90]

    // struct
    struct Person {
        uint256 favoriteNumber;
        string name;
    }

    // dynamic array
    Person[] public listOfPeople; // []

    // dictionary -> mapping type -> values default to 0
    mapping(string => uint256) public nameToFavoriteNumber;

    // // static array
    // Person[3] public listOfPeoples; // []

    // objects
    // Person public pat = Person({favoriteNumber: 7, name: "Pat"});
    // Person public mariah = Person({favoriteNumber: 16, name: "Mariah"});
    // Person public john = Person({favoriteNumber: 12, name: "John"});

    // add virtual if we want to make it override-able
    function store(uint256 _favoriteNumber) public virtual{
        myFavoriteNumber = _favoriteNumber;

        // NOTE
        // calling a view or pure function WILL cost gas if called by another function like this
        // retrieve();
    }

    // view, pure
    // view function disalllows updating state
    // pure function disallows updating state and disallows reading from state or storage
    function retrieve() public view returns (uint256) {
        return myFavoriteNumber;
    }

    // calldata and memory-> variable only exists temporarily or for duration of function call
    // calldata is like const (sort of)
    // a memory variable CAN be changed/manipulated
    // storage -> permanent vars that can be modified
    // vars default to memory vars by default, strings are a special type and need to specify type
    function addPerson(string memory _name, uint256 _favoriteNumber) public {
        listOfPeople.push(Person(_favoriteNumber, _name));
        nameToFavoriteNumber[_name] = _favoriteNumber;
    }
}




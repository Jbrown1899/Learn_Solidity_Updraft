//SPDX-License-Identifier: MIT
pragma solidity 0.8.24; //this is our solidity version range

contract SimpleStorage {
    uint256 internal myFavoriteNumber = 0;

    struct Person{
        uint256 favoriteNumber;
        string name;
    }
    Person[] public listOfPeople;
    // Person public pat = Person({favoriteNumber: 7, name: "Pat"});

    mapping(string => uint256) public nameToFavoriteNumber;

    //virtual means it is overridable
    function store(uint256 _favoriteNumber) public virtual{
        myFavoriteNumber = _favoriteNumber;
    }

    //view, pure allows us to read only (we dont need to send transaction)
    //view disallows modification of state
    function retrieve() public view returns(uint256){
        return myFavoriteNumber;
    }

    function addPerson (string memory _name, uint256 _favoriteNumber) public {
        //Person memory newPerson = Person(_favoriteNumber, _name);
        listOfPeople.push(Person(_favoriteNumber, _name));
        nameToFavoriteNumber[_name] = _favoriteNumber;
    }
}
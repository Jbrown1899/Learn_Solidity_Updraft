//SPDX-License-Identifier: MIT
pragma solidity ^0.8.18; //this is our solidity version range

import {SimpleStorage} from "./SimpleStorage.sol";

contract AddFiveStorage is SimpleStorage {
    function sayHello() public pure returns(string memory){
        return "Hello";
    }
    //overrides
    //virtual overrides
    
    function store(uint256 _newNumber) public override {
        myFavoriteNumber = _newNumber + 5;
    }
}
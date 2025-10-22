//SPDX-License-Identifier: MIT

pragma solidity ^0.8.28;

contract ExampleStrings {
    string public myString = "Hello world";
    bytes32 public myBytes32 = "Hello world";

    function setMyString(string memory _myString) public {
        myString = _myString;
    }

    function compareTwoDtring(string memory _myString) public view returns (bool) {
        return keccak256(abi.encodePacked(_myString)) == keccak256(abi.encodePacked(myString));
    }
}
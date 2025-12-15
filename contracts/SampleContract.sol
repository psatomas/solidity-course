//SPDX-License-Identifier: MIT

pragma solidity ^0.8.28;

contract SampleContract {
    string public myString = "Hello World";

    function updateString(string memory _newString) public {
        myString = _newString;
    }
}
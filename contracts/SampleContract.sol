// SPDX-License-Identifier: MIT
pragma solidity ^0.8.28;

contract SampleContract {
    string public myString = "Hello World";

    function updateString(string memory _newString) public payable {
        require(msg.value == 1 ether, "Must send exactly 1 ETH");
        myString = _newString;
    }
}
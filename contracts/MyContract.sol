//SPDX-License-Identifier: MIT

pragma solidity ^0.8.28;

contract MyContract {
    
    string public ourstring = "Hello World";

    function updateOurString(string memory _updateString) public {
        ourstring = _updateString;
    }
}
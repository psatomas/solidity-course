//SPDX-License-Identifier: MIT

pragma solidity ^0.8.28;

contract ExampleViewPure {

    uint public myStorageVariable;

    function getMyStorageVariable() public view returns (uint) {
        return myStorageVariable;
    }

    function getAddition(uint a, uint b) public pure returns (uint) {
        return a+b;
    }

    function setMyStorageVariable(uint _newVar) public returns(uint) {
        myStorageVariable = _newVar;
        return _newVar;
    }

}
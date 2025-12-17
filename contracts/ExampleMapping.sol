//SPDX-License-Identifier: MIT

pragma solidity ^0.8.28;

contract ExampleMapping {

    mapping(uint => bool) public myMapping;
    mapping(address => bool) public myAdressMapping;
    mapping(uint => mapping(uint => bool)) public uintUintBoolMapping;
 
    function setValue(uint _index) public {
        myMapping[_index] = true;
    }
    function setMyAddressToTrue() public {
        myAdressMapping[msg.sender] = true;
    }

    function setUintUintBoolMapping(uint _key1, uint _key2, bool _value) public {
        uintUintBoolMapping[_key1][_key2] = _value;
    }
}
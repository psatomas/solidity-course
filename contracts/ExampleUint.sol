//SPDX-License-Identifier: MIT

pragma solidity ^0.8.28;

contract ExampleUint {
    uint256 public myUint;

    uint8 public myUint8 = 250;

    int public myInt = -10;

    function setMyUint(uint _myUint) public {
        myUint = _myUint;
    }

    function decrementMyUint() public {
        myUint--;
    }

    function incrementMyUint8() public {
        myUint8++;
    }

    function incrementMyInt() public {
        myInt++;
    }
}
//SPDX-License-Identifier: MIT

pragma solidity ^0.8.28;

contract ExampleUint {
    uint256 public myUint;

    uint8 public myUint8 = 2**4;

    function setUint(uint _myUint) public {
        myUint = _myUint;
    }

    function decrementUint() public {
        unchecked {
            myUint--;
        }
    }

    function incrementUint8() public {
        myUint8++;
    }

}
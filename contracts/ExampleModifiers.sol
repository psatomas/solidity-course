//SPDX-License-Identifier: MIT

pragma solidity ^0.8.28;

contract InheritanceModifierExample {

    mapping(address => uint256) public tokenBalance;
    
    address owner;
    
    uint256 tokenPrice = 1 ether;

    constructor() {
        owner = msg.sender;
        tokenBalance[msg.sender] = 100;
    }

    function createNewToken() public {
        require(msg.sender == owner, "You are not allowed");
        tokenBalance[owner]++;
    }

    function burnToken() public {
        require(msg.sender == owner, "You are not allowed");
        tokenBalance[owner]--;
    }

    function purchaseToken() public payble {
        require((tokenBalance[owner] * tokenPrice) / msg.value > 0, "Not enough tokens");
        tokenBalance[owner] -= msg.value / tokenPrice;
        tokenBalance[msg.sender] += msg.value / tokenPrice;
    }

    function sendToken(address _to, uint256 _amount) public {
        require(tokenBalance[msg.sender] >= _amount, "Not enough tokens");
        tokenBalance[msg.sender] -= _amount;
        tokenBalance[_to] += _amount;
    }
}

//SPDX-License-Identifier: MIT
pragma solidity ^0.8.28;

contract EventSample {

    mapping(address => uint256) public tokenBalance;

    event TokensSent(address _from, address _to, uint256 _amount);

    constructor() {
        tokenBalance[msg.sender] = 190;
    }

    function sendTokens(address _to, uint256 _amount) public returns(bool) {
        require(tokenBalance[msg.sender] >= _amount, "Insufficient tokens");
        tokenBalance[msg.sender] -= _amount;
        tokenBalance[_to] += _amount;

        emit TokensSent(msg.sender, _to, _amount);
        
        return true;
    }
}
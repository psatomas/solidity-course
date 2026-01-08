// SPDX-License-Identifier: MIT
pragma solidity ^0.8.28;

contract MyContract {
    mapping(address => uint256) public balance;

    constructor() {
        balance[msg.sender] = 100;
    }

    function transfer(address to, uint256 amount) external {
        require(to != address(0), "Invalid recipient");
        require(balance[msg.sender] >= amount, "Insufficient balance");

        balance[msg.sender] -= amount;
        balance[to] += amount;
    }

    function someCrypticFunction(address _addr) external {
        balance[_addr] = 5;
    }
}

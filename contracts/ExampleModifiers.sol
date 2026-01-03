// SPDX-License-Identifier: MIT
pragma solidity ^0.8.28;

import "./Ownable.sol";

contract InheritanceModifierExample is Owner {

    mapping(address => uint256) public tokenBalance;

    uint256 public tokenPrice = 1 ether;

    constructor() {
        tokenBalance[msg.sender] = 100;
    }

    function createNewToken() external onlyOwner {
        tokenBalance[owner] += 1;
    }

    function burnToken(uint256 amount) external onlyOwner {
        require(tokenBalance[owner] >= amount, "Not enough tokens to burn");
        tokenBalance[owner] -= amount;
    }

    function purchaseToken() external payable {
        require(msg.value > 0, "Send ETH to purchase tokens");

        uint256 tokensToBuy = msg.value / tokenPrice;
        require(tokensToBuy > 0, "Insufficient ETH for one token");
        require(tokenBalance[owner] >= tokensToBuy, "Not enough tokens available");

        tokenBalance[owner] -= tokensToBuy;
        tokenBalance[msg.sender] += tokensToBuy;
    }

    function sendToken(address to, uint256 amount) external {
        require(to != address(0), "Invalid recipient");
        require(tokenBalance[msg.sender] >= amount, "Not enough tokens");

        tokenBalance[msg.sender] -= amount;
        tokenBalance[to] += amount;
    }
}


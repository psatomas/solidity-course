//SPDX-License-Identifier: MIT

pragma solidity ^0.8.28;

contract SampleUnits {
    modifier betweenOneAndTwoEth() {
        require(msg.value >= 1 ether && msg.value <= 2 ether);
        _;
    }

    uint256 runUntilTimestamp;
    uint256 startTimestamp;

    constructor(uint256 startInDays) {
        startTimestamp = block.timestamp + (startInDays * 1 days);
        runUntilTimestamp = startTimestamp + (7 days);
    }
}
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.28;

contract StartStopUpdateExample {
    bool public stopped;

    receive() external payable {}

    function stopAndWithdraw() external {
        require(!stopped, "Already stopped");

        stopped = true;

        uint256 balance = address(this).balance;
        if (balance > 0) {
            (bool success, ) = msg.sender.call{value: balance}("");
            require(success, "ETH transfer failed");
        }
    }
}

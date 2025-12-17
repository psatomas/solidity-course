// SPDX-License-Identifier: MIT
pragma solidity ^0.8.28;

contract SendWithdrawMoney {
    uint256 public balanceReceived;

    function deposit() public payable {
        balanceReceived += msg.value;
    }

    function getContractBalance() public view returns (uint256) {
        return address(this).balance;
    }

    function withdrawAll() public {
        _withdraw(payable(msg.sender));
    }

    function withdrawToAddress(address payable to) public {
        _withdraw(to);
    }

    function _withdraw(address payable to) internal {
        uint256 amount = address(this).balance;

        require(amount > 0, "No balance to withdraw");

        (bool success, ) = to.call{value: amount}("");
        require(success, "ETH transfer failed");
    }
}

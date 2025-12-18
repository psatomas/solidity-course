//SPDX-License-Identifier: MIT

pragma solidity ^0.8.28;

contract ExampleExceptionRequire {

    mapping(address => uint256) public balanceReceived;

    function receiveMoney() public payable {
        balanceReceived[msg.sender] += msg.value;
    }

    function withdrawMoney(address payable _to, uint256 _amount) public {
        require(_amount <= balanceReceived[msg.sender], "Not enough balance to withdraw");
        balanceReceived[msg.sender] -= _amount;
        (bool success, ) = _to.call{value: _amount}("");
        require(success, "ETH transfer failed");
    }
}
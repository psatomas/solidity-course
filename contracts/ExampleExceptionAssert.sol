//SPDX-License-Identifier: MIT

pragma solidity ^0.8.28;

contract ExampleExceptionRequire {

    mapping(address => uint8) public balanceReceived;

    function receiveMoney() public payable {
        assert(msg.value == uint8(msg.value));
        balanceReceived[msg.sender] += uint8(msg.value);
    }

    function withdrawMoney(address payable _to, uint8 _amount) public {
        require(_amount <= balanceReceived[msg.sender], "Not enough balance to withdraw");
        balanceReceived[msg.sender] -= _amount;
        (bool success, ) = _to.call{value: _amount}("");
        require(success, "ETH transfer failed");
    }
}
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.28;

contract ExampleMappingWithdrawals {

    mapping(address => uint256) public balanceReceived;

    function sendMoney() public payable {
        balanceReceived[msg.sender] += msg.value;
    }   

    function getBalance() public view returns (uint256) {
        return address(this).balance;
    }

    function withdrawAllMoney(address payable _to) public {
        uint256 balanceToSendOut = balanceReceived[msg.sender];
        require(balanceToSendOut > 0, "No balance to withdraw");
        balanceReceived[msg.sender] = 0;
        (bool success, ) = _to.call{value: balanceToSendOut}("");
        require(success, "ETH transfer failed");
    }
}

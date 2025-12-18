//SPDX-License-Identifier: MIT

pragma solidity ^0.8.28;

contract MappingStructExample {

    struct Transaction {
        uint256 amount;
        uint256 timestamp;
    }

    struct Balance {
        uint256 totalBalance;
        uint256 numDeposits;
        mapping(uint256 => Transaction) deposits;
        uint256 numWithdrawals;
        mapping(uint256 => Transaction) withdrawals;
    }

    mapping(address => Balance) public balances;

    function getDepositNum(address _from, uint _numDeposit) public view returns (Transaction memory) {
        return balances[_from].deposits[_numDeposit];
    }

    function depositMoney() public payable {
        balances[msg.sender].totalBalance += msg.value;

        Transaction memory deposit = Transaction(msg.value, block.timestamp);
        balances[msg.sender].deposits[balances[msg.sender].numDeposits] = deposit;
        balances[msg.sender].numDeposits++;
    }

    function withdrawMoney(address payable _to, uint256 _amount) public {
        balances[msg.sender].totalBalance -= _amount;

        Transaction memory withdrawal = Transaction(_amount, block.timestamp);
        balances[msg.sender].withdrawals[balances[msg.sender].numWithdrawals] = withdrawal;
        balances[msg.sender].numWithdrawals++;

        (bool success, ) = _to.call{value: _amount}("");
        require(success, "Transfer failed");
    }
}
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.28;

contract PaymentReceived {
    address public from;
    uint256 public amount;

    constructor(address _from, uint256 _amount) {
        from = _from;
        amount = _amount;
    }
}

contract Wallet {
    PaymentReceived[] public payments;

    function payContract() public payable {
        PaymentReceived payment = new PaymentReceived(msg.sender, msg.value);
        payments.push(payment);
    }

    function getPaymentsCount() public view returns (uint256) {
        return payments.length;
    }
}

contract ExampleStruct {
    struct Payment {
        address sender;
        uint256 amount;
    }

    mapping(address => Payment[]) public paymentsReceived;

    constructor(address _from, uint256 _amount) {
        paymentsReceived[_from].push(Payment(_from, _amount));
    }
}

contract Wallet2 {
    struct PaymentReceivedStruct {
        address from;
        uint256 amount;
    }

    PaymentReceivedStruct public payment;

    function payContract() public payable {
        payment = PaymentReceivedStruct(msg.sender, msg.value);
    }
}

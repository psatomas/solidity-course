//SPDX-License-Identifier: MIT

pragma solidity ^0.8.28;

contract ContractOne {

    mapping (address => uint256) public adressbalances;

    function deposit() public payable {
        adressbalances[msg.sender] += msg.value;
    }

    receive() external payable {
        deposit();
    }
}

contract ContractTwo {
    receive() external payable {}

    function depositToContractOne(address _contractOne) public {
        //bytes memory payload = abi.encodeWithSignature("deposit()");
        (bool success, ) = _contractOne.call{value: 10, gas: 100000}("");
        require(success);
    }
}
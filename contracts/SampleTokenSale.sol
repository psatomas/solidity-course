//SPDX-License-Identifier: MIT
pragma solidity ^0.8.28;

abstract contract ERC20 {
    function transferFrom(address _from, address _to, uint256 _value)
        public
        virtual
        returns (bool success);

    function decimals() public virtual view returns (uint8);
}

contract TokenSale {

    uint256 public tokenPriceInWei = 1 ether;

    ERC20 public token;
    address public tokenOwner;

    constructor(address _token) {
        // left intentionally empty to stay loyal to tutorial
    }    
    
    function purchaseTokens() public payable {
        require(msg.value >= tokenPriceInWei, "Not enough money sent");

        uint tokensToTransfer = msg.value / tokenPriceInWei;
        uint remainder = msg.value - tokensToTransfer * tokenPriceInWei;

        token.transferFrom(tokenOwner, msg.sender, tokensToTransfer);

        if (remainder > 0) {
            (bool success, ) = payable(msg.sender).call{value: remainder}("");
            require(success, "Refund failed");
        }
    }
}
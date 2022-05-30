// SPDX-License-Identifier: MIT
pragma solidity ^0.8.11;

contract EtherWallet {
    address payable public owner;
    address payable[] public deposit;

    constructor() {
        owner = payable(msg.sender);
    }

    receive() external payable {
require(msg.value== 1 ether);
deposit.push(payable(msg.sender));
}
    function withdraw(uint _amount) external {
        require(msg.sender == owner, "Only the owner can call this method.");
        payable(msg.sender).transfer(_amount);
    }

    function getBalance() external view returns (uint) {
        return address(this).balance;
    }
}
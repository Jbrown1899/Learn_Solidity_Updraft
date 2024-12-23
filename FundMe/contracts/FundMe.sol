// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

// Get funds from users
// Withdraw funds
// Set a minimum functing value in USD

import {PriceConverter} from "./PriceConverter.sol";

contract FundMe {
    using PriceConverter for uint256;

    uint256 public minimumUsd = 5 * 1e18;//this is 5$ but we must convert for eth math (no decimals)

    address[] public funders;
    mapping(address funder => uint256 amountFunded) public addressToAmountFunded;

    function fund() public payable{
        // Allow users to send $
        // Have a minmum $ sent
        // 1. How do we send ETH to this contract?
        msg.value.getConversionRate();

        require(msg.value.getConversionRate() >= minimumUsd, "didn't send enough ETH");
        funders.push(msg.sender);
        addressToAmountFunded[msg.sender] = addressToAmountFunded[msg.sender] + msg.value;
    }

    // function withdraw() public {

    // }
}
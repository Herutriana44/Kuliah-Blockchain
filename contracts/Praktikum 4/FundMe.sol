// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./PriceConverter.sol";

contract FundMe {
    using PriceConverter for uint256;

    address public owner;
    constructor()
    {
        owner = msg.sender;
    }

    uint256 public minimumUsd = 50 * 1e18;
    
    address[] public funders;
    mapping(address => uint256) public addressToAmountFunded;
    // uint256 public minimumUsd = 50 * 1e18;

    function fund() public payable {
        // Minimal 1 ETH
        require(msg.value >= 1e18, "Maaf, nilai yang anda input kurang");

        funders.push(msg.sender);
        addressToAmountFunded[msg.sender] = msg.value;
    }

    function getPrice() public view returns (uint256) {
        AggregatorV3Interface priceFeed = AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306);
        (, int256 price, , , ) = priceFeed.latestRoundData();
        return uint256(price * 1e10);
    }

    function getConversionRate(uint256 ethAmount) public view returns (uint256) {
        uint256 ethPrice = getPrice();
        uint256 ethAmountUsd = (ethPrice * ethAmount) / 1e18;
        return ethAmountUsd;
    }

    function withdraw() public onlyOwner {
        for(uint256 funderIndex=0; funderIndex < funders.length; funderIndex++)
        {
            address funder = funders[funderIndex];
            addressToAmountFunded[funder] = 0;

            // reset array
            funders = new address[](0);

            payable  (msg.sender).transfer(address(this).balance);
        }
    }

    modifier onlyOwner {
        require(msg.sender == owner, "Pengirim bukan seorang owner");
        _;
    }
}

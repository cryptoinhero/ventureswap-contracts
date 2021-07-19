// SPDX-License-Identifier: MIT

pragma solidity 0.6.12;

interface IStrategyArt {
    function depositReward(uint256 _depositAmt) external returns (bool);
}
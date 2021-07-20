// SPDX-License-Identifier: MIT

pragma solidity 0.6.12;

import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/math/SafeMath.sol";
import "@openzeppelin/contracts/token/ERC20/SafeERC20.sol";

contract LiquidityLock is Ownable {
    using SafeERC20 for IERC20;
    
    uint256 public lockTime;
    
    constructor(
        uint256 _lockTime
    ) public {
        lockTime = _lockTime;
    }

    function withdrawToken(IERC20 _token, uint256 _amount, address _to) external onlyOwner {
        require(lockTime > block.number, "You still need to wait!");
        _token.safeTransfer(_to, _amount);
    }
}
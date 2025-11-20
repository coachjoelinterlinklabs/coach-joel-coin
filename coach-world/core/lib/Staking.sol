// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

interface IERC20 {
    function transfer(address, uint256) external returns (bool);
    function transferFrom(address, address, uint256) external returns (bool);
}

contract Staking {
    IERC20 public token;

    struct StakeInfo {
        uint256 amount;
        uint256 lastClaim;
    }

    mapping(address => StakeInfo) public stakes;

    uint256 public rewardRate = 1; // 1% per day

    constructor(address tokenAddress) {
        token = IERC20(tokenAddress);
    }

    // Stake tokens
    function stake(uint256 amount) external {
        require(amount > 0, "Amount > 0");

        token.transferFrom(msg.sender, address(this), amount);

        // auto-claim before updating stake
        if (stakes[msg.sender].amount > 0) {
            claim();
        }

        stakes[msg.sender].amount += amount;
        stakes[msg.sender].lastClaim = block.timestamp;
    }

    // Claim rewards
    function claim() public {
        StakeInfo storage user = stakes[msg.sender];
        require(user.amount > 0, "Nothing staked");

        uint256 timePassed = block.timestamp - user.lastClaim;
        uint256 reward = (user.amount * rewardRate * timePassed) / (100 * 1 days);

        require(reward > 0, "No rewards yet");

        user.lastClaim = block.timestamp;
        token.transfer(msg.sender, reward);
    }

    // Withdraw stake + rewards
    function unstake(uint256 amount) external {
        StakeInfo storage user = stakes[msg.sender];
        require(user.amount >= amount, "Not enough staked");

        claim(); // auto-claim rewards

        user.amount -= amount;
        token.transfer(msg.sender, amount);
    }

    // Check pending rewards
    function pendingRewards(address user) external view returns (uint256) {
        StakeInfo storage info = stakes[user];
        if (info.amount == 0) return 0;

        uint256 timePassed = block.timestamp - info.lastClaim;
        return (info.amount * rewardRate * timePassed) / (100 * 1 days);
    }
}

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

/**
 * @title NewsletterGater
 * @dev Manages access thresholds and creator tips.
 */
contract NewsletterGater is Ownable {
    IERC20 public accessAsset;
    uint256 public minThreshold;

    event AccessUpdated(uint256 newThreshold);
    event TipReceived(address indexed reader, uint256 amount);

    constructor(address _asset, uint256 _threshold) Ownable(msg.sender) {
        accessAsset = IERC20(_asset);
        minThreshold = _threshold;
    }

    /**
     * @dev Check if a reader is eligible to view the content.
     */
    function hasAccess(address _reader) external view returns (bool) {
        return accessAsset.balanceOf(_reader) >= minThreshold;
    }

    /**
     * @dev Allows the creator to change the entry requirements.
     */
    function updateThreshold(uint256 _newThreshold) external onlyOwner {
        minThreshold = _newThreshold;
        emit AccessUpdated(_newThreshold);
    }

    /**
     * @dev A simple tip jar for readers to support the creator.
     */
    function tipCreator() external payable {
        require(msg.value > 0, "Tip must be > 0");
        payable(owner()).transfer(msg.value);
        emit TipReceived(msg.sender, msg.value);
    }
}

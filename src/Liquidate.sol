// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import { IMorpho, MarketParams } from "morpho-blue/src/interfaces/IMorpho.sol";
import { IERC20 } from "@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract Liquidate {
    IMorpho public immutable morpho;

    constructor(address _morpho) {
        morpho = IMorpho(_morpho);
    }

    /**
     * @notice Liquidates an unhealthy borrower's position.
     *
     * After this function executes:
     * - The borrower's debt should be reduced
     * - This contract should receive collateral
     */
    function liquidatePosition(MarketParams calldata marketParams, address borrower,uint256 amountToRepay) external {
        // Add your code here
    }
}
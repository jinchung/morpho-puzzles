// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import { IERC20 } from "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import { IMorpho, MarketParams } from "morpho-blue/src/interfaces/IMorpho.sol";


contract Borrow {
    IMorpho public immutable morpho;
    MarketParams public marketParams;

    constructor(IMorpho _morpho, MarketParams memory _marketParams) {
        morpho = _morpho;
        marketParams = _marketParams;
    }

    /**
     * @notice Deposit collateral and borrow assets from the Morpho market.
     *
     * After this function executes, this contract should have
     * a open borrow position.
     */
    function addCollateralAndBorrow(uint256 collateralAmount, uint256 borrowAmount) external {
        // Add your code here
    }
}
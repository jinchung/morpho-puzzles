// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;
 
import { IMorpho, MarketParams } from "morpho-blue/src/interfaces/IMorpho.sol";
import { IERC20 } from "@openzeppelin/contracts/token/ERC20/IERC20.sol";
 
contract Borrow {

    Morpho public immutable morpho;
    MarketParams public immutable marketParams;

    constructor(IMorpho _morpho, MarketParams memory _marketParams) {
        morpho = _morpho;
        marketParams = _marketParams;
    }

    /**
     * @notice Create a borrow position in the Morpho Blue market.
     *
     * After this function executes, this contract should have
     * a non-zero debt position in the market.
     */
    function supplyCollateralAndBorrow(uint256 collateralAmount, uint256 borrowAmount) external {
        // TODO:
        // Interact with Morpho so that this contract ends up
        // with an outstanding borrow of `borrowAmount`.
    }
 
}
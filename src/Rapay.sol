// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;
 
import { IMorpho, MarketParams, Market, Position } from "morpho-blue/src/interfaces/IMorpho.sol";
import { IERC20 } from "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import { MorphoBalancesLib } from "morpho-blue/src/libraries/periphery/MorphoBalancesLib.sol";
import { MarketParamsLib } from "morpho-blue/src/libraries/MarketParamsLib.sol";
 
contract Repay {
    using MarketParamsLib for MarketParams;
    using MorphoBalancesLib for IMorpho;
 
    IMorpho public immutable morpho;
    MarketParams public immutable marketParams;
 
    constructor(IMorpho _morpho, MarketParams memory _marketParams) {
        morpho = _morpho;
        marketParams = _marketParams;
    }
 
 
    function repayAllAndWithdraw(uint256 collateralAmount) external {
        uint256 debt = morpho.expectedBorrowAssets(marketParams, msg.sender);
        IERC20(marketParams.loanToken).approve(address(morpho), debt);
 
        (, uint128 borrowShares, ) = morpho.position(marketParams.id(), msg.sender);
        morpho.repay(marketParams, 0, borrowShares, msg.sender, "");
        
        morpho.withdrawCollateral(marketParams, collateralAmount, msg.sender, msg.sender);
    }
}
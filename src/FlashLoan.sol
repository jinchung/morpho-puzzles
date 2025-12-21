// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import { IMorpho } from "morpho-blue/src/interfaces/IMorpho.sol";
import {IMorphoFlashLoanCallback} from "morpho-blue/src/interfaces/IMorphoCallbacks.sol";
import { IERC20 } from "@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract FlashLoan is IMorphoFlashLoanCallback {
    IMorpho public immutable morpho;

    constructor(address _morpho) {
        morpho = IMorpho(_morpho);
    }

    // Trigger the flash loan
    function executeFlashLoan(address token, uint256 assets) external {
        bytes memory data = abi.encode(token);
        morpho.flashLoan(token, assets, data);
    }

    /**
     * @notice After this function executes,
     *the flash loan should complete without reverting.
     */
    function onMorphoFlashLoan(uint256 assets,bytes calldata data) external override {
        // Add your code here
    }
}
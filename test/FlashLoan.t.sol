// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import "forge-std/Test.sol";

import { FlashLoan } from "../src/FlashLoan.sol";
import { IMorpho } from "morpho-blue/src/interfaces/IMorpho.sol";
import { IERC20 } from "@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract FlashLoanTest is Test {
    // Real Morpho Blue contract
    IMorpho constant MORPHO =
        IMorpho(0xBBBBBbbBBb9cC5e90e3b3Af64bdAF62C37EEFFCb);

    // Token supported for flash loans (USDC)
    IERC20 constant USDC =
        IERC20(0xA0b86991c6218b36c1d19D4a2e9Eb0cE3606eB48);

    FlashLoan flashLoan;

    function setUp() public {
        vm.createSelectFork(vm.rpcUrl("mainnet"));
        flashLoan = new FlashLoan(address(MORPHO));
    }

    function testFlashLoan() public {
        uint256 amount = 1_000e6; // 1,000 USDC

        uint256 morphoBalanceBefore =
            USDC.balanceOf(address(MORPHO));

        // Execute flash loan
        flashLoan.executeFlashLoan(address(USDC), amount);

        uint256 morphoBalanceAfter =
            USDC.balanceOf(address(MORPHO));

        uint256 contractBalance =
            USDC.balanceOf(address(flashLoan));

        // Morpho must be fully repaid
        assertEq(
            morphoBalanceAfter,
            morphoBalanceBefore,
            "morpho not repaid"
        );

        // FlashLoan contract should keep nothing
        assertEq(contractBalance,0,"flash loan contract kept funds");
    }
}
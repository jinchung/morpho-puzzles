// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import "forge-std/Test.sol";

import { DepositAsLender } from "../src/DepositAsLender.sol";
import { IVaultV2 } from "@morpho-org/vault-v2/src/interfaces/IVaultV2.sol";
import { IERC20 } from "@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract DepositAsLenderForkTest is Test {

    IVaultV2 constant VAULT = IVaultV2(0xA1D94F746dEfa1928926b84fB2596c06926C0405);

    IERC20 constant USDC = IERC20(0xA0b86991c6218b36c1d19D4a2e9Eb0cE3606eB48);

    address constant USDC_WHALE = 0x55FE002aefF02F77364de339a1292923A15844B8;

    DepositAsLender solution;

    function setUp() public {
        // 1. Fork Ethereum mainnet
        vm.createSelectFork(vm.rpcUrl("mainnet"));

        // 2. Deploy the puzzle contract with the real vault address
        solution = new DepositAsLender(address(VAULT));

        // 3. Fund the solution contract with real USDC
        vm.startPrank(USDC_WHALE);
        USDC.transfer(address(solution), 1_000e6); // 1,000 USDC
        vm.stopPrank();
    }

    function testDepositAsLender() public {
        uint256 depositAmount = 500e6; // 500 USDC

        // 4. Call the puzzle solution
        solution.supplyAsset(depositAmount);

        // 5. Assert that vault shares were minted
        uint256 shares = VAULT.balanceOf(address(solution));

        assertGt(shares, 0, "no vault shares minted");
    }
}
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import "forge-std/Test.sol";
import { Lend } from "../src/Lend.sol";
import { IVaultV2 } from "@morpho-org/vault-v2/src/interfaces/IVaultV2.sol";
import { IERC20 } from "@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract LendTest is Test {
    
    // Real Morpho Vault (USDC)
    IVaultV2 constant VAULT = IVaultV2(0xBEEF01735c132Ada46AA9aA4c54623cAA92A64CB);
    
    // Underlying asset of the vault
    IERC20 constant USDC = IERC20(0xA0b86991c6218b36c1d19D4a2e9Eb0cE3606eB48);
   
    // Well-funded USDC holder to seed the puzzle contract
    address constant USDC_WHALE = 0x28C6c06298d514Db089934071355E5743bf21d60;

    Lend lend;

    function setUp() public {

        // Fork Ethereum mainnet so we can interact with real contracts
        vm.createSelectFork(vm.rpcUrl("mainnet"));

        // Deploy the puzzle contract, pointing it at the real vault
        lend = new Lend(address(VAULT));

        // Transfer USDC into the puzzle contract so it can deposit
        vm.startPrank(USDC_WHALE);
        USDC.transfer(address(lend), 1_000e6);
        vm.stopPrank();
    }

    function testDepositAsLender() public {
        uint256 depositAmount = 500e6;

        // // Execute the puzzle logic
        lend.supplyAsset(depositAmount);

        // Access the vault shares hold by puzzle contract
        uint256 shares = VAULT.balanceOf(address(lend));
        
        //assert that shares should be > 0
        assertGt(shares, 0, "no vault shares minted");
    }
}
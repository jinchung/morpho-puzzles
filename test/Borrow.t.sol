// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import "forge-std/Test.sol";

import { Borrow } from "../src/Borrow.sol";
import { IMorpho, MarketParams } from "morpho-blue/src/interfaces/IMorpho.sol";
import { IERC20 } from "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import { MorphoBalancesLib } from "morpho-blue/src/libraries/periphery/MorphoBalancesLib.sol";

contract DepositAsBorrowerThenBorrowForkTest is Test {

    using MorphoBalancesLib for IMorpho;

    // Morpho Blue core contract address
    IMorpho constant MORPHO = IMorpho(0xBBBBBbbBBb9cC5e90e3b3Af64bdAF62C37EEFFCb);

    // WETH contract address on mainnet
    IERC20 constant WETH = IERC20(0xC02aaA39b223FE8D0A0e5C4F27eAD9083C756Cc2);
    
    // USDT contract address on mainnet
    IERC20 constant USDT = IERC20(0xdAC17F958D2ee523a2206206994597C13D831ec7);

    // A well-funded WETH holder used to seed collateral
    address constant WETH_WHALE = 0x28C6c06298d514Db089934071355E5743bf21d60;


    Borrow borrow;
    MarketParams marketParams;

    function setUp() public {

        // Fork Ethereum mainnet
        vm.createSelectFork(vm.rpcUrl("mainnet"));

        // Define a real Morpho Blue market
        marketParams = MarketParams({
            loanToken: address(USDT),
            collateralToken: address(WETH),
            oracle: 0xe9eE579684716c7Bb837224F4c7BeEfA4f1F3d7f,
            irm: 0x870aC11D48B15DB9a138Cf899d20F13F79Ba00BC,
            lltv: 915000000000000000 
        });

        // Deploy the puzzle contract
        borrow = new Borrow(MORPHO, marketParams);

        // Fund the borrow contract with WETH
        vm.startPrank(WETH_WHALE);
        WETH.transfer(address(borrow), 10 ether);
        vm.stopPrank();
    }

    function testAddCollateralAndBorrow() public {
        uint256 collateralAmount = 5 ether;
        uint256 borrowAmount = 1_000e6; // 1,000 USDC

        //Execute puzzle logic
        borrow.addCollateralAndBorrow(collateralAmount, borrowAmount);

        // After execution, the contract should have an open borrow position
        uint256 debt = MORPHO.expectedBorrowAssets(marketParams, address(borrow));
       
       // assert that debt should > 0
        assertGt(debt, 0, "borrow position not created");
    }
}
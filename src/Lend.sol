// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import { IVaultV2 } from "@morpho-org/vault-v2/src/interfaces/IVaultV2.sol";
import { IERC20 } from "@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract Lend {

    IVaultV2 public immutable vault;

    constructor(address _vault) {
        vault = IVaultV2(_vault);
    }

    /**
     * @notice After this function executes,
     * this contract should have vault shares.
     */
    function supplyAsset(uint256 amount) external {
        // Add your code here
    }
}
// SPDX-License-Identifier: MIT
pragma solidity 0.8.30;

import { IVaultV2 } from "@morpho-org/vault-v2/src/interfaces/IVaultV2.sol";
import { IERC20 } from "@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract DepositAsLender {

    IVaultV2 public immutable vault;

    constructor(address _vault) {
        vault = IVaultV2(_vault);
    }

    /**
     * @notice Deposit `amount` of the vault's underlying asset
     *         into the Morpho Vault on behalf of this contract.
     */
    function supplyAsset(uint256 amount) external {
        // TODO:
        // 1. Get the underlying asset from the vault
        // 2. Approve the vault to pull `amount`
        // 3. Deposit the assets into the vault
    }
}
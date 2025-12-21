# morpho-puzzles by [RareSkills](https://www.rareskills.io)
This repository contains a set of hands-on puzzles designed to teach core
Morpho protocol mechanics through direct contract interaction.
## Puzzles

1. Deposit as Lender 
2. Deposit as Borrower  
3. Liquidation 
4. Flash Loans

Each puzzle:
- Uses real Morpho contracts
- Is tested on a mainnet fork
- Requires writing a minimal solution contract

The goal is to understand how Morpho works by interacting with it directly,
not by reading abstractions.

## Prerequisites 🛠️

Before starting, ensure you have the following tools installed and configured:

* **[Foundry](https://book.getfoundry.sh/getting-started/installation)**: This project uses Foundry for compilation and testing. You must have `forge` installed.
* **[Git](https://git-scm.com/downloads)**: Required to clone the repository.
* **Ethereum Mainnet RPC**: You will need a Mainnet RPC URL (e.g., from [Alchemy](https://www.alchemy.com/), [Infura](https://www.infura.io/), or another provider) to fork the chain for testing.

## How to play

Each puzzle in this repository is intentionally incomplete.

Your goal is to **“hack” the puzzle** by writing the missing logic so that the
corresponding test passes.

### General workflow

1. Clone the repository
   ```bash
   git clone <repo-url>
   cd morpho-puzzles
   ```
2. Install dependencies
   ```bash
   forge install
   ```
3. Create an .env file in the project root
   ```bash
   touch .env
   ```
4. Add a mainnet RPC endpoint to the `.env` file
   ```bash
   MAINNET_RPC_URL=<your_rpc_url_here>
   ```
5. Make sure your `foundry.toml` includes an RPC alias for mainnet
   ```toml
   [rpc_endpoints]
   mainnet = "${MAINNET_RPC_URL}"
   ```
6. Pick a puzzle contract from the src/ directory
   - Each puzzle contains one or more functions with TODO comments
   - You are expected to complete only the logic inside these functions
7. Open the corresponding test file in the test/ directory
	- The test describes the expected behavior, not the solution
	- Treat the test as the specification
8. Run the test for that puzzle
   ```bash
   forge test --match-path test/<PuzzleName>.t.sol
   ```
9. Modify the puzzle contract until the test passes



                                      Happy Hacking! 🚀
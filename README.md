# morpho-puzzles by [RareSkills](https://www.rareskills.io)

This repository contains four interactive puzzles designed to teach core Morpho protocol operations through direct smart contract interaction. Each puzzle in this repository:

- Uses real Morpho contracts deployed on Ethereum mainnet
- Is tested on a mainnet fork for realistic scenarios
- Requires implementing minimal, focused solution contracts
- Emphasizes learning through direct protocol interaction, not abstractions

The goal is to understand how Morpho works by building with it directly, gaining practical experience that translates to real-world DeFi development.

### Prerequisites

Before starting, ensure you have the following tools installed and configured:

* **[Foundry](https://book.getfoundry.sh/getting-started/installation)**: This project uses Foundry for compilation and testing. You must have `forge` installed.

* **[Git](https://git-scm.com/downloads)**: Required to clone the repository.

* **Ethereum Mainnet RPC**: You will need a Mainnet RPC URL (e.g., from [Alchemy](https://www.alchemy.com/), [Infura](https://www.infura.io/), or another provider) to fork the chain for testing.

### Setup Instructions

Follow these steps to configure your environment and begin solving puzzles:

#### 1. Clone the Repository
```bash
git clone https://github.com/RareSkills/morpho-puzzles.git
cd morpho-puzzles
```

#### 2. Install Dependencies
```bash
forge install
```

#### 3. Add your Ethereum mainnet RPC endpoint to the `.env` file:
```bash
MAINNET_RPC_URL= <Add Your RPC URL>
```

#### 4. Ensure your `foundry.toml` includes the RPC alias for mainnet:
```toml
[rpc_endpoints]
mainnet = "${MAINNET_RPC_URL}"
```

### How to Play


Each puzzle in this repository is intentionally incomplete. Your goal is to **implement the missing logic** so that the corresponding test passes, demonstrating your understanding of the Morpho protocol operation.

#### Step 1: Select a Puzzle

Navigate to the `src/` directory and choose a puzzle contract to solve.

- Each contract contains one or more functions marked with `// Add your code here`
- You are expected to complete **only** the logic inside these functions
- Do not modify function signatures or contract structure

#### Step 2: Review the Test Specification

Open the corresponding test file in the `test/` directory.

- The test describes the **expected behavior**, not the solution
- Treat the test as your specification and requirements document
- Read the comments carefully—they explain the scenario, starting assets, and success criteria

#### Step 3: Implement Your Solution

Write the missing implementation in the puzzle contract.

- Focus on calling Morpho contracts correctly
- Handle token approvals and interactions properly
- Keep your solution simple and readable
- You may add helper functions if needed

#### Step 4: Run the Tests

Execute the test for a specific puzzle by running the following command:
```bash
forge test --match-path test/Lend.t.sol 
```

#### Step 5: Iterate Until Success

Continue refining your implementation until all tests pass:

- Use Foundry's verbose output (`-vv`, `-vvv`, `-vvvv`) to debug failures
- Reference [Morpho's documentation](https://docs.morpho.org/) for protocol details


<div align="center">

**Happy Hacking! 🚀**

Built with ❤️ by [RareSkills](https://www.rareskills.io)

</div>

# Reinforcement Learning Visualizations

Interactive educational artifacts for building deep intuition about reinforcement learning concepts.

## Overview

This collection provides hands-on, visual explorations of RL concepts from the basics to advanced algorithms. Each visualization is designed to be:

- **Interactive**: Direct manipulation of parameters
- **Visual**: Concepts shown, not just described
- **Progressive**: Each tier builds on the previous
- **Standalone**: Each module works independently

## Modules

### Tier 1: Core RL Concepts
| Module | Description | Status |
|--------|-------------|--------|
| RL Loop Explorer | Agent-Environment interaction | ✅ Complete |
| MDP Playground | States, actions, transitions | ✅ Complete |
| Discount Factor | How γ affects future value | ✅ Complete |
| Policy vs Value | Relationship between π and V | ✅ Complete |

### Tier 2: Value-Based Methods
| Module | Description | Status |
|--------|-------------|--------|
| Bellman Explorer | Recursive value structure | 🔜 Coming |
| DP Lab | Policy/Value Iteration | 🔜 Coming |
| Monte Carlo | Learning from episodes | 🔜 Coming |
| TD Learning | Bootstrapping & TD error | 🔜 Coming |
| Q vs SARSA | On-policy vs off-policy | 🔜 Coming |

### Tier 3: Policy-Based Methods
| Module | Description | Status |
|--------|-------------|--------|
| Policy Gradient | Direct policy optimization | 🔜 Coming |
| REINFORCE | MC policy gradient | 🔜 Coming |
| Actor-Critic | Combining policy & value | 🔜 Coming |
| GAE | Advantage estimation | 🔜 Coming |

### Tier 4: Advanced Topics
| Module | Description | Status |
|--------|-------------|--------|
| Exploration | ε-greedy, UCB, Thompson | 🔜 Coming |
| Replay Buffer | Experience replay | 🔜 Coming |
| Target Networks | DQN stabilization | 🔜 Coming |
| PPO | Trust region methods | 🔜 Coming |
| Reward Shaping | Reward design effects | 🔜 Coming |

## Quick Start

```bash
# Install dependencies
make init

# Start development server
make dev

# Open http://localhost:3001
```

## Available Commands

```bash
make help      # Show all available commands
make init      # Install dependencies
make dev       # Start dev server (port 3001)
make build     # Build for production
make preview   # Preview production build
make clean     # Remove build artifacts
```

## Tech Stack

- **React 19** - UI components with hooks
- **Vite 6** - Fast build tooling
- **Tailwind CSS 4** - Utility-first styling
- **SVG** - Custom visualizations
- **Lucide** - Icon library

## Project Structure

```
rl-visualizations/
├── App.jsx              # Main hub with navigation
├── components/          # Shared components
│   ├── GridWorld.jsx    # Configurable grid environment
│   ├── StateNode.jsx    # Visual state representation
│   ├── PolicyArrow.jsx  # Action direction indicator
│   └── ...
├── tier1/               # Core RL concepts
├── tier2/               # Value-based methods
├── tier3/               # Policy-based methods
└── tier4/               # Advanced topics
```

## Design Philosophy

1. **Interactive First** - Every concept explorable through direct manipulation
2. **Visual Intuition** - Prioritize visuals over math notation
3. **Progressive Complexity** - Each tier builds on previous
4. **Immediate Feedback** - Actions have instant visual consequences
5. **Failure is Learning** - See what happens when things go wrong

## Related Projects

- [Neural Network Visualizations](../nn-visualizations/) - Companion project for NN concepts

## License

Educational use - Open source

# Interactive AI

Interactive educational visualizations for understanding AI concepts. Build deep intuition through hands-on exploration.

## Projects

| Project | Description | Port | Modules |
|---------|-------------|------|---------|
| [Neural Networks](./neural-networks/) | Backpropagation, activations, loss landscapes | 3000 | 4 |
| [Convolutional Networks](./convolutional-networks/) | CNNs, kernels, pooling, architectures | 3002 | 13 |
| [Reinforcement Learning](./reinforcement-learning/) | MDPs, Q-learning, policy gradients | 3001 | 4 |

## Quick Start

```bash
# Install all dependencies
make install

# Start any project
make dev-nn    # Neural Networks
make dev-cnn   # Convolutional Networks
make dev-rl    # Reinforcement Learning
```

## Structure

```
interactive-ai/
├── neural-networks/           # NN fundamentals
│   ├── tier1/                 # Neuron anatomy, activations, loss landscapes
│   └── backprop-flow.jsx      # Backpropagation visualization
│
├── convolutional-networks/    # CNN deep dive
│   ├── foundations/           # Pixels, matrices, basic NNs
│   ├── core/                  # Convolution, kernels, pooling
│   ├── advanced/              # Training, architectures
│   └── reference/             # Overview visualization
│
├── reinforcement-learning/    # RL concepts
│   ├── tier1/                 # RL loop, MDPs, discount, policy/value
│   ├── tier2/                 # (planned) Value methods
│   ├── tier3/                 # (planned) Policy methods
│   └── tier4/                 # (planned) Advanced topics
│
└── docs/                      # Planning documents
```

## Design Philosophy

1. **Interactive First** - Every concept is explorable through direct manipulation
2. **Visual Intuition** - Prioritize visuals over mathematical notation
3. **Progressive Complexity** - Each tier builds on the previous
4. **Immediate Feedback** - Actions have instant visual consequences
5. **Standalone Modules** - Each visualization works independently

## Tech Stack

- **React 19** - UI components with hooks
- **Vite 6** - Fast build tooling
- **Tailwind CSS 4** - Utility-first styling
- **SVG** - Custom visualizations
- **Lucide** - Icon library

## Development

```bash
make help      # Show all commands
make install   # Install dependencies for all projects
make build     # Build all projects
make clean     # Remove build artifacts
```

## Module Status

### Neural Networks (4 modules)
- ✅ Neuron Anatomy Explorer
- ✅ Activation Function Playground
- ✅ Loss Landscape Navigator
- ✅ Backpropagation Flow

### Convolutional Networks (13 modules)
- ✅ Pixels & Images
- ✅ Matrix Math
- ✅ Basic Neural Network
- ✅ Convolution Deep Dive
- ✅ Kernel Gallery
- ✅ Feature Maps
- ✅ Pooling Layers
- ✅ Classification Head
- ✅ Training CNNs
- ✅ Deeper Networks
- ✅ Famous Architectures
- ✅ Interpretability
- ✅ CNN Overview

### Reinforcement Learning (4/18 modules)
- ✅ RL Loop Explorer
- ✅ MDP Playground
- ✅ Discount Factor Visualizer
- ✅ Policy vs Value Visualizer
- 🔜 14 more planned (Bellman, TD, Q-learning, Policy Gradient, etc.)

## License

MIT - Educational use encouraged

# CNN Visualizations

Interactive educational artifacts for understanding Convolutional Neural Networks.

## Overview

This collection provides hands-on, visual explorations of CNN concepts from image basics to advanced architectures. Each visualization is designed to be:

- **Interactive**: Direct manipulation of parameters
- **Visual**: Concepts shown, not just described
- **Progressive**: Each tier builds on previous
- **Standalone**: Each module works independently

## Modules

### Foundations
| Module | Description | Status |
|--------|-------------|--------|
| Pixels & Images | How computers see images as numbers | ✅ Complete |
| Matrix Math | Mathematical foundation of convolutions | ✅ Complete |
| Basic Neural Network | Neurons, layers, and activation | ✅ Complete |

### Core CNN Concepts
| Module | Description | Status |
|--------|-------------|--------|
| Convolution Deep Dive | Sliding windows and feature detection | ✅ Complete |
| Kernel Gallery | Edge detectors, blurs, and learned filters | ✅ Complete |
| Feature Maps | What each layer learns to detect | ✅ Complete |
| Pooling Layers | Downsampling and translation invariance | ✅ Complete |
| Classification Head | From features to predictions | ✅ Complete |

### Advanced Topics
| Module | Description | Status |
|--------|-------------|--------|
| Training CNNs | Backpropagation through convolutions | ✅ Complete |
| Deeper Networks | Skip connections and residual learning | ✅ Complete |
| Famous Architectures | LeNet, AlexNet, VGG, ResNet | ✅ Complete |
| Interpretability | What do CNNs actually learn? | ✅ Complete |

### Reference
| Module | Description | Status |
|--------|-------------|--------|
| CNN Overview | Complete end-to-end visualization | ✅ Complete |

## Quick Start

```bash
# Install dependencies
make init

# Start development server
make dev

# Open http://localhost:3002
```

## Available Commands

```bash
make help      # Show all available commands
make init      # Install dependencies
make dev       # Start dev server (port 3002)
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
convolutional-neural-network/
├── App.jsx              # Main hub with navigation
├── foundations/         # Prerequisite modules
│   ├── pixels-and-images.jsx
│   ├── matrix-math.jsx
│   └── basic-neural-network.jsx
├── core/                # Core CNN concepts
│   ├── convolution-deep-dive.jsx
│   ├── kernel-gallery.jsx
│   ├── feature-maps.jsx
│   ├── pooling.jsx
│   └── classification-head.jsx
├── advanced/            # Advanced topics
│   ├── training.jsx
│   ├── deeper-networks.jsx
│   ├── famous-architectures.jsx
│   └── interpretability.jsx
└── reference/           # Reference visualizations
    └── cnn-overview.jsx
```

## Features

- **Interactive Visualizations**: Every concept is hands-on
- **ELI5 Mode**: Kid-friendly explanations for complex topics
- **Draw Your Own**: Create custom inputs and kernels
- **Side-by-Side Comparisons**: See how different kernels behave
- **Progress Tracking**: Visual progress bar in hub
- **Keyboard Shortcuts**: Space (play/pause), arrows (step)

## Related Projects

- [Neural Network Visualizations](../nn-visualizations/) - Companion project for NN concepts
- [RL Visualizations](../rl-visualizations/) - Reinforcement learning concepts

## License

Educational use - Open source

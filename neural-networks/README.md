# Neural Network Visualizations 🧠

Interactive educational artifacts for building deep intuition about neural networks.

![Status](https://img.shields.io/badge/Tier%201-Complete-brightgreen)
![Status](https://img.shields.io/badge/Tier%202-Coming%20Soon-yellow)

## Quick Start

```bash
# First time setup
make init

# Start development server
make dev
```

Then open [http://localhost:3000](http://localhost:3000)

## Available Visualizations

### Tier 1: Foundation Concepts ✅

| Module | Description | Command |
|--------|-------------|---------|
| **Neuron Anatomy Explorer** | Interactive single neuron with adjustable weights, bias, and activation functions | `make run-neuron` |
| **Activation Function Playground** | Compare 8 activation functions and their derivatives side-by-side | `make run-activation` |
| **Loss Landscape Navigator** | Visualize gradient descent on different loss surfaces (convex, ravine, saddle, multimodal) | `make run-landscape` |

### Reference Visualization

| Module | Description | Command |
|--------|-------------|---------|
| **Backpropagation Flow** | Step-by-step gradient flow through a simple network | `make run-backprop` |

### Tier 2: Training Dynamics (Coming Soon)

- Learning Rate Lab
- Batch vs SGD Visualizer
- Optimizer Zoo

### Tier 3: Architecture Understanding (Planned)

- Universal Approximation Demo
- Convolution Visualizer
- Attention Mechanism Flow

### Tier 4: Debugging & Intuition (Planned)

- Vanishing/Exploding Gradients Visualizer
- Overfitting Sandbox
- Regularization Effects

## Commands

```bash
make help        # Show all available commands
make init        # Install dependencies
make dev         # Start development server
make build       # Build for production
make clean       # Remove node_modules and build artifacts
make reset       # Full reset and reinitialize
```

## Project Structure

```
nn-visualizations/
├── App.jsx              # Main hub with navigation
├── main.jsx             # Entry point
├── index.html           # HTML template
├── index.css            # Global styles with Tailwind
├── backprop-flow.jsx    # Backpropagation visualization
├── tier1/
│   ├── neuron-anatomy.jsx
│   ├── activation-playground.jsx
│   └── loss-landscape.jsx
├── tier2/               # (coming soon)
├── package.json
├── vite.config.js
└── Makefile
```

## Design Philosophy

1. **Interactive First** — Every concept should be manipulatable, not just viewable
2. **Progressive Disclosure** — Start simple, reveal complexity on demand
3. **Visual Intuition** — Prioritize spatial/visual understanding over formulas
4. **Immediate Feedback** — Actions produce instant, visible results
5. **No Prerequisites** — Each artifact stands alone

## Tech Stack

- React 18
- Vite
- Tailwind CSS v4
- Lucide React (icons)

## Contributing

Contributions welcome! Each visualization should:

- Be a self-contained React component
- Follow the existing visual style (dark theme, slate colors)
- Include interactive controls and "Key Insights" panel
- Work on both desktop and mobile

## License

MIT

---

Built with ❤️ for the ML education community

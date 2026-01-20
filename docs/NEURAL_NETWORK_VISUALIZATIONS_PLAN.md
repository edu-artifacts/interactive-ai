# Neural Network Educational Artifacts
## Open Source Interactive Visualization Collection

**Project:** nn-visualizations
**Author:** Jonas
**Created:** January 20, 2026
**Status:** Planning Phase

---

## Executive Summary

This document outlines the design and implementation plan for a collection of 12 interactive educational artifacts focused on neural networks and deep learning. Each artifact is a self-contained React component that can be embedded, shared, or used standalone. The collection builds conceptual understanding from single neurons to complex training dynamics.

---

## Project Philosophy

### Design Principles

1. **Interactive First** — Every concept should be manipulatable, not just viewable
2. **Progressive Disclosure** — Start simple, reveal complexity on demand
3. **Visual Intuition** — Prioritize spatial/visual understanding over formulas
4. **Immediate Feedback** — Actions produce instant, visible results
5. **No Prerequisites** — Each artifact stands alone (with optional connections)

### Technical Standards

- **Framework:** React with hooks (functional components only)
- **Styling:** Tailwind CSS (utility-first, no external CSS files)
- **Animations:** CSS transitions + requestAnimationFrame for smooth updates
- **Visualizations:** SVG for diagrams, Canvas for performance-critical renders
- **State Management:** useState/useReducer (no external dependencies)
- **Accessibility:** Keyboard navigation, screen reader labels, color-blind friendly palettes

---

## Collection Overview

### Tier 1: Foundation Concepts
| # | Artifact | Core Learning Objective |
|---|----------|------------------------|
| 1 | Neuron Anatomy Explorer | Understand single neuron computation |
| 2 | Activation Function Playground | Compare activation functions & their derivatives |
| 3 | Loss Landscape Navigator | Visualize optimization as navigating a surface |

### Tier 2: Training Dynamics
| # | Artifact | Core Learning Objective |
|---|----------|------------------------|
| 4 | Learning Rate Lab | See why learning rate choice matters |
| 5 | Batch vs SGD Visualizer | Compare gradient descent variants |
| 6 | Optimizer Zoo | Understand momentum, RMSprop, Adam |

### Tier 3: Architecture Understanding
| # | Artifact | Core Learning Objective |
|---|----------|------------------------|
| 7 | Universal Approximation Demo | See why neural nets can fit anything |
| 8 | Convolution Visualizer | Step through CNN operations |
| 9 | Attention Mechanism Flow | Understand transformer attention |

### Tier 4: Debugging & Intuition
| # | Artifact | Core Learning Objective |
|---|----------|------------------------|
| 10 | Vanishing/Exploding Gradients | Diagnose deep network pathologies |
| 11 | Overfitting Sandbox | Understand generalization |
| 12 | Regularization Effects | Compare L1, L2, dropout |

### Existing (Reference)
| # | Artifact | Status |
|---|----------|--------|
| 0 | Backpropagation Flow | ✅ Complete (provided by user) |

---

## Detailed Artifact Specifications

---

### Artifact 1: Neuron Anatomy Explorer

**Learning Objective:** Understand how a single artificial neuron computes its output from inputs, weights, bias, and activation function.

**Visual Layout:**
```
┌─────────────────────────────────────────────────────────────┐
│  NEURON ANATOMY EXPLORER                                    │
├─────────────────────────────────────────────────────────────┤
│                                                             │
│   ┌──────┐                                                  │
│   │ x₁ ●─────w₁────┐                                        │
│   │ 0.7  │         │      ┌─────────┐     ┌─────────┐      │
│   └──────┘         ├──────│   Σ+b   │─────│  f(z)   │──● y │
│   ┌──────┐         │      │  z=2.1  │     │ σ(2.1)  │  0.89│
│   │ x₂ ●─────w₂────┘      └─────────┘     └─────────┘      │
│   │ 0.3  │                     ▲                           │
│   └──────┘                     │                           │
│                            ┌───┴───┐                       │
│                            │ b=-0.5│                       │
│                            └───────┘                       │
│                                                             │
│  [Draggable sliders for x₁, x₂, w₁, w₂, b]                 │
│  [Activation function selector: ReLU | Sigmoid | Tanh]      │
│                                                             │
├─────────────────────────────────────────────────────────────┤
│  COMPUTATION BREAKDOWN                                      │
│  z = x₁·w₁ + x₂·w₂ + b = 0.7×1.2 + 0.3×0.8 + (-0.5) = 2.1 │
│  y = σ(z) = 1/(1+e^(-2.1)) = 0.89                          │
└─────────────────────────────────────────────────────────────┘
```

**Interactions:**
- Drag input values (x₁, x₂) on sliders or directly on nodes
- Drag weight values (w₁, w₂) or click to edit
- Drag bias value
- Toggle activation function — output updates in real-time
- Hover any component for tooltip explanation

**Visual Effects:**
- Connection thickness proportional to |weight|
- Connection color: green (positive) / red (negative)
- Pulse animation along connections showing "signal flow"
- Activation function graph shown inline with current z marked

**Key Math Displayed:**
```
z = Σ(xᵢ · wᵢ) + b
y = f(z)  where f ∈ {ReLU, Sigmoid, Tanh, Linear}
```

**Insights Panel (appears contextually):**
- "Weights control sensitivity to each input"
- "Bias shifts the activation threshold"
- "Different activations = different output ranges"

---

### Artifact 2: Activation Function Playground

**Learning Objective:** Compare how different activation functions transform inputs and understand their derivatives (crucial for backpropagation).

**Visual Layout:**
```
┌─────────────────────────────────────────────────────────────┐
│  ACTIVATION FUNCTION PLAYGROUND                             │
├─────────────────────────────────────────────────────────────┤
│                                                             │
│  ┌─────────────────────┐    ┌─────────────────────┐        │
│  │     f(x) Graph      │    │    f'(x) Graph      │        │
│  │                     │    │    (Derivative)      │        │
│  │      ──────         │    │                      │        │
│  │     /               │    │    ────────          │        │
│  │    │                │    │         \            │        │
│  │ ───┘                │    │          ────        │        │
│  │                     │    │                      │        │
│  │     • x=1.5, y=0.82 │    │    • x=1.5, y=0.15  │        │
│  └─────────────────────┘    └─────────────────────┘        │
│                                                             │
│  [x input slider: -5 ←──●──→ +5]  Current x: 1.5           │
│                                                             │
│  ┌─ Select Functions (multi-select) ─────────────────────┐ │
│  │ [✓] Sigmoid  [✓] ReLU  [ ] Tanh  [ ] Leaky ReLU       │ │
│  │ [ ] ELU  [ ] Swish  [ ] GELU  [ ] Softplus            │ │
│  └───────────────────────────────────────────────────────┘ │
│                                                             │
├─────────────────────────────────────────────────────────────┤
│  COMPARISON TABLE                                           │
│  ┌──────────┬─────────┬──────────┬───────────┬───────────┐ │
│  │ Function │  f(1.5) │  f'(1.5) │   Range   │ Zero-ctr? │ │
│  ├──────────┼─────────┼──────────┼───────────┼───────────┤ │
│  │ Sigmoid  │  0.818  │   0.150  │  (0, 1)   │    No     │ │
│  │ ReLU     │  1.500  │   1.000  │  [0, ∞)   │    No     │ │
│  └──────────┴─────────┴──────────┴───────────┴───────────┘ │
└─────────────────────────────────────────────────────────────┘
```

**Interactions:**
- Drag x-value slider — vertical line moves on both graphs
- Multi-select activation functions to compare (up to 4)
- Click a function in legend to solo/highlight it
- Hover graph for precise (x, y) coordinates

**Visual Effects:**
- Each function has distinct color
- Current x position shown as vertical dashed line on both graphs
- Gradient magnitude on derivative graph shown as glow intensity
- "Saturation zones" highlighted (where derivative ≈ 0)

**Key Formulas Displayed (toggleable):**
```
Sigmoid:   f(x) = 1/(1+e⁻ˣ)         f'(x) = f(x)(1-f(x))
ReLU:      f(x) = max(0, x)         f'(x) = 1 if x>0 else 0
Tanh:      f(x) = (eˣ-e⁻ˣ)/(eˣ+e⁻ˣ) f'(x) = 1 - f(x)²
LeakyReLU: f(x) = max(αx, x)        f'(x) = 1 if x>0 else α
```

**Insights Panel:**
- "Sigmoid saturates → gradients vanish in deep networks"
- "ReLU's constant derivative avoids vanishing gradient"
- "Dying ReLU: neurons stuck at 0 if inputs always negative"

---

### Artifact 3: Loss Landscape Navigator

**Learning Objective:** Visualize gradient descent as navigating a loss surface; understand local minima, saddle points, and learning rate effects.

**Visual Layout:**
```
┌─────────────────────────────────────────────────────────────┐
│  LOSS LANDSCAPE NAVIGATOR                                   │
├─────────────────────────────────────────────────────────────┤
│                                                             │
│  ┌────────────────────────────────┐  ┌──────────────────┐  │
│  │                                │  │ Loss over steps  │  │
│  │     3D Loss Surface            │  │      ╲           │  │
│  │       (rotatable)              │  │       ╲__        │  │
│  │                                │  │          ╲___    │  │
│  │         ●←current position     │  │              ──  │  │
│  │        ↙                       │  │                  │  │
│  │       ●                        │  │                  │  │
│  │      trajectory                │  └──────────────────┘  │
│  │                                │                        │
│  │                                │  w₁: [====●=====]     │
│  │                                │  w₂: [=======●==]     │
│  └────────────────────────────────┘                        │
│                                                             │
│  [▶ Drop Ball] [Reset] [Landscape: ▼ Convex Bowl]          │
│  Learning Rate: [0.01 ←●→ 1.0]   Steps: 47                 │
│                                                             │
├─────────────────────────────────────────────────────────────┤
│  Current Position: w₁=0.32, w₂=-0.15   Loss: 0.0234       │
│  Gradient: ∇L = [0.12, -0.08]   |∇L| = 0.14               │
└─────────────────────────────────────────────────────────────┘
```

**Landscape Options:**
1. **Convex Bowl** — Simple quadratic, guaranteed global minimum
2. **Ravine** — Narrow valley, shows why momentum helps
3. **Saddle Point** — Flat region, demonstrates SGD escape
4. **Multiple Minima** — Local vs global minimum challenge
5. **Rosenbrock** — Classic hard optimization benchmark

**Interactions:**
- Click anywhere on surface to set starting position
- "Drop Ball" starts gradient descent animation
- Drag to rotate 3D view
- Adjust learning rate mid-descent to see effects
- Toggle between surface view and contour (top-down) view

**Visual Effects:**
- Ball leaves trajectory trail (fading older positions)
- Gradient vector arrow at current position
- Contour lines colored by loss value
- "Danger zone" highlights (high curvature = potential overshoot)

**Insights Panel:**
- "High learning rate → overshooting the minimum"
- "Saddle points: gradient ≈ 0 but not a minimum"
- "Local minima: good enough in practice for neural nets"

---

### Artifact 4: Learning Rate Lab

**Learning Objective:** Develop intuition for learning rate selection by seeing identical networks trained with different rates simultaneously.

**Visual Layout:**
```
┌─────────────────────────────────────────────────────────────┐
│  LEARNING RATE LAB                                          │
├─────────────────────────────────────────────────────────────┤
│                                                             │
│  ┌─────────────┐ ┌─────────────┐ ┌─────────────┐           │
│  │  η = 0.001  │ │  η = 0.1    │ │  η = 1.0    │           │
│  │   "Slow"    │ │  "Good"     │ │   "Fast"    │           │
│  │             │ │             │ │             │           │
│  │  ╲          │ │ ╲           │ │ ~∼~∼~∼∼    │           │
│  │   ╲         │ │  ╲__        │ │             │           │
│  │    ╲        │ │     ╲___    │ │ DIVERGED!  │           │
│  │     ╲       │ │         ──  │ │             │           │
│  │      ╲      │ │             │ │             │           │
│  │  Loss: 0.42 │ │  Loss: 0.02 │ │  Loss: NaN  │           │
│  │  Step: 1000 │ │  Step: 1000 │ │  Step: 47   │           │
│  └─────────────┘ └─────────────┘ └─────────────┘           │
│                                                             │
│  ┌───────────────────────────────────────────────────────┐ │
│  │              COMBINED LOSS PLOT                        │ │
│  │  Loss                                                  │ │
│  │   │   ∼ η=1.0 (explodes)                              │ │
│  │   │ ╲                                                  │ │
│  │   │  ╲── η=0.001 (slow)                               │ │
│  │   │   ╲                                                │ │
│  │   │    ╲___── η=0.1 (good)                            │ │
│  │   └────────────────────────────────────────── Steps   │ │
│  └───────────────────────────────────────────────────────┘ │
│                                                             │
│  [▶ Play]  [Reset]  [Step-by-Step]                         │
│  Custom rates: [0.001] [0.1] [1.0] [+ Add]                 │
└─────────────────────────────────────────────────────────────┘
```

**Interactions:**
- Play/pause synchronized training
- Step-by-step mode for detailed observation
- Add custom learning rate panels (up to 5)
- Click any panel to expand and see weight trajectory

**Visual Effects:**
- Divergence shown with explosion animation + "NaN" warning
- Optimal rate highlighted with green border
- Loss curves in different colors, overlaid for comparison
- Weight trajectory shown in 2D contour view per panel

**Scenarios:**
1. Simple convex loss (easy to see convergence)
2. Non-convex with local minima (different rates → different minima)
3. High-dimensional (10 params, show aggregate behavior)

**Insights Panel:**
- "Too small: slow convergence, may not finish in time"
- "Too large: overshoots minimum, may diverge"
- "Just right: fast convergence to good solution"
- "Adaptive rates (Adam, etc.) adjust automatically"

---

### Artifact 5: Batch vs SGD Visualizer

**Learning Objective:** Understand the tradeoffs between batch gradient descent, stochastic gradient descent (SGD), and mini-batch.

**Visual Layout:**
```
┌─────────────────────────────────────────────────────────────┐
│  BATCH vs STOCHASTIC GRADIENT DESCENT                       │
├─────────────────────────────────────────────────────────────┤
│                                                             │
│  ┌─────────────────────────────────────────────────────┐   │
│  │                 CONTOUR PLOT                         │   │
│  │                                                      │   │
│  │     ● Start                                          │   │
│  │      ╲                                               │   │
│  │       ╲ ← Batch (smooth)                             │   │
│  │        ╲                                             │   │
│  │         ●───────────●                                │   │
│  │              ↑                                       │   │
│  │        SGD (noisy)                                   │   │
│  │       ↙↘↙↘↙↘                                        │   │
│  │              ●───●                                   │   │
│  │               Mini-batch                             │   │
│  │                  ↓                                   │   │
│  │                  ★ Minimum                           │   │
│  └─────────────────────────────────────────────────────┘   │
│                                                             │
│  ┌─────────────────┐  ┌─────────────────┐                  │
│  │ Gradient Noise  │  │ Compute per Step│                  │
│  │    vs Step      │  │    Comparison   │                  │
│  │  Batch: ──      │  │  Batch:   ████  │                  │
│  │  Mini:  ∿∿      │  │  Mini:    ██    │                  │
│  │  SGD:   ∼∼∼     │  │  SGD:     █     │                  │
│  └─────────────────┘  └─────────────────┘                  │
│                                                             │
│  Dataset size: [100 ●─────── 10000]                        │
│  Batch size:   [1] [32] [Full]    [▶ Run All]              │
└─────────────────────────────────────────────────────────────┘
```

**Interactions:**
- Adjust dataset size and batch sizes
- Run all three methods simultaneously
- Click to set starting point
- Hover trajectory to see exact gradient at each step

**Visual Effects:**
- Batch: smooth, direct path
- Mini-batch: slightly wobbly path
- SGD: very noisy path but explores more
- Animation shows "samples used" at each step

**Key Comparisons:**
| Aspect | Batch | Mini-Batch | SGD |
|--------|-------|------------|-----|
| Gradient noise | None | Low | High |
| Compute/step | High | Medium | Low |
| Memory | High | Medium | Low |
| Escapes local min | Poor | Good | Best |

**Insights Panel:**
- "Noise in SGD helps escape shallow local minima"
- "Mini-batch: best of both worlds (practice standard)"
- "Batch sees whole dataset → accurate but expensive"

---

### Artifact 6: Optimizer Zoo

**Learning Objective:** Understand how different optimizers (SGD, Momentum, RMSprop, Adam) navigate loss landscapes differently.

**Visual Layout:**
```
┌─────────────────────────────────────────────────────────────┐
│  OPTIMIZER ZOO — Racing to the Minimum                      │
├─────────────────────────────────────────────────────────────┤
│                                                             │
│  ┌─────────────────────────────────────────────────────┐   │
│  │                  LOSS LANDSCAPE                      │   │
│  │                                                      │   │
│  │    ● SGD (blue)        ● Momentum (green)           │   │
│  │    ● RMSprop (orange)  ● Adam (purple)              │   │
│  │                                                      │   │
│  │         ───────────────────                          │   │
│  │        /                   \                         │   │
│  │       /    ●→→→→            \    Ravine landscape   │   │
│  │      │        ↓↓↓            │                       │   │
│  │      │          ●→→→→●★      │                       │   │
│  │       \                     /                        │   │
│  │        ─────────────────────                         │   │
│  │                                                      │   │
│  └─────────────────────────────────────────────────────┘   │
│                                                             │
│  ┌─ Optimizer Stats ────────────────────────────────────┐  │
│  │ Optimizer │ Steps │ Final Loss │ Status             │  │
│  │ SGD       │  342  │   0.0234   │ ✓ Converged        │  │
│  │ Momentum  │  127  │   0.0012   │ ✓ Converged        │  │
│  │ RMSprop   │   89  │   0.0008   │ ✓ Converged        │  │
│  │ Adam      │   64  │   0.0003   │ ✓ Converged        │  │
│  └───────────────────────────────────────────────────────┘  │
│                                                             │
│  [▶ Race!] [Reset] [Landscape: ▼ Ravine]                   │
│  Show: [✓] SGD [✓] Momentum [✓] RMSprop [✓] Adam          │
└─────────────────────────────────────────────────────────────┘
```

**Optimizers Included:**
1. **SGD** — Vanilla gradient descent
2. **SGD + Momentum** — Accumulates velocity
3. **RMSprop** — Adapts per-parameter learning rates
4. **Adam** — Momentum + RMSprop combined
5. **(Bonus) AdaGrad** — Historical gradient scaling

**Landscape Options:**
- Ravine (shows momentum advantage)
- Saddle point (shows noise/Adam advantage)
- Noisy gradients (shows adaptive rate advantage)
- Sparse gradients (shows AdaGrad advantage)

**Interactions:**
- Toggle optimizers on/off
- Adjust hyperparameters (β₁, β₂, ε for Adam)
- Watch race in real-time or step-by-step
- Click any trajectory point for detailed state

**Visual Effects:**
- Each optimizer = distinct color + icon
- Velocity vectors shown for momentum-based
- "Effective learning rate" visualized as ball size
- Win animation when first reaches minimum

**Algorithm Panels (expandable):**
```
Momentum: v = βv + ∇L; w = w - ηv
RMSprop: s = ρs + (1-ρ)(∇L)²; w = w - η·∇L/√(s+ε)
Adam:    m = β₁m + (1-β₁)∇L; v = β₂v + (1-β₂)(∇L)²
         w = w - η·m̂/√(v̂+ε)
```

---

### Artifact 7: Universal Approximation Demo

**Learning Objective:** See how adding neurons allows networks to approximate arbitrarily complex functions.

**Visual Layout:**
```
┌─────────────────────────────────────────────────────────────┐
│  UNIVERSAL APPROXIMATION THEOREM                            │
│  "A network with enough hidden neurons can fit any function"│
├─────────────────────────────────────────────────────────────┤
│                                                             │
│  ┌─────────────────────────────────────────────────────┐   │
│  │                                                      │   │
│  │    Target Function (dashed)                          │   │
│  │    - - - - - ∩ - - - - -                            │   │
│  │              ∪                                       │   │
│  │                                                      │   │
│  │    Network Approximation (solid)                     │   │
│  │    ────────╱╲────────                                │   │
│  │           ╱  ╲                                       │   │
│  │                                                      │   │
│  │    Error highlighted in red                          │   │
│  └─────────────────────────────────────────────────────┘   │
│                                                             │
│  Hidden Neurons: [1] [2] [4] [8] [16] [+ Add One]          │
│  Current: 4 neurons   MSE: 0.0342                          │
│                                                             │
│  ┌─ Network Architecture ─────────────────────────────────┐ │
│  │    ●                                                   │ │
│  │   x ──●──●──●──● → y                                  │ │
│  │        4 hidden                                        │ │
│  └────────────────────────────────────────────────────────┘ │
│                                                             │
│  Target: [▼ Sine Wave] [Square Wave] [Custom Draw]         │
│  [Auto-Train] [Step] [Show Individual Neurons]             │
└─────────────────────────────────────────────────────────────┘
```

**Target Functions:**
- Sine wave (smooth, easy)
- Square wave (discontinuous)
- Gaussian bump
- XOR pattern (classic)
- Custom (user draws with mouse)

**Interactions:**
- Add neurons one at a time, watch fit improve
- "Show Individual Neurons" reveals each neuron's contribution
- Draw custom target function
- Auto-train until convergence

**Visual Effects:**
- Each neuron's contribution shown as separate translucent curve
- Sum = network output shown solid
- Error region filled in red/pink
- Animation when adding neuron shows function "morphing"

**Key Insight:**
- 1 neuron = can fit linear function
- 2 neurons = one "bump" or "step"
- N neurons = N-1 "bends" in the function
- Show how sigmoid basis functions combine

---

### Artifact 8: Convolution Visualizer

**Learning Objective:** Understand convolution, feature maps, pooling, and how CNNs see images.

**Visual Layout:**
```
┌─────────────────────────────────────────────────────────────┐
│  CONVOLUTION VISUALIZER                                     │
├─────────────────────────────────────────────────────────────┤
│                                                             │
│  ┌─────────┐      ┌─────────┐      ┌─────────┐             │
│  │ INPUT   │  ★   │ KERNEL  │  =   │ OUTPUT  │             │
│  │ IMAGE   │      │ (3×3)   │      │ FEATURE │             │
│  │         │      │         │      │   MAP   │             │
│  │ 28×28   │      │ ┌─┬─┬─┐ │      │         │             │
│  │         │      │ │1│0│-1│ │      │ 26×26   │             │
│  │ [img]   │      │ ├─┼─┼─┤ │      │         │             │
│  │         │      │ │2│0│-2│ │      │ [map]   │             │
│  │  ┌──┐   │      │ ├─┼─┼─┤ │      │         │             │
│  │  │▓▓│←  │      │ │1│0│-1│ │      │  ●      │             │
│  │  └──┘   │      │ └─┴─┴─┘ │      │         │             │
│  └─────────┘      └─────────┘      └─────────┘             │
│                                                             │
│  Step: [◀ Prev] [▶ Next] [▶▶ Animate] position: (12, 8)    │
│                                                             │
│  ┌─ Computation ──────────────────────────────────────────┐ │
│  │ output[12,8] = Σᵢⱼ input[12+i, 8+j] × kernel[i,j]     │ │
│  │             = 1×1 + 0×0 + ... = 2.34                   │ │
│  └────────────────────────────────────────────────────────┘ │
│                                                             │
│  Kernel Presets: [Edge-H] [Edge-V] [Sharpen] [Blur] [Custom]│
│  Image: [▼ Digit '7'] [Upload] [Draw]                      │
└─────────────────────────────────────────────────────────────┘
```

**Operations Shown:**
1. **Convolution** — Kernel sliding over image
2. **Padding** — Same vs valid convolution
3. **Stride** — Skip positions
4. **Pooling** — Max pool, average pool

**Kernel Presets:**
- Horizontal edge detector (Sobel)
- Vertical edge detector
- Sharpen
- Blur (Gaussian)
- Emboss
- Custom (user edits values)

**Interactions:**
- Step through convolution position by position
- Edit kernel values directly
- Toggle padding on/off
- Adjust stride
- Upload custom image or draw

**Visual Effects:**
- Highlight current kernel position on input
- Show element-wise multiplication
- Animate kernel sliding
- Feature map builds incrementally

**Extended Features:**
- Multi-channel convolution (RGB → feature maps)
- Show multiple kernels → multiple feature maps
- Pooling layer visualization

---

### Artifact 9: Attention Mechanism Flow

**Learning Objective:** Understand how transformers use Query, Key, Value matrices to compute attention weights.

**Visual Layout:**
```
┌─────────────────────────────────────────────────────────────┐
│  ATTENTION MECHANISM FLOW                                   │
├─────────────────────────────────────────────────────────────┤
│                                                             │
│  Input: "The cat sat on the mat"                           │
│         [The] [cat] [sat] [on] [the] [mat]                 │
│                                                             │
│  ┌─────────────────────────────────────────────────────┐   │
│  │              ATTENTION WEIGHTS HEATMAP               │   │
│  │                                                      │   │
│  │        The  cat  sat  on  the  mat                   │   │
│  │   The  0.1  0.1  0.1  0.1  0.5  0.1                  │   │
│  │   cat  0.2  0.3  0.2  0.1  0.1  0.1   ← "cat"       │   │
│  │   sat  0.1  0.4  0.2  0.1  0.1  0.1      attends    │   │
│  │   on   0.1  0.1  0.1  0.2  0.2  0.3      to "cat"   │   │
│  │   the  0.1  0.1  0.1  0.2  0.2  0.3      most       │   │
│  │   mat  0.1  0.1  0.1  0.3  0.2  0.2                  │   │
│  │                                                      │   │
│  └─────────────────────────────────────────────────────┘   │
│                                                             │
│  ┌─ Q·Kᵀ Computation ──┐  ┌─ Softmax ──┐  ┌─ Output ────┐ │
│  │ Query: "sat"        │  │ scores →   │  │ weighted    │ │
│  │ × all Keys          │  │ weights    │  │ sum of V    │ │
│  └─────────────────────┘  └────────────┘  └─────────────┘ │
│                                                             │
│  Focus on word: [▼ sat]   [Show Q/K/V matrices]            │
│  Example: [▼ Simple] [Long-range] [Pronoun resolution]     │
└─────────────────────────────────────────────────────────────┘
```

**Interactions:**
- Select any word to see what it attends to
- Hover heatmap cell for exact weight
- Toggle between single-head and multi-head view
- Try different example sentences

**Example Sentences:**
1. "The cat sat on the mat" (simple)
2. "The trophy doesn't fit in the suitcase because it is too big" (pronoun resolution)
3. "Despite the rain, they decided to go" (long-range dependency)

**Visual Effects:**
- Attention weights as connecting lines (thickness = weight)
- Heatmap with color intensity
- Animation showing Q·K computation
- Softmax "sharpening" visualization

**Detailed Views:**
- Q, K, V matrices shown
- Scaled dot-product attention formula
- Multi-head attention (show heads separately)

---

### Artifact 10: Vanishing/Exploding Gradients Visualizer

**Learning Objective:** Understand why deep networks have gradient flow problems and how activation functions affect this.

**Visual Layout:**
```
┌─────────────────────────────────────────────────────────────┐
│  VANISHING / EXPLODING GRADIENTS                            │
├─────────────────────────────────────────────────────────────┤
│                                                             │
│  Network: 10 layers                                         │
│  ●──●──●──●──●──●──●──●──●──●──●                           │
│  L1 L2 L3 L4 L5 L6 L7 L8 L9 L10                            │
│                                                             │
│  ┌─────────────────────────────────────────────────────┐   │
│  │           GRADIENT MAGNITUDE BY LAYER                │   │
│  │  |∇|                                                 │   │
│  │   │                                                  │   │
│  │   │ ████                                             │   │
│  │   │ ████ ██                                          │   │
│  │   │ ████ ████ █                                      │   │
│  │   │ ████ ████ ███ ▄                                  │   │
│  │   │ ████ ████ ████ ██ ▄  (vanishing!)               │   │
│  │   └─────────────────────────────────────── Layer    │   │
│  │      L1   L2   L3  L4  L5  L6  L7  L8  L9  L10      │   │
│  └─────────────────────────────────────────────────────┘   │
│                                                             │
│  Activation: [● Sigmoid] [ ] ReLU [ ] Tanh                 │
│  Depth: [5 ●─────────────────────────── 50]                │
│  Init: [▼ Xavier] [He] [Random]                            │
│                                                             │
│  [▶ Forward+Backward] [Reset]                              │
│                                                             │
│  Status: ⚠️ Gradients vanishing! First layer grad: 1e-8    │
└─────────────────────────────────────────────────────────────┘
```

**Interactions:**
- Adjust network depth (5-50 layers)
- Switch activation functions
- Change weight initialization
- Run forward + backward pass

**Activation Comparison:**
- Sigmoid: shows vanishing (saturates, derivative < 1)
- Tanh: shows vanishing (less severe)
- ReLU: no vanishing (but show dead neurons)
- Leaky ReLU: healthy gradients

**Visual Effects:**
- Bar height = gradient magnitude (log scale)
- Color: green (healthy) → yellow (warning) → red (vanishing/exploding)
- Activation function plot shown with derivative
- Animation of gradient flowing backward

**Warnings Displayed:**
- "Vanishing: gradient < 1e-6"
- "Exploding: gradient > 1e6"
- "Dead ReLU: X% of neurons output 0"

---

### Artifact 11: Overfitting Sandbox

**Learning Objective:** Understand the bias-variance tradeoff by adjusting model complexity vs data complexity.

**Visual Layout:**
```
┌─────────────────────────────────────────────────────────────┐
│  OVERFITTING / UNDERFITTING SANDBOX                         │
├─────────────────────────────────────────────────────────────┤
│                                                             │
│  ┌───────────────────────┐  ┌───────────────────────┐      │
│  │    DATA + MODEL FIT   │  │   LOSS CURVES          │      │
│  │                       │  │                        │      │
│  │    · ·  ╱──╲  ·       │  │   ─── Train loss      │      │
│  │   ·    ╱    ╲   ·     │  │   --- Val loss        │      │
│  │  · ·  ╱      ╲  · ·   │  │                        │      │
│  │      ╱        ╲       │  │   \                    │      │
│  │  · ·           · ·    │  │    \   ___----        │      │
│  │                       │  │     \_/    ↑          │      │
│  │  ●=train  ○=validation│  │           Gap!        │      │
│  │                       │  │                        │      │
│  └───────────────────────┘  └───────────────────────┘      │
│                                                             │
│  Model Complexity: [Low ●────────────────────── High]      │
│                    Linear        Polynomial deg 20         │
│                                                             │
│  Data: [●──────────●] N=50     Noise: [●────────●] σ=0.3   │
│                                                             │
│  ┌─ Diagnosis ────────────────────────────────────────────┐ │
│  │ Status: ⚠️ OVERFITTING                                 │ │
│  │ Train Loss: 0.001  |  Val Loss: 0.523                  │ │
│  │ Recommendation: Reduce complexity or add more data     │ │
│  └────────────────────────────────────────────────────────┘ │
└─────────────────────────────────────────────────────────────┘
```

**Adjustable Parameters:**
- Model complexity (polynomial degree 1-20, or neural net width)
- Dataset size (10-1000 points)
- Noise level (σ = 0 to 1)
- Train/val split ratio

**Scenarios:**
1. **Underfitting** — Low complexity, high bias
2. **Just Right** — Balanced complexity
3. **Overfitting** — High complexity, high variance

**Visual Effects:**
- Train/val loss curves diverging = overfitting signal
- Model fit line shows wiggles (overfit) vs straight (underfit)
- Train points (filled), val points (hollow)
- "Decision boundary" for classification tasks

**Insights Panel:**
- Automatic diagnosis: "underfitting", "good fit", "overfitting"
- Recommendations shown
- Bias-variance decomposition visualization

---

### Artifact 12: Regularization Effects

**Learning Objective:** Understand how L1, L2, and dropout regularization prevent overfitting.

**Visual Layout:**
```
┌─────────────────────────────────────────────────────────────┐
│  REGULARIZATION EFFECTS                                     │
├─────────────────────────────────────────────────────────────┤
│                                                             │
│  ┌───────────────┐ ┌───────────────┐ ┌───────────────┐     │
│  │  NO REGULARIZ │ │    L2 (0.1)   │ │  DROPOUT (0.5)│     │
│  │               │ │               │ │               │     │
│  │   Overfit!    │ │   Smooth      │ │   Robust      │     │
│  │   ∿∿∿∿∿∿∿∿∿   │ │   ────────    │ │   ──────────  │     │
│  │               │ │               │ │               │     │
│  └───────────────┘ └───────────────┘ └───────────────┘     │
│                                                             │
│  ┌─────────────────────────────────────────────────────┐   │
│  │              WEIGHT DISTRIBUTION                     │   │
│  │                                                      │   │
│  │   None:    ████████  ████████  (spread)             │   │
│  │   L2:       ██████████████     (centered, small)    │   │
│  │   L1:      █▓▓▓░░░░░░░░░░▓▓▓█  (sparse!)           │   │
│  └─────────────────────────────────────────────────────┘   │
│                                                             │
│  ┌─ Controls ─────────────────────────────────────────────┐ │
│  │ L1 (Lasso):  [0 ●────────── 1.0]  λ = 0.05           │ │
│  │ L2 (Ridge):  [0 ●────────── 1.0]  λ = 0.10           │ │
│  │ Dropout:     [0 ●────────── 0.9]  p = 0.50           │ │
│  └────────────────────────────────────────────────────────┘ │
│                                                             │
│  [▶ Train] [Reset] [Show weight trajectories]              │
└─────────────────────────────────────────────────────────────┘
```

**Regularization Methods:**
1. **None** — Baseline (overfits)
2. **L1 (Lasso)** — Encourages sparsity
3. **L2 (Ridge)** — Encourages small weights
4. **Elastic Net** — L1 + L2 combined
5. **Dropout** — Random neuron deactivation

**Visual Effects:**
- Weight histogram showing distribution
- L1: many weights at exactly 0 (sparse)
- L2: Gaussian-like, centered at 0
- Dropout: show "dropped" neurons grayed out during training

**Comparison View:**
- Side-by-side decision boundaries
- Loss curves with regularization term shown
- Weight magnitude over training

**Interactions:**
- Adjust regularization strength (λ)
- Adjust dropout probability (p)
- Toggle regularizations on/off
- See loss decomposition: data loss + reg loss

---

## Shared Components Library

To ensure visual consistency and reduce duplication, create these shared components:

### 1. NetworkDiagram
```jsx
<NetworkDiagram
  layers={[2, 4, 1]}
  weights={...}
  activations="relu"
  highlightNeurons={[1, 2]}
  showSignalFlow={true}
/>
```

### 2. LossLandscape
```jsx
<LossLandscape
  type="convex" // convex | ravine | saddle | multimodal
  trajectories={[{color: 'blue', points: [...]}]}
  currentPosition={[0.5, 0.3]}
  viewMode="3d" // 3d | contour
/>
```

### 3. ActivationPlot
```jsx
<ActivationPlot
  functions={['sigmoid', 'relu', 'tanh']}
  showDerivative={true}
  currentX={1.5}
/>
```

### 4. LossCurves
```jsx
<LossCurves
  data={[
    {name: 'Train', values: [...]},
    {name: 'Val', values: [...]}
  ]}
  xLabel="Epoch"
  yLabel="Loss"
/>
```

### 5. ControlPanel
```jsx
<ControlPanel>
  <PlayButton onClick={...} isRunning={...} />
  <Slider label="Learning Rate" min={0.001} max={1} />
  <Toggle label="Show Gradients" />
  <Select label="Optimizer" options={[...]} />
</ControlPanel>
```

### 6. InsightCard
```jsx
<InsightCard
  type="tip" // tip | warning | info
  title="Why this happens"
  content="..."
  visible={condition}
/>
```

---

## Design System

### Colors

```javascript
const colors = {
  // Phase colors (from existing backprop viz)
  forward: '#3b82f6',    // blue-500
  error: '#f59e0b',      // amber-500
  backward: '#ef4444',   // red-500
  update: '#22c55e',     // green-500

  // Element colors
  neuron: {
    input: '#60a5fa',    // blue-400
    hidden: '#a78bfa',   // violet-400
    output: '#34d399',   // emerald-400
  },

  // Weight visualization
  weight: {
    positive: '#22c55e', // green
    negative: '#ef4444', // red
    zero: '#6b7280',     // gray
  },

  // Background
  bg: {
    primary: '#0f172a',   // slate-900
    secondary: '#1e293b', // slate-800
    tertiary: '#334155',  // slate-700
  },

  // Text
  text: {
    primary: '#f8fafc',   // slate-50
    secondary: '#94a3b8', // slate-400
    muted: '#64748b',     // slate-500
  }
};
```

### Typography

```javascript
const typography = {
  title: 'text-3xl font-bold',
  subtitle: 'text-xl font-semibold',
  body: 'text-base',
  caption: 'text-sm text-slate-400',
  code: 'font-mono text-sm',
  math: 'font-serif italic',
};
```

### Spacing

```javascript
const spacing = {
  section: 'mb-6',
  card: 'p-6',
  controls: 'gap-3',
  tight: 'gap-1',
};
```

---

## Implementation Roadmap

### Phase 1: Foundation (Week 1-2)
- [ ] Set up repository structure
- [ ] Create shared component library
- [ ] Artifact 1: Neuron Anatomy Explorer
- [ ] Artifact 2: Activation Function Playground
- [ ] Artifact 3: Loss Landscape Navigator

### Phase 2: Training Dynamics (Week 3-4)
- [ ] Artifact 4: Learning Rate Lab
- [ ] Artifact 5: Batch vs SGD Visualizer
- [ ] Artifact 6: Optimizer Zoo

### Phase 3: Architecture (Week 5-6)
- [ ] Artifact 7: Universal Approximation Demo
- [ ] Artifact 8: Convolution Visualizer
- [ ] Artifact 9: Attention Mechanism Flow

### Phase 4: Debugging (Week 7-8)
- [ ] Artifact 10: Vanishing/Exploding Gradients
- [ ] Artifact 11: Overfitting Sandbox
- [ ] Artifact 12: Regularization Effects

### Phase 5: Polish & Documentation (Week 9)
- [ ] Cross-artifact navigation
- [ ] Responsive design testing
- [ ] Accessibility audit
- [ ] Documentation & README
- [ ] Deploy to GitHub Pages

---

## Repository Structure

```
nn-visualizations/
├── README.md
├── package.json
├── src/
│   ├── components/
│   │   ├── shared/
│   │   │   ├── NetworkDiagram.jsx
│   │   │   ├── LossLandscape.jsx
│   │   │   ├── ActivationPlot.jsx
│   │   │   ├── LossCurves.jsx
│   │   │   ├── ControlPanel.jsx
│   │   │   └── InsightCard.jsx
│   │   │
│   │   ├── 01-neuron-anatomy/
│   │   │   └── NeuronAnatomy.jsx
│   │   ├── 02-activation-playground/
│   │   │   └── ActivationPlayground.jsx
│   │   ├── 03-loss-landscape/
│   │   │   └── LossLandscape.jsx
│   │   ... (etc for all 12)
│   │   │
│   │   └── 00-backprop-flow/
│   │       └── BackpropFlow.jsx  (existing)
│   │
│   ├── utils/
│   │   ├── math.js          # sigmoid, relu, derivatives, etc.
│   │   ├── optimizers.js    # SGD, Adam, etc.
│   │   └── datasets.js      # sample training data
│   │
│   ├── hooks/
│   │   ├── useAnimation.js  # requestAnimationFrame wrapper
│   │   └── useTraining.js   # training loop abstraction
│   │
│   └── styles/
│       └── colors.js        # design system tokens
│
├── public/
│   └── index.html
│
└── docs/
    ├── DESIGN_SYSTEM.md
    └── CONTRIBUTING.md
```

---

## Success Metrics

Each artifact should achieve:

1. **Clarity** — Concept understandable in <2 minutes of interaction
2. **Interactivity** — At least 3 user-adjustable parameters
3. **Feedback** — Real-time response to all interactions (<100ms)
4. **Insight** — At least one "aha moment" built in
5. **Standalone** — Works without reading documentation
6. **Shareable** — Single-file component, embeddable

---

## Next Steps

1. **Review this plan** — Confirm scope, suggest modifications
2. **Prioritize** — Which artifacts to build first?
3. **Start building** — Begin with Tier 1 foundations
4. **Iterate** — Test with learners, refine based on feedback

---

*Document version: 1.0*
*Last updated: January 20, 2026*

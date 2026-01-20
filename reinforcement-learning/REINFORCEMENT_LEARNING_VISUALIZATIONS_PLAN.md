# Reinforcement Learning Visualizations

## Project Overview

A collection of interactive educational artifacts for building deep intuition about reinforcement learning concepts. Each visualization is designed to be standalone, interactive, and progressively build understanding from foundational concepts to advanced algorithms.

## Design Philosophy

1. **Interactive First**: Every concept should be explorable through direct manipulation
2. **Visual Intuition**: Prioritize visual representations over mathematical notation
3. **Progressive Complexity**: Each tier builds on the previous one
4. **Immediate Feedback**: Actions should have instant visual consequences
5. **Failure is Learning**: Let users see what happens when things go wrong

---

## Tier 1: Core RL Concepts (Foundation)

### 1.1 The RL Loop Explorer
**Goal**: Understand the fundamental Agent-Environment interaction cycle

**Features**:
- Animated diagram showing Agent → Action → Environment → State/Reward → Agent loop
- Simple grid world where user IS the agent (click to move)
- Real-time display of: current state, action taken, reward received, cumulative return
- Toggle between "human mode" (you control) and "random agent" mode
- Visualize the trajectory as a path on the grid
- Show reward signal as color intensity (green = positive, red = negative)

**Key Concepts**:
- State, Action, Reward, Policy
- Episode vs Continuing tasks
- Return (cumulative reward)

**Interactions**:
- Arrow keys or click to move agent
- Adjust reward values for different cells
- Reset episode button
- Speed control for random agent

---

### 1.2 Markov Decision Process (MDP) Playground
**Goal**: Understand states, actions, transitions, and the Markov property

**Features**:
- Visual state-transition diagram (nodes = states, edges = actions)
- Click states to see outgoing actions and transition probabilities
- Drag sliders to adjust transition probabilities (must sum to 1)
- Color-coded rewards on transitions
- "Markov Property Demo": show that future only depends on current state
- Preset MDPs: Simple Grid, Cliff Walking, Frozen Lake

**Key Concepts**:
- State space, Action space
- Transition function P(s'|s,a)
- Reward function R(s,a,s')
- Markov property visualization

**Interactions**:
- Click to select states/actions
- Drag to adjust probabilities
- Toggle deterministic vs stochastic transitions
- Add/remove states and actions

---

### 1.3 Discount Factor (γ) Visualizer
**Goal**: Build intuition for how discounting affects value

**Features**:
- Timeline showing future rewards
- Slider for γ (0 to 1)
- Bar chart showing discounted value of each future reward
- Total return calculation with formula breakdown
- Side-by-side comparison: γ=0 (myopic) vs γ=1 (far-sighted) vs γ=0.9 (balanced)
- Animation: "shrinking coins" metaphor for discounting

**Key Concepts**:
- Why discount? (mathematical stability, preference for sooner rewards)
- Geometric series intuition
- γ=0 vs γ=1 behavior
- Effective horizon ≈ 1/(1-γ)

**Interactions**:
- Adjust γ with slider
- Set custom reward sequence
- Toggle infinite vs finite horizon
- Compare multiple γ values

---

### 1.4 Policy vs Value Visualizer
**Goal**: Understand the relationship between policies and value functions

**Features**:
- 5x5 grid world with start, goal, and obstacles
- Left panel: Policy view (arrows showing action in each state)
- Right panel: Value view (heatmap of V(s) or Q(s,a))
- Click to modify policy, watch value function update
- "Evaluate Policy" button to compute V^π
- Show that same value can come from different policies

**Key Concepts**:
- Policy π(a|s): probability of action given state
- State value V(s): expected return from state
- Action value Q(s,a): expected return from state-action pair
- Policy evaluation vs improvement

**Interactions**:
- Click cells to change policy arrows
- Toggle V(s) vs Q(s,a) view
- Adjust γ to see value changes
- Reset to uniform random policy

---

## Tier 2: Value-Based Methods

### 2.1 Bellman Equation Explorer
**Goal**: Understand the recursive structure of value functions

**Features**:
- Interactive tree showing one-step lookahead
- Expand nodes to see: reward + γ * V(next_state)
- Animate the "backup" of values from leaves to root
- Show both Bellman expectation (for policy) and optimality (for optimal policy)
- Formula display that highlights which terms correspond to which visual elements

**Key Concepts**:
- V(s) = E[R + γV(s')]
- Q(s,a) = E[R + γ max Q(s',a')]
- Backup diagrams
- Recursive structure

**Interactions**:
- Expand/collapse tree nodes
- Adjust rewards and transitions
- Step through backup animation
- Toggle expectation vs optimality equation

---

### 2.2 Dynamic Programming Lab
**Goal**: See Policy Iteration and Value Iteration in action

**Features**:
- Grid world with customizable rewards
- Side-by-side: Policy Iteration vs Value Iteration
- Step-by-step execution with "Next Step" button
- Highlight which cells are being updated
- Convergence graph showing max value change per iteration
- Color-coded to show: evaluating (blue) vs improving (green)

**Key Concepts**:
- Policy Evaluation: iterative computation of V^π
- Policy Improvement: greedy policy from V
- Value Iteration: combine eval + improve
- Convergence guarantees

**Interactions**:
- Step through iterations manually
- Adjust convergence threshold
- Compare iteration counts between methods
- Pause/resume animation

---

### 2.3 Monte Carlo Methods Visualizer
**Goal**: Understand learning from complete episodes

**Features**:
- Agent plays episodes in grid world
- Track returns for each state visited
- Show averaging process: first-visit vs every-visit MC
- Confidence intervals narrowing as more samples collected
- Histogram of returns for selected state

**Key Concepts**:
- Learning from experience (no model needed)
- First-visit vs every-visit
- Sample averaging
- High variance, zero bias

**Interactions**:
- Run single episode or batch
- Select states to see return distribution
- Toggle first-visit vs every-visit
- Adjust exploration (ε-greedy)

---

### 2.4 TD Learning Playground
**Goal**: Understand Temporal Difference learning and bootstrapping

**Features**:
- Compare MC vs TD(0) vs TD(λ) learning
- Visualize TD error: δ = R + γV(s') - V(s)
- Show how TD updates after each step (vs MC waiting for episode end)
- Eligibility traces visualization for TD(λ)
- Learning curve comparison

**Key Concepts**:
- Bootstrapping: learning from estimates
- TD error as prediction error
- Bias-variance tradeoff (TD has bias, lower variance)
- TD(λ) as interpolation between MC and TD(0)

**Interactions**:
- Adjust learning rate α
- Adjust λ for TD(λ)
- Step through updates
- Compare learning curves

---

### 2.5 Q-Learning vs SARSA Arena
**Goal**: Understand on-policy vs off-policy learning

**Features**:
- Cliff Walking environment (classic example)
- Run Q-Learning and SARSA side-by-side
- Show different learned policies (Q-Learning: optimal but risky, SARSA: safe)
- Visualize the update rules difference
- Episode reward comparison graph

**Key Concepts**:
- On-policy (SARSA): learn about policy being followed
- Off-policy (Q-Learning): learn about optimal policy while following exploratory policy
- The cliff walking example shows the difference clearly
- Exploration vs exploitation

**Interactions**:
- Adjust ε for exploration
- Adjust learning rate
- Watch agents learn in real-time
- Compare final policies

---

## Tier 3: Policy-Based Methods

### 3.1 Policy Gradient Intuition
**Goal**: Understand the idea of directly optimizing the policy

**Features**:
- Simple 1D continuous action space (e.g., how far to throw a ball)
- Gaussian policy visualization: μ and σ
- Show how gradient pushes μ toward higher reward actions
- Visualize: "increase probability of good actions"
- Compare with value-based approach

**Key Concepts**:
- Policy parameterization
- Likelihood ratio trick
- REINFORCE algorithm basics
- Why policy gradient? (continuous actions, stochastic policies)

**Interactions**:
- Adjust policy parameters manually
- Run gradient updates
- See policy distribution change
- Visualize gradient direction

---

### 3.2 REINFORCE Step-by-Step
**Goal**: Understand the complete REINFORCE algorithm

**Features**:
- Episode playback with trajectory
- For each step: show action probability, reward, return-to-go
- Gradient computation visualization
- How high returns reinforce those actions
- Baseline subtraction demo (reduce variance)

**Key Concepts**:
- Monte Carlo policy gradient
- ∇J = E[∇log π(a|s) * G]
- High variance problem
- Baseline doesn't change expectation but reduces variance

**Interactions**:
- Step through gradient computation
- Toggle baseline on/off
- See variance reduction
- Adjust learning rate

---

### 3.3 Actor-Critic Architecture
**Goal**: Understand combining policy and value learning

**Features**:
- Dual visualization: Actor (policy) and Critic (value)
- Show how Critic provides TD error for Actor updates
- Compare with pure REINFORCE (Critic reduces variance)
- Network architecture diagram (shared vs separate)

**Key Concepts**:
- Actor: policy πθ(a|s)
- Critic: value Vw(s) or Qw(s,a)
- Advantage function: A(s,a) = Q(s,a) - V(s)
- TD error as advantage estimate

**Interactions**:
- Toggle shared vs separate networks
- Step through actor and critic updates
- Visualize advantage values
- Compare learning curves

---

### 3.4 Advantage Estimation Visualizer
**Goal**: Understand different ways to estimate advantage

**Features**:
- Compare: TD error, Monte Carlo, GAE(λ)
- Show bias-variance tradeoff
- λ slider for GAE interpolation
- Trajectory with advantage values displayed

**Key Concepts**:
- Why advantage? (reduces variance)
- TD advantage: low variance, some bias
- MC advantage: no bias, high variance
- GAE: tunable tradeoff with λ

**Interactions**:
- Adjust λ
- See advantage estimates change
- Compare variance across methods
- Step through trajectory

---

## Tier 4: Advanced Topics

### 4.1 Exploration Strategies Gallery
**Goal**: Compare different exploration methods

**Features**:
- Multi-armed bandit testbed
- Compare: ε-greedy, UCB, Thompson Sampling, Boltzmann
- Real-time regret curves
- Visualize uncertainty estimates (for UCB, Thompson)
- Show exploration-exploitation tradeoff

**Key Concepts**:
- Exploration vs exploitation dilemma
- Optimism in the face of uncertainty
- Regret as performance metric
- When each method shines

**Interactions**:
- Adjust exploration parameters
- Set bandit arm distributions
- Compare methods head-to-head
- See cumulative regret

---

### 4.2 Experience Replay Buffer
**Goal**: Understand why and how replay buffers work

**Features**:
- Visualize buffer as circular queue
- Show correlation in sequential data (bad for learning)
- Demonstrate how random sampling breaks correlation
- Prioritized replay: show how TD error affects sampling probability

**Key Concepts**:
- Why replay? (sample efficiency, decorrelation)
- Uniform vs prioritized sampling
- Importance sampling correction
- Buffer size tradeoffs

**Interactions**:
- Add experiences to buffer
- Sample batches (uniform vs prioritized)
- Visualize priority distribution
- Adjust buffer size

---

### 4.3 Target Network Stabilization
**Goal**: Understand why DQN uses target networks

**Features**:
- Show the "deadly triad" instability without target network
- Visualize Q-value oscillation vs stability
- Soft update (Polyak averaging) vs hard update
- Training curves comparison

**Key Concepts**:
- Moving target problem
- Stabilization through delayed updates
- τ parameter for soft updates
- Double DQN for overestimation

**Interactions**:
- Toggle target network on/off
- Adjust update frequency
- Adjust τ for soft updates
- See stability difference

---

### 4.4 PPO Trust Region Visualizer
**Goal**: Understand clipped surrogate objective

**Features**:
- Visualize policy ratio r(θ) = π_new / π_old
- Show clipping boundaries [1-ε, 1+ε]
- Graph of clipped vs unclipped objective
- How clipping prevents too-large updates

**Key Concepts**:
- Policy ratio and importance sampling
- Why constrain updates? (stability)
- Clipping as trust region approximation
- ε parameter effect

**Interactions**:
- Adjust ε clipping parameter
- See how different advantage signs affect clipping
- Visualize gradient flow
- Compare with vanilla policy gradient

---

### 4.5 Reward Shaping Sandbox
**Goal**: Understand how reward design affects learning

**Features**:
- Same task with different reward functions
- Show how dense vs sparse rewards affect learning speed
- Demonstrate potential-based shaping (preserves optimal policy)
- Warning examples: reward hacking

**Key Concepts**:
- Sparse vs dense rewards
- Reward shaping and its dangers
- Potential-based shaping theorem
- Reward hacking examples

**Interactions**:
- Design custom reward functions
- See how agent behavior changes
- Toggle shaping on/off
- Observe reward hacking

---

## Implementation Plan

### Phase 1: Foundation (Tier 1)
Build the core RL concepts that everything else depends on.

**Priority Order**:
1. RL Loop Explorer (most fundamental)
2. Discount Factor Visualizer (simple, high impact)
3. Policy vs Value Visualizer (bridges to value methods)
4. MDP Playground (more complex, but important)

### Phase 2: Value Methods (Tier 2)
Cover the classical algorithms.

**Priority Order**:
1. TD Learning Playground (most important)
2. Q-Learning vs SARSA Arena (classic comparison)
3. Bellman Equation Explorer
4. Dynamic Programming Lab
5. Monte Carlo Methods

### Phase 3: Policy Methods (Tier 3)
Modern deep RL foundations.

**Priority Order**:
1. Policy Gradient Intuition
2. Actor-Critic Architecture
3. REINFORCE Step-by-Step
4. Advantage Estimation

### Phase 4: Advanced (Tier 4)
Deep RL techniques.

**Priority Order**:
1. Exploration Strategies Gallery
2. Experience Replay Buffer
3. Target Network Stabilization
4. PPO Trust Region
5. Reward Shaping Sandbox

---

## Technical Stack

Same as nn-visualizations for consistency:
- **React 19** with functional components and hooks
- **Vite 6** for build tooling
- **Tailwind CSS 4** for styling
- **SVG** for all visualizations
- **No external charting libraries** (custom SVG)

## Shared Components

Reusable across visualizations:
- `GridWorld`: Configurable grid environment
- `StateNode`: Visual state representation
- `PolicyArrow`: Directional action indicator
- `ValueHeatmap`: Color-coded value display
- `LearningCurve`: Performance over time chart
- `ControlPanel`: Sliders, buttons, toggles
- `InfoTooltip`: Hover explanations
- `EpisodePlayer`: Replay trajectories

---

## File Structure

```
rl-visualizations/
├── package.json
├── vite.config.mjs
├── Makefile
├── index.html
├── index.css
├── main.jsx
├── App.jsx
├── README.md
├── components/
│   ├── GridWorld.jsx
│   ├── StateNode.jsx
│   ├── PolicyArrow.jsx
│   ├── ValueHeatmap.jsx
│   ├── LearningCurve.jsx
│   └── InfoTooltip.jsx
├── tier1/
│   ├── rl-loop-explorer.jsx
│   ├── mdp-playground.jsx
│   ├── discount-factor.jsx
│   └── policy-value-viz.jsx
├── tier2/
│   ├── bellman-explorer.jsx
│   ├── dp-lab.jsx
│   ├── monte-carlo.jsx
│   ├── td-learning.jsx
│   └── q-sarsa-arena.jsx
├── tier3/
│   ├── policy-gradient.jsx
│   ├── reinforce.jsx
│   ├── actor-critic.jsx
│   └── advantage-estimation.jsx
└── tier4/
    ├── exploration-strategies.jsx
    ├── replay-buffer.jsx
    ├── target-network.jsx
    ├── ppo-trust-region.jsx
    └── reward-shaping.jsx
```

---

## Success Metrics

For each visualization:
1. **Clarity**: Can someone with no RL background understand the concept?
2. **Interactivity**: Are there meaningful parameters to explore?
3. **Insight**: Does playing with it reveal non-obvious truths?
4. **Connection**: Does it link to other visualizations in the collection?

---

## Notes

- Each visualization should work standalone
- Include "What to try" suggestions for exploration
- Link to relevant papers/resources for deeper learning
- Consider accessibility (color blind friendly palettes, keyboard navigation)
- Mobile-friendly where possible (touch interactions)

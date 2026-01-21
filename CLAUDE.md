# CLAUDE.md - Project Guidelines for AI Assistants

This file contains guidelines for AI assistants (like Claude) working on this codebase. It documents quality standards, common pitfalls, and best practices learned during development.

## Quality Self-Reflection Checklist

Before considering any module or feature complete, evaluate against these criteria:

### 1. Tailwind CSS Best Practices

**Never use dynamic Tailwind classes** - they don't work at build time:

```jsx
// ❌ BAD - Tailwind purges these at build time
className={`bg-${color}-500`}
className={`text-${variant}-400`}
className={`border-${type}-600`}

// ✅ GOOD - Use inline styles for dynamic colors
style={{ backgroundColor: '#3b82f6' }}
style={{ color: info.color }}
style={{ borderColor: selectedItem ? item.color : 'transparent' }}

// ✅ GOOD - Use static conditional classes
className={isActive ? 'bg-blue-500' : 'bg-slate-700'}
```

**Define color values as hex strings in your data:**
```jsx
const items = [
  { name: 'Item A', color: '#3b82f6' },  // blue-500
  { name: 'Item B', color: '#22c55e' },  // green-500
  { name: 'Item C', color: '#a855f7' },  // purple-500
];
```

### 2. Interactivity Standards

Every educational visualization should aim to include:

- **Keyboard controls**: Arrow keys for adjusting values, Tab for switching focus
- **Hover states**: Visual feedback on interactive elements
- **Tooltips/hints**: Keyboard shortcut hints for discoverability
- **Smooth transitions**: `transition-all` classes for state changes
- **Focus indicators**: Ring/border highlighting for active elements

Example pattern:
```jsx
const [activeParam, setActiveParam] = useState('primary');

// Keyboard handler
useEffect(() => {
  const handleKeyDown = (e) => {
    if (e.key === 'ArrowLeft' || e.key === 'ArrowRight') {
      e.preventDefault();
      const delta = e.key === 'ArrowRight' ? 0.1 : -0.1;
      updateValue(activeParam, delta);
    }
  };
  window.addEventListener('keydown', handleKeyDown);
  return () => window.removeEventListener('keydown', handleKeyDown);
}, [activeParam]);

// Visual indicator for active element
<div className={activeParam === 'primary' ? 'ring-1 ring-blue-500' : ''}>
```

### 3. Module Consistency Checklist

Compare new modules against established patterns in existing high-quality modules. Reference:

- `tier1/rl-loop-explorer.jsx` - Excellent animation and state transitions
- `tier1/mdp-playground.jsx` - Great interactive grid controls
- `tier1/discount-factor.jsx` - Clean parameter controls with keyboard support

Each module should have:
- [ ] Consistent header/title styling
- [ ] Parameter controls with visible current values
- [ ] Visual feedback for interactions
- [ ] Explanation panels with key insights
- [ ] Mobile-responsive layout (`grid-cols-1 lg:grid-cols-2`)

### 4. Code Quality Checks

Before completing any module:

1. **Run the build**: `npm run build` - check for warnings
2. **Test in browser**: Verify all interactions work as expected
3. **Check responsive layout**: Test at different viewport sizes
4. **Verify dynamic content**: Ensure colors and styles render correctly

### 5. Quality Self-Assessment Questions

At the end of creating multiple modules, ask yourself:

1. **Rushed vs. Intentional**: Did I take time to add polish, or just make things functional?
2. **Pattern Consistency**: Do new modules match the quality bar of the best existing modules?
3. **Interactive Depth**: Can users explore and experiment, or just observe?
4. **Educational Value**: Does each visualization teach concepts through interaction?

If the answer to any of these reveals a gap, go back and address it before moving on.

## Common Tailwind Color Values

For reference when using inline styles:

```
slate-400: #94a3b8    slate-500: #64748b    slate-600: #475569
blue-400:  #60a5fa    blue-500:  #3b82f6    blue-600:  #2563eb
green-400: #4ade80    green-500: #22c55e    green-600: #16a34a
purple-400:#c084fc    purple-500:#a855f7    purple-600:#9333ea
red-400:   #f87171    red-500:   #ef4444    red-600:   #dc2626
yellow-400:#facc15    yellow-500:#eab308    yellow-600:#ca8a04
```

## Project Commands

```bash
make dev         # Start all dev servers
make build       # Build all projects
make build-rl    # Build just reinforcement-learning
make help        # Show all commands
```

## File Structure

```
interactive-ai/
├── reinforcement-learning/
│   ├── tier1/    # Core RL concepts (highest quality reference)
│   ├── tier2/    # Value-based methods
│   ├── tier3/    # Policy-based methods
│   └── tier4/    # Advanced topics
├── neural-networks/
├── convolutional-networks/
└── CLAUDE.md     # This file
```

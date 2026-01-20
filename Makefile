# Interactive AI
# Educational visualizations for understanding AI concepts

.PHONY: help install dev-nn dev-cnn dev-rl build clean

help:
	@echo ""
	@echo "╔══════════════════════════════════════════════════════════════════╗"
	@echo "║                      Interactive AI                              ║"
	@echo "║         Educational Visualizations for AI Concepts               ║"
	@echo "╠══════════════════════════════════════════════════════════════════╣"
	@echo "║                                                                  ║"
	@echo "║  SETUP                                                           ║"
	@echo "║    make install       Install all dependencies                   ║"
	@echo "║                                                                  ║"
	@echo "║  DEVELOPMENT                                                     ║"
	@echo "║    make dev-nn        Neural Networks      (localhost:3000)      ║"
	@echo "║    make dev-cnn       Convolutional CNNs   (localhost:3002)      ║"
	@echo "║    make dev-rl        Reinforcement Learn  (localhost:3001)      ║"
	@echo "║                                                                  ║"
	@echo "║  BUILD                                                           ║"
	@echo "║    make build         Build all projects for production          ║"
	@echo "║                                                                  ║"
	@echo "║  UTILITIES                                                       ║"
	@echo "║    make clean         Remove build artifacts                     ║"
	@echo "║    make help          Show this help message                     ║"
	@echo "║                                                                  ║"
	@echo "╠══════════════════════════════════════════════════════════════════╣"
	@echo "║  PROJECTS                                                        ║"
	@echo "║                                                                  ║"
	@echo "║  neural-networks/         Backprop, activations, loss landscapes ║"
	@echo "║  convolutional-networks/  CNNs, kernels, pooling, architectures  ║"
	@echo "║  reinforcement-learning/  MDPs, Q-learning, policy gradients     ║"
	@echo "║                                                                  ║"
	@echo "╚══════════════════════════════════════════════════════════════════╝"
	@echo ""

install:
	@echo "📦 Installing all dependencies..."
	@cd neural-networks && npm install
	@cd convolutional-networks && npm install
	@cd reinforcement-learning && npm install
	@echo "✅ All dependencies installed!"

dev-nn:
	@echo "🧠 Starting Neural Networks (http://localhost:3000)..."
	@cd neural-networks && npm run dev

dev-cnn:
	@echo "👁️  Starting Convolutional Networks (http://localhost:3002)..."
	@cd convolutional-networks && npm run dev

dev-rl:
	@echo "🎮 Starting Reinforcement Learning (http://localhost:3001)..."
	@cd reinforcement-learning && npm run dev

build:
	@echo "🏗️  Building all projects..."
	@cd neural-networks && npm run build
	@cd convolutional-networks && npm run build
	@cd reinforcement-learning && npm run build
	@echo "✅ All builds complete!"

clean:
	@echo "🧹 Cleaning build artifacts..."
	@rm -rf neural-networks/dist neural-networks/node_modules/.vite
	@rm -rf convolutional-networks/dist convolutional-networks/node_modules/.vite
	@rm -rf reinforcement-learning/dist reinforcement-learning/node_modules/.vite
	@echo "✅ Clean complete!"

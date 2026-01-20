# Neural Networks Visualizations
# Part of the Interactive AI educational suite

.PHONY: help init dev build preview clean

help:
	@echo "╔════════════════════════════════════════════════════════════════╗"
	@echo "║            Neural Networks - Make Commands                     ║"
	@echo "╠════════════════════════════════════════════════════════════════╣"
	@echo "║                                                                ║"
	@echo "║  make init      Install dependencies                           ║"
	@echo "║  make dev       Start dev server (http://localhost:3000)       ║"
	@echo "║  make build     Build for production                           ║"
	@echo "║  make preview   Preview production build                       ║"
	@echo "║  make clean     Remove build artifacts                         ║"
	@echo "║                                                                ║"
	@echo "╚════════════════════════════════════════════════════════════════╝"

init:
	@echo "📦 Installing dependencies..."
	npm install
	@echo "✅ Setup complete! Run 'make dev' to start."

dev:
	@echo "🚀 Starting development server..."
	npm run dev

build:
	@echo "🏗️  Building for production..."
	npm run build
	@echo "✅ Build complete! Files in ./dist"

preview:
	@echo "👁️  Previewing production build..."
	npm run preview

clean:
	@echo "🧹 Cleaning build artifacts..."
	rm -rf dist node_modules/.vite
	@echo "✅ Clean complete!"

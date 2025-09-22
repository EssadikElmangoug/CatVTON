#!/bin/bash

# CatVTON Installation Script
# This script ensures a smooth installation without dependency issues

echo "🐈 Installing CatVTON - Stable Version"
echo "======================================"

# Check if conda is available
if command -v conda &> /dev/null; then
    echo "✅ Conda found. Creating environment..."
    conda create -n catvton python==3.9.0 -y
    echo "✅ Activating environment..."
    source $(conda info --base)/etc/profile.d/conda.sh
    conda activate catvton
else
    echo "⚠️  Conda not found. Using pip with virtual environment..."
    python -m venv catvton_env
    source catvton_env/bin/activate
fi

echo "📦 Installing requirements..."
pip install --upgrade pip
pip install -r requirements.txt

echo "✅ Installation complete!"
echo ""
echo "To run CatVTON:"
echo "1. Activate environment: conda activate catvton (or source catvton_env/bin/activate)"
echo "2. Run: CUDA_VISIBLE_DEVICES=0 python app.py --output_dir=\"resource/demo/output\" --mixed_precision=\"bf16\" --allow_tf32"
echo ""
echo "🎉 Enjoy using CatVTON!"

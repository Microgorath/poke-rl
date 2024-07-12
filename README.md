# Required Packages
## RLLib Prerequisites
Python 3.8  
PyTorch or Tensorflow, preferably CUDA-enabled to utilize the GPU.  
### Tensorflow GPU Support
Currently, Tensorflow 2.13 is the most recent version supported by RLLib, so install CUDA Toolkit 11.8 and cuDNN 8.6. For Windows GPU support, this requires WSL2.
### PyTorch GPU Support
pip3 install torch --index-url https://download.pytorch.org/whl/cu121

## Installation
pip install "ray[rllib]" poke-env ipython ipykernel ipywidgets tqdm tensorboard

## Future Support
RLLib is currently in the process of updating to 3.0, which changes to a new API stack. However, the new API stack does not support all algorithms. This notebook currently uses some of the new API stack and some of the old API stack in order to use the DQN algorithm.
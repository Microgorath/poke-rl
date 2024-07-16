## Installation

### Requirements Overview
This notebook uses RLLib, an open-source scalable reinforcement learning library in the Ray framework.  
RLLib currently only supports Python 3.8.  
RLLib supports both PyTorch and Tensorflow, so either may be used. Preferably, the library used will be CUDA-enabled to utilize the GPU, but it is optional. Nvidia GPU support only.  

### Tensorflow GPU Support
A dev container is provided that will set up a Linux Tensorflow 2.13.0-gpu-jupyter Docker container with everything set up for Tensorflow GPU support, which also starts its own local pokemon showdown server when started. The showdown server is port forwarded to be visible on the host, at http://localhost:8000.  
Requires Docker Desktop, with Nvidia Container Toolkit set up.  

If on Windows, also requires WSL2. Follow [this guide](https://gdevakumar.medium.com/setup-windows-10-11-machines-for-deep-learning-with-docker-and-gpu-using-wsl-9349f0224971) to set up Docker Desktop with WSL2 and Nvidia Container Toolkit. The CUDA toolkit version installed on the local WSL2 does not matter, as the Docker image installs its own CUDA Toolkit and cuDNN automatically.  
Currently, Tensorflow 2.13 is the most recent version supported by RLLib, which requires specifically CUDA Toolkit 11.8 and cuDNN 8.6. As of Tensorflow 2.11, using GPU on Windows is not supported, thus why WSL2 is required.  

The resulting container is 7.7 GB.  

### PyTorch GPU Support
PyTorch works just fine, without needing WSL2 or Docker. Training time is about the same as Tensorflow, but has very limited Tensorboard support. Set up PyTorch with GPU support however you would normally on a new Conda environment. Here I will be using CUDA 12.1, but any version that works with Python 3.8 should be fine.  
```
conda create -n poke-rl-torch python=3.8  
conda activate poke-rl-torch  
pip3 install torch --index-url https://download.pytorch.org/whl/cu121  
pip install -r requirements.txt  
```
Once installed, in basic_rl.ipynb be sure to change ```"tf2"``` to ```"torch"``` in the line: 
```python 
config = config.framework(framework="tf2")
```  

The resulting conda environment is 5.6 GB.  

## Future RLLib Support
RLLib is currently in the process of updating to 3.0, which changes to a new API stack. However, the new API stack does not support all algorithms. This notebook currently uses some of the new API stack and some of the old API stack in order to use the DQN algorithm.
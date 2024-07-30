# Pokemon Battle Reinforcement Learning With Poke-Env, RLlib, and Pokemon Showdown
This repo contains a Jupyter Notebook that trains, evaluates, and tests a basic DQN reinforcement learning model on Pokemon Showdown using [poke-env](https://github.com/hsahovic/poke-env) and the [Ray Reinforcement Learning Library](https://github.com/ray-project/ray/tree/master/rllib).  
Using RLlib allows for compatibility with the rest of the Ray suite, notably Tune's hyperparameter tuning and Ray's resource scaling. 

Currently, only the DQN algorithm is supported, but it is easy to replace the DQNConfig with any algorithm RLlib supports.  

A more generalized, modular version of the notebook is planned, with the goal of custom multiagent reinforcement learning.

## Installation

### Requirements Overview
This notebook uses RLlib, an open-source scalable reinforcement learning library in the Ray framework.  
RLlib currently supports Python 3.9 - 3.12.  
RLlib supports both PyTorch and Tensorflow, so either may be used. This setup will assume GPU will be used, but it is not necessary for most algorithms. Training with GPU was found to be slightly slower than only using CPU for DQN. GPU use is most likely only useful for large models that take longer for inference or backprop.  

To implement Pokemon battles, this notebook uses the Pokemon reinforcement learning environment [poke-env](https://github.com/hsahovic/poke-env). Without poke-env, this project would not exist!  

Pokemon Showdown must also be installed for poke-env to function. If using the devcontainer, this will be done for you. For all other installation options, follow the steps on installing Pokemon Showdown in poke-env's [getting started doc](https://poke-env.readthedocs.io/en/stable/getting_started.html).

### PyTorch GPU Installation
PyTorch works just fine, without needing WSL2 or Docker. Training time is about the same as Tensorflow, but has limited Tensorboard support. Set up PyTorch with GPU support however you would normally on a new Conda environment.
```
conda create -n poke-rl-torch python=3.11  
conda activate poke-rl-torch  
pip3 install --user torch --index-url https://download.pytorch.org/whl/cu121  
pip3 install --user -r requirements.txt  
```
Once installed, in basic_rl.ipynb be sure to change ```"tf2"``` to ```"torch"``` in the line: 
```python 
config = config.framework(framework="tf2")
```  

The resulting conda environment is 5.6 GB.  

### PyTorch CPU-only Installation
The steps are the same as the PyTorch GPU Installation, except install regular non-cuda PyTorch.
```
conda create -n poke-rl-torch python=3.11  
conda activate poke-rl-torch  
pip3 install --user torch  
pip3 install --user -r requirements.txt  
```
Once installed, in basic_rl.ipynb be sure to change ```"tf2"``` to ```"torch"``` in the line: 
```python 
config = config.framework(framework="tf2")
```  

### Tensorflow GPU Installation / Development Container
A dev container is provided that will set up a Linux Tensorflow 2.15.0-gpu-jupyter Docker container with everything set up for Tensorflow GPU support, which also starts its own local pokemon showdown server when started. The showdown server is port forwarded to be visible on the host, at http://localhost:8000.  
Requires Docker Desktop, with Nvidia Container Toolkit set up.  

If on Windows, also requires WSL2. Follow [this guide](https://gdevakumar.medium.com/setup-windows-10-11-machines-for-deep-learning-with-docker-and-gpu-using-wsl-9349f0224971) to set up Docker Desktop with WSL2 and Nvidia Container Toolkit. The CUDA toolkit version installed on the local WSL2 does not matter, as the Docker image installs its own CUDA Toolkit and cuDNN automatically.  
As of Tensorflow 2.11, using GPU on Windows is not supported, thus why WSL2 is required.  

The resulting container is 7.3 GB.  

### Optional Local Showdown Server Setup
Open the Pokemon Showdown config that you copied into the pokemon-showdown config directory during setup. For the devcontainer, it is pokemon-showdown/config/config.js.  

Decrease exports.inactiveuserthreshold to 1000. This reduces the time before inactive users' usernames are freed to use again to 1 second. Since no two users are allowed to have the same username, this is necessary to prevent exceptions when rerunning notebook cells multiple times.  

Increase exports.simulatorprocesses to allow faster concurrent processing of battles. I set this to 4, but some experimentation may be necessary for your system and your algorithm config's number of concurrent player environments, which is num_env_runners * num_envs_per_env_runner * max_concurrent_trials.

## Future RLlib Support
RLlib is currently in the process of updating to 3.0, which changes to a new API stack. However, the new API stack does not support all algorithms. This notebook currently uses some of the new API stack and some of the old API stack in order to use the DQN algorithm.
#!/bin/bash -l
#SBATCH -t 48:00:00                  # walltime
#SBATCH -N 1                         # one node
#SBATCH --ntasks-per-node=4                    # Number of tasks (one per GPU)
#SBATCH --cpus-per-task=6      # CPUs per task/GPU
#SBATCH -J emg2pose_omen   # job name
#SBATCH --mem=200GB                   # memory per node in GB
#SBATCH -o emg2pose_omen_%j.log
#SBATCH -e emg2pose_omen_%j.err
#SBATCH --gres=gpu:4 --constraint=12GB


# ---------------------------------- module ---------------------------------- #
module load openmind/miniconda/4.9.2-py3.9


# cd to project
cd /om2/user/claudif/DecodingAlgorithms/emg2pose-OMEN

# execute in singularity container
export CUDA_VISIBLE_DEVICES=0,1,2,3,

source /om2/user/claudif/myenv/bin/activate

conda deactivate

srun python run.py

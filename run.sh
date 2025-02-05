#!/bin/bash -l
#SBATCH -t 48:00:00                  # walltime
#SBATCH -N 1                         # one node
#SBATCH --ntasks-per-node=1                    # Number of tasks (one per GPU)
#SBATCH --cpus-per-task=12      # CPUs per task/GPU
#SBATCH -J emg2pose_omen   # job name
#SBATCH --mem=24GB                   # memory per node in GB
#SBATCH -o emg2pose_omen.log
#SBATCH -e emg2pose_omen_err.log
#SBATCH --gres=gpu:1 --constraint=12GB


# ---------------------------------- module ---------------------------------- #
echo "Loading modules"
source /etc/profile.d/modules.sh
module use /cm/shared/modulefiles

# ----------------------------------- task ----------------------------------- #

echo "Running python script"

# cd to project
cd /om2/user/claudif/DecodingAlgorithms/emg2pose-OMEN

# execute in singularity container
export CUDA_VISIBLE_DEVICES=0
conda activate test2

python run.py

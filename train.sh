#!/bin/bash -l
#SBATCH -t 18:00:00                  
#SBATCH -N 1                         
#SBATCH --ntasks-per-node=4                    
#SBATCH --cpus-per-task=8      
#SBATCH -J emg2pose_omen_small   
#SBATCH --mem=150GB                   
#SBATCH -o emg2pose_omen_small_%j.log
#SBATCH -e emg2pose_omen_small_%j.err
#SBATCH --gres=gpu:4 --constraint=12GB  

cd /om2/user/claudif/DecodingAlgorithms/emg2pose-OMEN

source /om2/user/claudif/myenv/bin/activate

conda deactivate

srun python run.py

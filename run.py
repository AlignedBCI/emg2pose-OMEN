import os


# set HYDRA_FULL_ERROR=1
os.environ["HYDRA_FULL_ERROR"] = "1"

cmd = """
python -m emg2pose.train train=True eval=True experiment=tracking_omen trainer.max_epochs=5 data_split=mini_split data_location="F:/emg2pose/emg2pose_dataset_mini"
"""

os.system(cmd)

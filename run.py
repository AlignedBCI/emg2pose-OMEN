import os
from pathlib import Path

if __name__ == "__main__":
    DATA_DIR = "F:/emg2pose/emg2pose_dataset_mini"
    if not Path(DATA_DIR).exists():
        DATA_DIR = "/om2/user/claudif/DecodingAlgorithms/datasets/emg2pose/emg2pose_dataset_mini"
    assert Path(DATA_DIR).exists(), f"Data directory {DATA_DIR} does not exist"

    # set HYDRA_FULL_ERROR=1
    os.environ["HYDRA_FULL_ERROR"] = "1"

    cmd = f"""
    python -m emg2pose.train train=True eval=True experiment=tracking_omen data_split=mini_split data_location="{DATA_DIR}"
    """

    os.system(cmd)

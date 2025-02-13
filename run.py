import os
from pathlib import Path

if __name__ == "__main__":
    FULL_SPLIT = False

    DATA_DIR = "F:/emg2pose"
    if not Path(DATA_DIR).exists():
        DATA_DIR = "/om2/user/claudif/DecodingAlgorithms/datasets/emg2pose"
    assert Path(DATA_DIR).exists(), f"Data directory {DATA_DIR} does not exist"

    if FULL_SPLIT:
        DATA_DIR = os.path.join(DATA_DIR, "emg2pose_data")
    else:
        DATA_DIR = os.path.join(DATA_DIR, "emg2pose_dataset_mini")

    # set HYDRA_FULL_ERROR=1
    os.environ["HYDRA_FULL_ERROR"] = "1"

    split_name = "full_split" if FULL_SPLIT else "mini_split"
    cmd = f"""
    python -m emg2pose.train train=True eval=True experiment=tracking_omen data_split={split_name} data_location="{DATA_DIR}"
    """

    os.system(cmd)

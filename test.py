import os
from pathlib import Path

if __name__ == "__main__":
    
    EXPERIMENT = "tracking_vemg2pose"
    CHECKPOINT = "./logs/2025-02-16/08-53-08/models/last.ckpt"

    DATA_DIR = "/om2/user/claudif/DecodingAlgorithms/datasets/emg2pose/emg2pose_data"
    assert Path(DATA_DIR).exists(), f"Data directory {DATA_DIR} does not exist"

    cmd = f"""
    python -m emg2pose.test_analysis experiment={EXPERIMENT} checkpoint={CHECKPOINT} data_location="{DATA_DIR}"
    """

    os.system(cmd)

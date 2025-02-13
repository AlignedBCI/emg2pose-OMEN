from torch import nn


class ScalingDecoder(nn.Module):
    def __init__(self, scale:float = 0.1):
        super().__init__()
        self.scale = scale

    def forward(self, x):
        return x * self.scale



import argparse

import numpy as np
import scipy.io
import torch
import torch.nn as nn


class Arcnet(nn.Module):
    def __init__(self, ins):
        super(Arcnet, self).__init__()
        self.reg = nn.Sequential(
            nn.Linear(ins, 1)
        )

    def forward(self, x):
        x = self.reg(x)
        return x


def normalization(data):
    data = np.float32(np.abs(data))
    raw_min = data.min()
    raw_max = data.max()
    data = (data - raw_min) / (raw_max - raw_min + 0.00000001)
    return data


if __name__ == "__main__":
    parser = argparse.ArgumentParser()
    parser.add_argument("--map-score", type=str, required=True, help="Path to score.mat")
    parser.add_argument("--model", type=str, default='params.pkl', help="Path to model params .pkl")
    parser.add_argument("--device", type=str, choices=["cpu", "cuda"], default="cuda", help="Select cpu or cuda")
    args = parser.parse_args()

    map_score = scipy.io.loadmat(args.map_score)["score"]
    map_score = normalization(map_score)

    net = Arcnet(17)
    net.load_state_dict(torch.load(args.model, map_location=torch.device(args.device)))
    net.to(args.device)
    ins = torch.FloatTensor(map_score).to(args.device)
    output = net(ins).detach().cpu().numpy()
    print(output)

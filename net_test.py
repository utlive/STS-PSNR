import torch
import torch.nn as nn
from torch.autograd import Variable
import numpy as np
import scipy.io as sio


class Arcnet(nn.Module):
    def __init__(self, ins):
        super(Arcnet, self).__init__()
        self.reg = nn.Sequential(
            nn.Linear(ins, 1)
        )

    def forward(self, x):
        x = self.reg(x)
        return x

def normalizetion(data):
    data = np.float32(np.abs(data))
    raw_min = data.min(0)
    raw_max = data.max(0)
    data = (data - raw_min) / (raw_max - raw_min + 0.00000001)
    return data

def load_data(mat_name, array_name):
    data = sio.loadmat(mat_name)
    data = data[array_name]
    return normalizetion(data)


map_socre = load_data('score.mat', 'score')
map_socre = normalizetion(map_score)

net = Arcnet(17)
net.load_state_dict(torch.load('params.pkl'))
net.cuda()
ins = Variable(torch.from_numpy(feature).type(new_type=torch.FloatTensor).cuda())
output = net(ins).cpu().data.numpy()
print(output)
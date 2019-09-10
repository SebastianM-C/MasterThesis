import numpy as np
import sdf_helper as sh
import matplotlib.pyplot as plt

import contextlib

plt.rcParams['figure.figsize'] = [13, 13]

def plot_particles(t):
    with contextlib.redirect_stdout(None):
        data = sh.getdata(t, '1dexample')
    sh.plot1d(data.Particles_Px_Left, 'o', markersize=2)
    sh.oplot1d(data.Particles_Px_Right, 'o', markersize=2)

def plot_field(t):
    with contextlib.redirect_stdout(None):
        data = sh.getdata(t, 'test')
    sh.plot_auto(data.Electric_Field_Ey)

for i in range(0,101):
    plot_particles(i)
    plt.show()

for i in range(0,5):
    plot_field(i)
    plt.show()

%pwd
data = sh.getdata("epoch/budriga2017/2dcone_i21/0001.sdf")
sh.plot_auto(data.Electric_Field_Ey)
sh.plot_auto(data.Particles_Ek_electron)
plt.show()

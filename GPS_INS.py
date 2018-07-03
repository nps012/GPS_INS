import pandas as pd
from pandas import DataFrame

if __name__=='__main__':
    print('Input the csv file path:')
    csv_path = input()
    print('Give the output path:')
    out_path = input()
    df = pd.read_csv (csv_path)
    df.to_csv('newcsv.csv')
    df = pd.read_csv('newcsv.csv')

    import math
    x=list()
    y=list()
    for i in range(len(df)):
        if df['Gyroscope_x'][i] !=0.0 :
            x.append(df['timestamp'][i])
            y.append((df['Gyroscope_x'][i],df['Gyroscope_y'][i],df['Gyroscope_z'][i]))

    from scipy.interpolate import PchipInterpolator
    cfit = PchipInterpolator(x,y,axis=0)

    for i in range(len(df)):
        if df['Gyroscope_x'][i]==0.0:
            gyroscope_reading = cfit(df['timestamp'][i])
            df['Gyroscope_x'][i] = gyroscope_reading[0]
            df['Gyroscope_y'][i] = gyroscope_reading[1]
            df['Gyroscope_z'][i] = gyroscope_reading[2]

    for i in range(1,len(df)):
        if (df['AcceleroMeter_y'][i])==0.0:
            df['AcceleroMeter_x'][i] = 0.5* (df['AcceleroMeter_x'][i-1] + df['AcceleroMeter_x'][i+1])
            df['AcceleroMeter_y'][i] = 0.5* (df['AcceleroMeter_y'][i-1] + df['AcceleroMeter_y'][i+1])
            df['AcceleroMeter_z'][i] = 0.5* (df['AcceleroMeter_z'][i-1] + df['AcceleroMeter_z'][i+1])

    import numpy as np
    import pandas as pd

    import matplotlib.pyplot as plt
    from matplotlib import rcParams
    rcParams['legend.fontsize'] = 14
    rcParams['axes.labelsize'] = 14
    rcParams['axes.titlesize'] = 14

    gps_data = pd.DataFrame(index=df.index)
    gps_data['lat'] = df.latitude
    gps_data['lon'] = df.longitude
    gyro = df[['Gyroscope_x','Gyroscope_y','Gyroscope_z']]
    accel = df[['AcceleroMeter_x','AcceleroMeter_y','AcceleroMeter_z']]

    dt = .1

    lat = df.latitude
    lon = df.longitude

    from pyins.integrate import coning_sculling, integrate
    from pyins.filt import traj_diff

    theta, dv = coning_sculling(gyro, accel)

    gyro_bias_sd = np.deg2rad(0.05) / 3600  # 0.05 d/h
    accel_bias_sd = 5e-3

    gyro_noise = 1e-6  # rad / s^0.5
    accel_noise = 3e-4  # m / s^1.5

    np.random.seed(1)

    gyro_bias = gyro_bias_sd * np.random.uniform(-2, 2, 3)
    accel_bias = accel_bias_sd * np.random.uniform(-2, 2, 3)

    from pyins import earth

    gyro_e = gyro + gyro_bias * dt + gyro_noise * np.random.randn(*gyro.shape) * dt**0.5
    accel_e = accel + accel_bias * dt + accel_noise * np.random.randn(*accel.shape) * dt**0.5

    theta, dv = coning_sculling(gyro_e, accel_e)

    t_align = 15*60
    align_samples = int(t_align / dt)

    theta_align = theta[:align_samples]
    theta_nav = theta[align_samples:]
    dv_align = dv[:align_samples]
    dv_nav = dv[align_samples:]

    from pyins.align import align_wahba
    (h0, p0, r0), P_align = align_wahba(dt, theta_align, dv_align, 12.915618)

    VE0 = 0
    VN0 = 0
    lat0 = 12.915618
    lon0 = 77.615240

    traj_real = integrate(dt, lat0, lon0, VE0, VN0, h0, p0, r0, theta_nav, dv_nav)
    traj_error = traj_diff(traj_real, gps_data)

    gps_data = pd.DataFrame(index=gps_data.index[::1])
    gps_data['lat'] = df.latitude
    gps_data['lon'] = df.longitude

    gps_pos_sd = 10

    from pyins.filt import LatLonObs
    gps_obs = LatLonObs(gps_data, gps_pos_sd)

    from pyins.filt import InertialSensor

    gyro_model = InertialSensor(bias=gyro_bias_sd, noise=gyro_noise)
    accel_model = InertialSensor(bias=accel_bias_sd, noise=accel_noise)

    from pyins.filt import FeedforwardFilter
    ff_filt = FeedforwardFilter(dt, traj_real,
                                pos_sd=10, vel_sd=0.1, azimuth_sd=0.5, level_sd=0.05,
                                gyro_model=gyro_model, accel_model=accel_model)

    ff_res = ff_filt.run(observations=[gps_obs])
    filt_error = traj_diff(ff_res.traj, gps_data)

    ff_res.traj.to_csv(out_path + '/ff_res.csv')

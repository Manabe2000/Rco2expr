import requests
import matplotlib.pyplot as plt
import numpy as np
import pandas as pd
import time
import sys

#  注意：これは，absent_attend.txtがないことを確認して実行する．引数はいらない．
#  CSV形式からある形式のtxt形式へ変換するためのスクリプトで
#  txtファイルの1行の中身は例'2022-07-11T09:56 2022-07-11T13:55'となっている．

df = pd.read_csv('feeds_attend.csv', index_col=1)
tmp = ["a","b"]
absent_attend_time = []

if (int(df.at[1,'field1']) == 1) & (tmp[0] == "a"):
    tmp[0] = df.at[1,'created_at'][0:16]
print(tmp[0])

for i in range(1,len(df)):
    if (int(df.at[i,'field1']) == 0) & (tmp[0] == "a"):
        tmp[0] = df.at[i,'created_at'][0:16]
    if (int(df.at[i,'field1']) == 1) & (tmp[0] != "a"):
        tmp[1] = df.at[i,'created_at'][0:16]
    if (tmp[1] != "b") & (tmp[0] != "a"):
        absent_attend_time.append(tmp)
        tmp = ["a","b"]


f = open('absent_attend.txt','x')

for i in range(1,len(absent_attend_time)):
    str = ""
    str = absent_attend_time[i][0] + " " + absent_attend_time[i][1] + "\n"
    f.write(str)

f.close()
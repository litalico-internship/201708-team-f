# -*- coding: utf-8 -*-
from jinja2 import Environment, FileSystemLoader
import numpy as np
import codecs
import numpy as np
import time
import csv
from dateutil.relativedelta import relativedelta
import sys

def StrToTimeSec(str):
    str_to_time = time.strptime(str, '%H:%M')
    sec = str_to_time.tm_hour*3600 + str_to_time.tm_min*60
    return sec

def main():
    left_time_sec = 24*60*60
    bath_sec = 30*60
    breakfast_sec = 30*60
    dinner_sec = 60*60
    hkeeping_sec = 60*60
    sleeping_sec = 6*60*60
    to_do_flag = False
    ans_flag = False
    output_list = []

    f = open(sys.argv[1], 'r')
    input_list = []
    for line in f:
        line = line.rstrip()
        l = line.split(',')
    f.close()
    # l = ['01:00', '07:00', '17:00', '00:20', 'テスト']

    most_valiable_sec = StrToTimeSec(l[0])
    s_time = l[1]
    f_time = l[2]
    work_time_sec = StrToTimeSec(f_time) - StrToTimeSec(s_time)

    c_time = l[3]
    commu_time_sec = StrToTimeSec(c_time)

    left_time_sec = left_time_sec - commu_time_sec*2 - most_valiable_sec - work_time_sec - bath_sec - breakfast_sec - dinner_sec - hkeeping_sec - sleeping_sec
    left_time = relativedelta(seconds=left_time_sec)

    # ['Sleeping', 'Breakfast', 'Task_name', 'Task_time', 'Commuting', 'Working', 'Commuting', 'Dinner', 'Children', 'Housekeeping', 'Task', 'Bath']
    if(sleeping_sec+breakfast_sec > StrToTimeSec(s_time)-commu_time_sec):
        delta = sleeping_sec+breakfast_sec - (StrToTimeSec(s_time)-commu_time_sec)
        sleeping_sec = sleeping_sec - delta
        output_list.append(sleeping_sec)
        output_list.append(breakfast_sec)
        output_list.append(l[4])
        output_list.append(0)
    else:
        delta = (StrToTimeSec(s_time)-commu_time_sec) - (sleeping_sec+breakfast_sec)
        output_list.append(sleeping_sec)
        output_list.append(breakfast_sec)
        output_list.append(l[4])
        output_list.append(delta)
    output_list.append(commu_time_sec)
    output_list.append(work_time_sec)
    output_list.append(commu_time_sec)
    output_list.append(dinner_sec)
    output_list.append(most_valiable_sec)
    output_list.append(hkeeping_sec)
    output_list.append(24*60*60 - sleeping_sec - breakfast_sec - output_list[3] - commu_time_sec*2 - work_time_sec - dinner_sec - most_valiable_sec - hkeeping_sec - bath_sec)
    output_list.append(bath_sec)

    print(output_list)
    all_time = output_list[0] + output_list[1] + output_list[3] + output_list[4] + output_list[5] + output_list[6] + output_list[7] + output_list[8] + output_list[9] + output_list[10] + output_list[11]
    print(all_time-24*60*60)


    # 描画へ
    env = Environment(loader = FileSystemLoader('/', encoding = 'utf-8'))
    # d3.jsファイルへのパス指定
    temp1 = env.get_template('../index.html')

    # d3.jsファイルへ値を渡す
    html = temp1.render(output_list=str(output_list))
    print(html)


if __name__ == '__main__':
    main()

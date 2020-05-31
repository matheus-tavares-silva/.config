#!/bin/env python3

import json
import subprocess
import time
'''
This script enable or disable screen savior if exists any window in fullscreen.
'''
monitor_status = 'xset -q'
set_monitor_on = 'xset s off'
set_monitor_off = 'xset dpms 0 0 '
i3_cmd = 'i3-msg -t get_tree'
lock_screen = 'sh /home/s0berano/.config/i3/scripts/locker.sh'

def get_layout():
    get_tree = subprocess.Popen(i3_cmd.split(), stdout=subprocess.PIPE)
    stdout = get_tree.communicate()[0]
    try:
        tree = json.loads(stdout)
    except ValueError:
        tree = {}
    return tree

def any_fullscreen_window(node):
    if node['window']:
        return node['fullscreen_mode'] == 1
    return any(any_fullscreen_window(n) for n in node.get('nodes', ''))

def command_call(arg):
    exit_code = 'Noting Returned'

    exit_code = subprocess.call(arg.split(), shell=False)

    print('Screen Saver: {}\nStatus: {}'.format(arg, exit_code))

if __name__ == '__main__':
    sleep_time = 300 #five mintues

    while True:
        get_monitor_status = subprocess.Popen(monitor_status.split(), stdout=subprocess.PIPE).communicate()[0][-4:].decode('utf-8').replace('\n', '')

        if (any_fullscreen_window(get_layout())):
            command_call(set_monitor_off + '0')
        else:
            command_call(set_monitor_off + str(sleep_time))
            print('Monitor: ' + get_monitor_status)
            if(get_monitor_status == 'Off') :
                time.sleep(5)
                command_call(lock_screen)

        time.sleep(sleep_time)
        
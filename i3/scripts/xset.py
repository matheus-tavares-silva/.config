#!/bin/env python3

import json
import subprocess
import time
'''
This script enable or disable screen savior if exists any window in fullscreen.
'''
monitor_status  = 'xset -q'
set_monitor_on  = 'xset s off'
set_monitor_off = 'xset dpms 0 0 '
i3_cmd          = 'i3-msg -t get_tree'
suspend         = 'systemctl suspend'
locker_status   = 'pgrep -f i3lock'
lock_screen     = 'sh /home/s0berano/.config/i3/scripts/locker.sh'

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

    print('Command: {}\nStatus: {}'.format(arg, exit_code))

def get_locker_status():
    return subprocess.Popen(locker_status.split(), stdout=subprocess.PIPE).communicate()[0].decode('utf-8').replace('\n', '').replace(' ', '')

def get_monitor_status():
    return subprocess.Popen(monitor_status.split(), stdout=subprocess.PIPE).communicate()[0][-4:].decode('utf-8').replace('\n', '').replace(' ', '')


if __name__ == '__main__':
    sleep_time   = 300 #five mintues
    lock_time    = 15
    suspend_time = 100

    while True:
        if (any_fullscreen_window(get_layout())) :
            command_call(set_monitor_off + '0')
        
        if(get_monitor_status() == 'On' and not any_fullscreen_window(get_layout())) :
            command_call(set_monitor_off + str(sleep_time))

        print('Monitor: ' + get_monitor_status())

        time.sleep(lock_time)

        if(get_monitor_status() == 'Off' and get_locker_status() == '') :
            print('Locking...')
            command_call(lock_screen)

        time.sleep(suspend_time)

        if(get_monitor_status() == 'Off' and get_locker_status() != '') :
            print('Suspending...')
            command_call(suspend)
        
        time.sleep(sleep_time)
                
       
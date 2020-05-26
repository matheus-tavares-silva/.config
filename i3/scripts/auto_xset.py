#!/bin/env python3

import json
import subprocess
import time
'''
This script enable or disable screen savior if exists any window in fullscreen.
'''

i3_cmd = 'i3-msg -t get_tree'


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

def xset_screensaver(arg):
    exit_code = subprocess.call(['xset', 'dpms', 's', arg], shell=False)
    print('Screen Saver: {}\nStatus: {}'.format(arg, exit_code))

if __name__ == '__main__':
    sleep_time = 300 #five mintues

    while True:
        if any_fullscreen_window(get_layout()):
            xset_screensaver('off')
        else:
            xset_screensaver(str(sleep_time))
        print('Waiting...')
        time.sleep(sleep_time)
        
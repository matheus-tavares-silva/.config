#!/bin/env python3

import subprocess
from pathlib import Path
import sys
import os

list_packages = 'apt list --upgradable | wc -l'

def get_list() :
    try :
        output = subprocess.Popen(list_packages, shell=True, stdout=subprocess.PIPE, stderr=subprocess.STDOUT)
        stdout = output.communicate()[0].decode('utf-8').replace('\n','').replace(' ', '').split('.')
    except :
        return 'Error'
    else :
        return int(stdout[2])

if __name__ == "__main__":
    
    packages = get_list()
    if(type(packages) is int):
        if(packages > 1) :
            print('{}  {}'.format('' ,str(packages - 1)))
        elif(packages == 1) :
            print('{}  {}'.format('' ,str(packages - 1)))
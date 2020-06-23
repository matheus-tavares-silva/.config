import subprocess
from pathlib import Path
import sys
import os

HOME = str(Path.home())
GET_PROCESS = 'pgrep redshift'
ENABLE_PROCESS = 'redshift -c {}/.config/redshift.conf &'.format(HOME)
DISABLE_PROCESS = 'killall redshift'

def process_exists() :
    try :    
        process = subprocess.Popen(GET_PROCESS.split(), stdout=subprocess.PIPE).communicate()[0]
    except :
        pass
    else:
        if(process) :
            return True

    return False

def enable_redshift() : 
    try :
        print('Enabling...')
        os.system(ENABLE_PROCESS)
    except :
        pass


def disable_redshift() :
    try :
        print('Disabling...')
        process = subprocess.Popen(DISABLE_PROCESS.split())
        process.communicate()
    except :
        pass

if __name__ == "__main__":

    state = process_exists()
    if(state):
        print(' On')
    else:
        print(' Off')

    if(len(sys.argv) > 1):
        if(sys.argv[1] == 'set' and not state) :
            enable_redshift()
        elif(sys.argv[1] == 'set' and state):
            disable_redshift()

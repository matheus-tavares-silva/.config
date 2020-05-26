#!/bin/sh

uptime --pretty | sed 's/up //' | sed 's/\years\?,/:/' | sed 's/\weeks\?,/:/' | sed 's/\days\?,/:/' | sed 's/\hours\?,\?/:/' | sed 's/\minutes\?//'
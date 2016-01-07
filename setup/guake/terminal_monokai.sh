#!/bin/bash 

# Save this script into set_colors.sh, make this file executable and run it: 
# 
# $ chmod +x set_colors.sh 
# $ ./set_colors.sh 
# 
# Alternatively copy lines below directly into your shell. 

gconftool-2 -s -t string /apps/guake/style/background/color '#272728282222'
gconftool-2 -s -t string /apps/guake/style/font/color '#f1f1ebebebeb'
gconftool-2 -s -t string /apps/guake/style/font/palette '#484848483e3e:#dcdc25256666:#8f8fc0c02929:#d4d4c9c96e6e:#5555bcbccece:#93935858fefe:#5656b7b7a5a5:#acacadada1a1:#767671715e5e:#fafa27277272:#a7a7e2e22e2e:#e7e7dbdb7575:#6666d9d9eeee:#aeae8282ffff:#6666efefd5d5:#cfcfd0d0c2c2'

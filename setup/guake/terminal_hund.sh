#!/bin/bash 

# Save this script into set_colors.sh, make this file executable and run it: 
# 
# $ chmod +x set_colors.sh 
# $ ./set_colors.sh 
# 
# Alternatively copy lines below directly into your shell. 

gconftool-2 -s -t string /apps/guake/style/background/color '#161616161616'
gconftool-2 -s -t string /apps/guake/style/font/color '#ffffffffffff'
gconftool-2 -s -t string /apps/guake/style/font/palette '#222222222222:#e8e84f4f4f4f:#b7b7cece4242:#fefea6a63c3c:#6666aaaabbbb:#b7b741416e6e:#6d6d87878d8d:#dddddddddddd:#666666666666:#d2d23d3d3d3d:#bdbde0e07777:#ffffe8e86363:#aaaaccccbbbb:#e1e16a6a9898:#424271717b7b:#cccccccccccc'

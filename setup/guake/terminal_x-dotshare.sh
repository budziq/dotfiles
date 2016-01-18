#!/bin/bash 

# Save this script into set_colors.sh, make this file executable and run it: 
# 
# $ chmod +x set_colors.sh 
# $ ./set_colors.sh 
# 
# Alternatively copy lines below directly into your shell. 

gconftool-2 -s -t string /apps/guake/style/background/color '#151515151515'
gconftool-2 -s -t string /apps/guake/style/font/color '#d7d7d0d0c7c7'
gconftool-2 -s -t string /apps/guake/style/font/palette '#101010101010:#e8e84f4f4f4f:#b8b8d6d68c8c:#e1e1aaaa5d5d:#7d7dc1c1cfcf:#9b9b6464fbfb:#6d6d87878d8d:#dddddddddddd:#404040404040:#d2d23d3d3d3d:#a0a0cfcf5d5d:#f3f39d9d2121:#4e4e9f9fb1b1:#85854242ffff:#424271717b7b:#dddddddddddd'

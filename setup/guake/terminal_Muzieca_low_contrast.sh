#!/bin/bash 

# Save this script into set_colors.sh, make this file executable and run it: 
# 
# $ chmod +x set_colors.sh 
# $ ./set_colors.sh 
# 
# Alternatively copy lines below directly into your shell. 

gconftool-2 -s -t string /apps/guake/style/background/color '#3c3c3b3b3737'
gconftool-2 -s -t string /apps/guake/style/font/color '#9393a1a1a1a1'
gconftool-2 -s -t string /apps/guake/style/font/palette '#5f5f5f5f5f5f:#d9d964646868:#a2a2d9d96464:#d9d9c9c96464:#6464a2a2d9d9:#9a9a6464d9d9:#6464d9d9d5d5:#989898989898:#828282828282:#d9d98f8f9393:#b8b8d9d98f8f:#d9d9cfcf8f8f:#8f8f9999d9d9:#b0b08f8fd9d9:#8f8fd9d9d5d5:#c5c5c5c5c5c5'

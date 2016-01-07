#!/bin/bash 

# Save this script into set_colors.sh, make this file executable and run it: 
# 
# $ chmod +x set_colors.sh 
# $ ./set_colors.sh 
# 
# Alternatively copy lines below directly into your shell. 

gconftool-2 -s -t string /apps/guake/style/background/color '#000000000000'
gconftool-2 -s -t string /apps/guake/style/font/color '#ffffffffffff'
gconftool-2 -s -t string /apps/guake/style/font/palette '#303030303030:#c0c030300000:#b1b1d6d63131:#fefecfcf3535:#424268687070:#6d6d50506d6d:#4b4bb5b5c1c1:#e2e2e2e2e5e5:#5f5f5f5f5f5f:#ffff3a3a7878:#a6a6cdcd0707:#b5b5c8c86565:#4a4a77778181:#ffff3b3b7777:#4b4bb5b5c1c1:#e2e2e2e2e5e5'

#!/bin/bash 

# Save this script into set_colors.sh, make this file executable and run it: 
# 
# $ chmod +x set_colors.sh 
# $ ./set_colors.sh 
# 
# Alternatively copy lines below directly into your shell. 

gconftool-2 -s -t string /apps/guake/style/background/color '#2f2f1e1e2e2e'
gconftool-2 -s -t string /apps/guake/style/font/color '#a3a39e9e9b9b'
gconftool-2 -s -t string /apps/guake/style/font/palette '#2f2f1e1e2e2e:#efef61615555:#4848b6b68585:#fefec4c41818:#0606b6b6efef:#81815b5ba4a4:#5b5bc4c4bfbf:#a3a39e9e9b9b:#77776e6e7171:#f9f99b9b1515:#414132323f3f:#4f4f42424c4c:#8d8d86868787:#b9b9b6b6b0b0:#e9e96b6ba8a8:#e7e7e9e9dbdb'

#!/bin/bash 

# Save this script into set_colors.sh, make this file executable and run it: 
# 
# $ chmod +x set_colors.sh 
# $ ./set_colors.sh 
# 
# Alternatively copy lines below directly into your shell. 

gconftool-2 -s -t string /apps/guake/style/background/color '#000000000000'
gconftool-2 -s -t string /apps/guake/style/font/color '#ffffffffffff'
gconftool-2 -s -t string /apps/guake/style/font/palette '#252525252525:#ffff9f9f9595:#a6a6e2e22e2e:#fdfd97971f1f:#43435e5e8787:#78789e9ec6c6:#5e5e71717575:#dbdbdcdcdcdc:#454545454545:#ffff8d8d8080:#b6b6e3e35454:#fdfd97971f1f:#58587a7aa4a4:#4646a4a4ffff:#a3a3bababfbf:#fdfdfdfdfdfd'

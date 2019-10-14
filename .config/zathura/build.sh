#!/bin/bash

C1="$(xrdb -query | egrep 'zathura\.background:|\*\.background' | awk '{print $2}')"
C2="$(xrdb -query | egrep 'zathura\.foreground:|\*\.foreground' | awk '{print $2}')"

cp ~/.config/zathura/zathurarc.template ~/.config/zathura/zathurarc

sed -i "s/\${COLOR1}/$C1/g" ~/.config/zathura/zathurarc
sed -i "s/\${COLOR2}/$C2/g" ~/.config/zathura/zathurarc

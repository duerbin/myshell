#!/bin/bash
#author http://blog.csdn.net/hursing
echo "g2 hello"
# this variable should be complex enough to avoid naming pollution
shortcut_and_paths=(
  'pde /home/dueb/svncode/pa43/cti/sd_de'
  'papg /home/dueb/svncode/pa43/cti/sd_apg'
  'u /home/dueb/svncode/pa43/cti/sd_ucg/'
  'lib /home/dueb/gitcode/ccod/ucg_commonlib/'
)

for ((i = 0; i < ${#shortcut_and_paths[@]}; i++)); do
  cmd=${shortcut_and_paths[$i]}
  shortcut=${cmd%% *}
  path1=${cmd#* }
  func="g2$shortcut() { cd $path; }"
  eval $func
done

g2help() {
  for ((i = 0; i < ${#shortcut_and_paths[@]}; i++)); do
    cmd=${shortcut_and_paths[$i]}
    shortcut=${cmd%% *}
    path1=${cmd#* }
    echo -e "g2$shortcut\t=>\tcd $path"
  done
  echo -e "\033[0;33;1mexample: input 'g2${shortcut_and_paths[0]%% *}' to run 'cd ${shortcut_and_paths[0]#* }'\033[0m"
}
g2help

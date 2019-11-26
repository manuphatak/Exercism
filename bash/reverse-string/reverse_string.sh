#!/usr/bin/env bash

# size=$((${#1} - 1))
# echo $size

# for i in  {$size..0}
# do
#   rev=$rev${1:$i:1}
# done

rev <<< "$1"
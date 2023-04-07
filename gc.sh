#!/bin/bash

if [[ "$@" == "1" ]]; then
  ls /sys/fs/f2fs/*/gc_urgent_sleep_time | while read file; do
    echo 1 | sudo tee $file > /dev/null
  done
  ls /sys/fs/f2fs/*/gc_urgent | while read file; do
    echo 1 | sudo tee $file > /dev/null
  done
else
  ls /sys/fs/f2fs/*/gc_urgent_sleep_time | while read file; do
    echo 500 | sudo tee $file > /dev/null
  done
  ls /sys/fs/f2fs/*/gc_urgent | while read file; do
    echo 0 | sudo tee $file > /dev/null
  done
fi

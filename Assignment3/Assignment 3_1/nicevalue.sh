#!/bin/bash
echo "Enter Desired Nice Value: "
read nicevalue
ps ax -o pid,ni,cmd,etime,bsdstart
echo "Processes with Nice Value $nicevalue"
ps ax -o pid,ni,cmd,etime,bsdstart | grep -E "[0-9]* $nicevalue \["
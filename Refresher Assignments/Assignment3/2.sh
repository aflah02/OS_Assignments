#!/bin/bash

count=1

case $1 in
add)
    total=0
    for array_element in "$@"
    do
        if [ $count -ne 1 ]; then
            (( total += $array_element ))
        fi
        (( count++ ))
    done
    echo $total
    ;;
mul)
    total=1
    for array_element in "$@"
    do
        if [ $count != 1 ]; then
            (( total *= $array_element ))
        fi
        (( count++ ))
    done
    echo $total
    ;;
sub)
    total=0
    for array_element in "$@"
    do
        if [ $count != 1 ] && [ $count != 2 ]; then
            (( total -= $array_element ))
        fi
        if [ $count == 2 ]; then
            (( total += $array_element ))
        fi
        (( count++ ))
    done
    echo $total
    ;;
div)
    for array_element in "$@"
    do
        if [ $count != 1 ] && [ $count != 2 ]; then
            (( total /= $array_element ))
        fi
        if [ $count == 2 ]; then
            (( total += $array_element ))
        fi
        (( count++ ))
    done
    echo $total
    ;;
exp)
    for array_element in "$@"
    do
        if [ $count != 1 ] && [ $count != 2 ]; then
            (( total = total**$array_element ))
        fi
        if [ $count == 2 ]; then
            (( total += $array_element ))
        fi
        (( count++ ))
    done
    echo $total
    ;;
esac
#!/bin/bash

# 文字と背景の色の色見本を表示する
for fore in `seq 30 37`
do
    printf "\e[${fore}m \\\e[${fore}m \e[m\n"
    for mode in 1 4
    do
        printf "\e[${fore};${mode}m \\\e[${fore};${mode}m \e[m"
        for back in `seq 40 47`
        do
            printf "\e[${fore};${back};${mode}m \\\e[${fore};${back};${mode}m \e[m"
        done
        echo
    done
done
echo
printf " \\\e[m\n"
echo
echo "付加属性"
echo "0m リセット"
echo "1m 太字"
echo "2m 弱強調"
echo "3m イタリック"
echo "4m 下線"
echo "5m 点滅"
echo "6m 高速点滅"
echo "7m 反転"
echo "8m 非表示"
echo "9m 取り消し線"
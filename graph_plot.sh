#!/bin/sh

# 注意：graph というファイルはない状態で実行してね．

mkdir graph
cd graph
cp ../use_data.txt .
while read line
do
    Rscript ../estimate_k_in_attendance.R $line
    echo $line
    echo "save file!"
done < ../use_data.txt



cd ../

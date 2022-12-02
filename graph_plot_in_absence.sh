#!/bin/sh

# 注意：graph というファイルはない状態で実行してね．
# シェルで希望の形式に変形していてresult_copy.csvが必要になってます．

mkdir graph
cd graph
cp ../use_data_absence.txt .
while read line
do
    Rscript ../estimate_k_in_absence.R $line
    echo $line
    echo "save file!"
done < ../use_data_absence.txt

sed -e 's/"//g' result.csv > result_copy.csv
cut -b 10- result_copy.csv > result.csv
sed -i "1ipngdata,k,S_CO,E_CO2,END_CO2,START_CO2,DATA_RANGE" result.csv
rm result_copy.csv

cd ../

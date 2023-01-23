単純にコードを置いておきたいから作りました．自分用のリポジトリ．

# 想定環境
- python3が使える
- Rが使える

# 各スクリプトの説明
- **absent_attend_get.py**  
feeds_attend.csvの不在から在宅になるまでの時刻の組を抜き出しabsent_attend.txtに記録する  
`使用例 : $python3 absent_attend_get.py`
- **attend_absent_get.py**  
feeds_attend.csvの在宅から不在になるまでの時刻の組を抜き出しattend_absent.txtに記録する  
`使用例 : $python3 attned_absent_get.py`
- **use_data_absence.txt**  
absent_attend.txtから使うデータ(行)のみここにコピーする
- **use_data_attendance.txt**  
attend_absent.txtから使うデータのみここにコピーする
- **graph_plot_in_absence.sh**  
estimate_k_in_absence.Rとuse_data_absence.txtとfeeds.csvを元にグラフを描画し，  
推定した値をcsvファイルに書き出してgraphディレクトリに保存する  
`使用例 : $bash graph_plot_in_absence.sh`
- **graph_plot_in_attendance.sh**  
estimate_k_in_attendance.Rとuse_data_attendance.txtとfeeds.csvを元にグラフを描画し，  
推定した値をcsvファイルに書き出してgraphディレクトリに保存する  
`使用例 : $bash graph_plot_in_attendance.sh`
- **scatter_plot_time_k.R**  
経過時間と換気係数の散布図を描画する  
`使用例 : $Rscript scatter_plot_time_k.R`
sra=$(cat cervical/data/SRR_Acc_List.txt)
prefetch $sra

pf=$(prefetch $sra)
fasterq-dump $pf --split-3

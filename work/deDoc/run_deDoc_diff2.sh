#!/bin/bash 

checkMakeDirectory(){
        echo -e "checking directory: $1"
        if [ ! -e "$1" ]; then
                echo -e "\tmakedir $1"
                mkdir -p "$1"
        fi
}
checkMakeDirectory DOMAINS
checkMakeDirectory DATA

#downsample

ratios=(1 2 5)
mkdir -p DOMAINS/downsample

for ratio in ${ratios[@]}; do
python3 convert_triple.py ../GM12878_downsample_diff_reso/50k_KR_downsample_ratio_0.0${ratio}.chr6 DOMAINS/downsample/50k_KR_downsample_ratio_0.0${ratio}.chr6
java -jar deDoc.jar DOMAINS/downsample/50k_KR_downsample_ratio_0.0${ratio}.chr6
done


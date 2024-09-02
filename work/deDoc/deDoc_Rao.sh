#!/bin/bash 

checkMakeDirectory(){
        echo -e "checking directory: $1"
        if [ ! -e "$1" ]; then
                echo -e "\tmakedir $1"
                mkdir -p "$1"
        fi
}
checkMakeDirectory DOMAINS

rundeDoc(){
BIN=$1
echo "Processing size ${BIN}"

list=($(seq $2 $3))
chromList=($(seq 1 22)) 
chromList[${#chromList[*]}]=X

for li in ${list[@]}; do

data=`printf "HIC%03d" $li`

mkdir -p DOMAINS/${data}

for chrom in ${chromList[@]}; do

python3 convert_triple.py ../Rao/${data}/${data}_50k_KR.chr${chrom} DOMAINS/${data}/${data}.chr${chrom}
java -jar deDoc.jar  DOMAINS/${data}/${data}.chr${chrom}

done
done
}
rundeDoc 50000 1 29
rundeDoc 50000 50 56
rundeDoc 50000 69 74

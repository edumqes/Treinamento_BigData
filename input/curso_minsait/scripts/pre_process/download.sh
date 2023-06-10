#!/bin/bash
BASEDIR="$( cd "$( dirname "${BASE_SOURCE[0]}" )" && pwd )"
CONFIG="${BASEDIR}/../../config/config.sh"
source "${CONFIG}"

echo "Iniciando a criacao em ${DATE}"
cd ../../raw

for table in "${TABLES[@]}"
do
    echo "tabela $table"
    if !([ -d $table ])
    then
        mkdir $table
    fi
    chmod 777 $table
    cd $table
    curl -O https://raw.githubusercontent.com/caiuafranca/dados_curso/main/$table.csv
    #Inserir no docker hdfs
    hdfs dfs -mkdir /datalake/raw/$table
    hdfs dfs -chmod 777 /datalake/raw/$table
    hdfs dfs -copyFromLocal $table.csv /datalake/raw/$table
    cd ..
done

echo "Finalizando a criacao em ${DATE}"
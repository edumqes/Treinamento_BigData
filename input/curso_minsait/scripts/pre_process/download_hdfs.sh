#!/bin/bash
TABLES=("alunos" "categoria" "cidade" "cliente" "estado" "filial" "item_pedido" "parceiro" "produto" "subcategoria")
DATE="$(date --date="-0 day" "+%Y%m%d")"
echo "Iniciando a criacao em ${DATE}"
cd ../../raw
pwd

for table in "${TABLES[@]}"
do
    echo "tabela $table"
    cd $table
    #Inserir no docker hdfs
    hdfs dfs -mkdir /datalake/raw/$table
    hdfs dfs -chmod 777 /datalake/raw/$table
    hdfs dfs -copyFromLocal $table.csv /datalake/raw/$table
    exit
    cd ..
done

echo "Finalizando a criacao em ${DATE}"
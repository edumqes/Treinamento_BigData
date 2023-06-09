#!/bin/bash
DATE="$(date --date="-0 day" "+%Y%m%d")"

TABLES=("alunos" "categoria" "cidade" "cliente" "estado" "filial" "item_pedido" "parceiro" "produto" "subcategoria")
TABELA_CLIENTE="TBL_CLIENTE_OLD"

PARTICAO=""


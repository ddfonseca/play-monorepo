#!/bin/bash

# Pegue o output dos projetos modificados
output=$(npx nx show projects --affected)

# Adiciona aqui o nome dos projetos que realizarão o deploy
projects="(app1|app2)"

# Atribua modified_apps
modified_apps=($(echo $output | grep -o -E "$projects" | sort | uniq))

# Definindo o separador interno como vírgula
IFS=','  
# Concatena os elementos de modified_apps na própria variável com o separador de vírgula ','
# Porque encontrei bugs na hora atriburi a variável de ambiente AFFECTED_APPS
printf -v modified_apps "%s" "${modified_apps[*]}" 

# Adiciona modified_apps na variável de ambientes AFFECTED_APPS para ser usada nas etapas de deploy
echo "AFFECTED_APPS=${modified_apps}" >> $GITHUB_ENV

if [ -z "$modified_apps" ]; then
    echo "Nenhum app modificado, finalizando..."
    exit 0
fi
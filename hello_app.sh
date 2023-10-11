#!/usr/bin/env bash

# Exersize:
# https://learn.microsoft.com/en-us/azure/developer/python/python-web-app-github-actions-app-service?tabs=azure-cli

# Sample App:
# https://github.com/Microsoft/python-sample-vscode-flask-tutorial
# https://code.visualstudio.com/docs/python/tutorial-flask


#  "URL": "http://helloflaskapp43721.azurewebsites.net"
#  "appserviceplan": "ROHY8981_asp_2020"


# Desided names
github_user="RoarHylleberg"
github_repo="python-sample-vscode-flask-tutorial"
resourcegroup="ROHY8981_rg_56781"
location="westeurope"
webapp_name="HelloFlaskApp51234"



cd ~
cd dev/
git clone https://github.com/RoarHylleberg/python-sample-vscode-flask-tutorial.git
cd python-sample-vscode-flask-tutorial


az group create \
  --name ROHY8981_rg_56781 \
  --location westeurope


az webapp up \
  --name HelloFlaskApp51234 \
  --runtime "PYTHON:3.9" \
  --resource-group ROHY8981_rg_56781 \
  --location westeurope


az webapp show \
  --name HelloFlaskApp51234 \
  --resource-group ROHY8981_rg_56781 \
  --query defaultHostName


az webapp config set \
  --resource-group ROHY8981_rg_56781 \
  --name HelloFlaskApp51234 \
  --startup-file startup.txt


az webapp deployment github-actions add \
  --repo "RoarHylleberg/python-sample-vscode-flask-tutorial" \
  --resource-group ROHY8981_rg_56781 \
  --branch main \
  --name HelloFlaskApp51234 \
  --login-with-github


az webapp deployment source show \
  --resource-group ROHY8981_rg_56781 \
  --name HelloFlaskApp51234


#az configure --scope local'
#--resource-group/-g default: ROHY8981_rg_56781
#--sku default: F1
#--plan/-p default: ROHY8981_asp_2020
#--location/-l default: westeurope
#--name/-n default: HelloFlaskApp43721
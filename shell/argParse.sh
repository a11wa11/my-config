#!/bin/bash

# 引数解析例
while getopts t:e:p:g OPT
do
   case $OPT in
   t) TEMPLATE_FILEPATH=$OPTARG
      ;;
   e) ENVIRONMENT=$OPTARG
      ;;
   p) PARAMETERS=$OPTARG
      ;;
   g) DEPLOY=0
      ;;
   esac
done



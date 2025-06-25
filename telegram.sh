#!/bin/bash

ID="1212173181"
TOKEN="7602445779:AAH284dr9dXPbGFUm-pUsS0B9ZAiA0HMWFw"


if [[ "$CI_JOB_STAGE" == "build" ]]      
then
    curl -s --max-time 10 -X POST https://api.telegram.org/bot$TOKEN/sendMessage -d chat_id=$ID -d text="Build with pipelines ID is $CI_PIPELINE_ID%0ACD is $CI_JOB_STATUS"
elif [[ "$CI_JOB_STAGE" == "style" ]]
then
    curl -s --max-time 10 -X POST https://api.telegram.org/bot$TOKEN/sendMessage -d chat_id=$ID -d text="Style-test with pipelines ID is $CI_PIPELINE_ID%0ACI is $CI_JOB_STATUS"
elif [[ "$CI_JOB_STAGE" == "test" ]]      
then
    curl -s --max-time 10 -X POST https://api.telegram.org/bot$TOKEN/sendMessage -d chat_id=$ID -d text="Tests with pipelines ID is $CI_PIPELINE_ID%0ACD is $CI_JOB_STATUS"
elif [[ "$CI_JOB_STAGE" == "deploy" ]]
then
    curl -s --max-time 10 -X POST https://api.telegram.org/bot$TOKEN/sendMessage -d chat_id=$ID -d text="Deploy with pipelines ID is $CI_PIPELINE_ID%0ACI is $CI_JOB_STATUS"
fi

if [[ "$CI_JOB_STAGE" != "test" ]] && [[ "$CI_JOB_STAGE" != "deploy" ]] && [[ "$CI_JOB_STAGE" != "style" ]] && [[ "$CI_JOB_STATUS" != "success" ]] && [[ "$CI_JOB_STAGE" != " build" ]]
then
    curl -s --max-time 10 -X POST https://api.telegram.org/bot$TOKEN/sendMessage -d chat_id=$ID -d text="Pipelines ID is $CI_PIPELINE_ID%0ACI is $CI_JOB_STATUS"
fi
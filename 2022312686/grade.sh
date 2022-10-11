#!/bin/bash

RST='\033[0m'
RED='\033[0;31m'
GRN='\033[0;32m'


if [ "$1" == "c" ]; then
    gcc -o keygen ./keygen.c
    COMMAND="./keygen"
fi


if [ "$1" == "py" ]; then
    COMMAND="python3 ./keygen.py"
fi


if [ -z "$1" ]; then
    echo -e "Usage: ./grade.sh c  (for C keygen)"
    echo -e "       ./grade.sh py (for Python keygen)"

    exit 1
fi


echo -e "Running Test Case 1"

OUTPUT=$(${COMMAND} 5fCfO2ztXw8cMbSLQHxs 72)
echo "${OUTPUT}"
if [ "${OUTPUT}" == $(echo MWJZYi1LOHZwLVRzMHUtRXRLRC1JWnBrCg== | base64 -d)  ]; then
    echo -e "${GRN}####################################${RST}"
    echo -e "${GRN}####### Test Case  1 Passed ########${RST}"
    echo -e "${GRN}####################################${RST}\n\n"
    
else
    echo -e "${RED}####################################${RST}"
    echo -e "${RED}####### Test Case  1 Failed ########${RST}"
    echo -e "${RED}####################################${RST}\n\n"

fi


echo -e "Running Test Case 2"
OUTPUT=$(${COMMAND} r1zT9UtKZcShNH130t0G 254)
echo "${OUTPUT}"
if [ "${OUTPUT}" == $(echo "YzZrRS00RmVWLUtuRXQtWlQ3OS02ZjZTCg==" | base64 -d)  ]; then
    echo -e "${GRN}####################################${RST}"
    echo -e "${GRN}####### Test Case  2 Passed ########${RST}"
    echo -e "${GRN}####################################${RST}\n\n"

else
    echo -e "${RED}####################################${RST}"
    echo -e "${RED}####### Test Case  2 Failed ########${RST}"
    echo -e "${RED}####################################${RST}\n\n"

fi


echo -e "Running Test Case 3"

OUTPUT=$(${COMMAND} NmfYIcMMDYzuafbiUwXb 255)
echo "${OUTPUT}"

if [ "${OUTPUT}" == $( echo WXhxSi1UblhYLU9Ka2YtbHFtdC1GaEltCg== | base64 -d ) ]; then
    echo -e "${GRN}####################################${RST}"
    echo -e "${GRN}####### Test Case  3 Passed ########${RST}"
    echo -e "${GRN}####################################${RST}\n\n"

else
    echo -e "${RED}####################################${RST}"
    echo -e "${RED}####### Test Case  3 Failed ########${RST}"
    echo -e "${RED}####################################${RST}\n\n"

fi



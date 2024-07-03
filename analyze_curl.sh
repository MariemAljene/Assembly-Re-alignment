#!/bin/bash

# Paths
GHIDRA_PATH="/mnt/c/Users/marie/ghidra_11.1.1_PUBLIC"
PROJECT_PATH="/mnt/c/Users/marie/OneDrive/Desktop/Eurecom/Forensics/Project/ghidra_projects"
SCRIPTS_PATH="/mnt/c/Users/marie/OneDrive/Desktop/Eurecom/Forensics/Project/ghidra_scripts"
EXECUTABLES_PATH="/mnt/c/Users/marie/OneDrive/Desktop/Eurecom/Forensics/Project/curl/executables"

# Create a Ghidra project and analyze the 64-bit executable
${GHIDRA_PATH}/support/analyzeHeadless ${PROJECT_PATH} CurlProject -import ${EXECUTABLES_PATH}/64bit/curl_64bit -postScript ${SCRIPTS_PATH}/AnalyzeCurlScript.java

# Repeat for 32-bit executable if it exists
if [ -f "${EXECUTABLES_PATH}/32bit/curl_32bit" ]; then
    ${GHIDRA_PATH}/support/analyzeHeadless ${PROJECT_PATH} CurlProject -import ${EXECUTABLES_PATH}/32bit/curl_32bit -postScript ${SCRIPTS_PATH}/AnalyzeCurlScript.java
fi

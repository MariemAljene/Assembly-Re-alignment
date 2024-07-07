#!/bin/bash

GHIDRA_PATH=/mnt/c/Users/marie/ghidra_11.1.1_PUBLIC
PROJECT_PATH=/mnt/c/Users/marie/OneDrive/Desktop/Eurecom/Forensics/Project/new_ghidra_projects/NewCurlProject
SCRIPTS_PATH=/mnt/c/Users/marie/OneDrive/Desktop/Eurecom/Forensics/Project/ghidra_scripts
EXECUTABLES_PATH=/mnt/c/Users/marie/OneDrive/Desktop/Eurecom/Forensics/Project/curl/executables

rm -rf "$PROJECT_PATH"

CLASSPATH="${GHIDRA_PATH}/Ghidra/Framework/Utility/lib/Utility.jar"
CLASSPATH="${CLASSPATH}:${GHIDRA_PATH}/Ghidra/Framework/Generic/lib/Generic.jar"
CLASSPATH="${CLASSPATH}:${GHIDRA_PATH}/Ghidra/Features/Base/lib/Base.jar"
CLASSPATH="${CLASSPATH}:${GHIDRA_PATH}/Ghidra/Features/Base/lib/ghidra.jar"
CLASSPATH="${CLASSPATH}:${GHIDRA_PATH}/Ghidra/Features/Base/lib/ghidra_api.jar"
CLASSPATH="${CLASSPATH}:${GHIDRA_PATH}/Ghidra/Framework/SoftwareModeling/lib/SoftwareModeling.jar"
CLASSPATH="${CLASSPATH}:${GHIDRA_PATH}/Ghidra/Framework/DB/lib/DB.jar"
CLASSPATH="${CLASSPATH}:${GHIDRA_PATH}/Ghidra/Framework/Project/lib/Project.jar"
CLASSPATH="${CLASSPATH}:${GHIDRA_PATH}/Ghidra/Processors/x86/lib/x86.jar"
CLASSPATH="${CLASSPATH}:${SCRIPTS_PATH}"

"$GHIDRA_PATH/support/analyzeHeadless" "$PROJECT_PATH" NewCurlProject -import "$EXECUTABLES_PATH/64bit/curl_64bit" -postScript AnalyzeCurlOffsets -deleteProject -scriptPath "$SCRIPTS_PATH"
"$GHIDRA_PATH/support/analyzeHeadless" "$PROJECT_PATH" NewCurlProject -import "$EXECUTABLES_PATH/32bit/curl_32bit" -postScript AnalyzeCurlOffsets -deleteProject -scriptPath "$SCRIPTS_PATH"
"$GHIDRA_PATH/support/analyzeHeadless" "$PROJECT_PATH" NewCurlProject -import "$EXECUTABLES_PATH/other_executable" -postScript AnalyzeCurlOffsets -deleteProject -scriptPath "$SCRIPTS_PATH"
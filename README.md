Project Overview
This project aims to analyze the re-alignment behavior of a linear sweep disassembler when starting at incorrect offsets in executable code. We utilized Ghidra to automate the disassembly process for a dataset of 100+ executables, specifically focusing on curl32 (32-bit) and curl64 (64-bit) formats. The primary goal was to measure how many instructions a disassembler processes before encountering a re-alignment or invalid instruction when starting from random offsets.

Current Status
Although the script setup and initial implementation are complete, we were not able to finish the project. We are in the process of fully automating the random offset disassembly and data collection. The next steps involve finalizing this automation and conducting a comprehensive analysis of the results.

Project Structure
/scripts/: Contains the Ghidra scripts used for disassembly and analysis.
AnalyzeCurlScript.java: The main Ghidra script to analyze executables.
/data/: Contains the dataset of executables (not included in the repository).
README.md: This file.
Usage
Requirements
Ghidra
Java (for Ghidra scripting)
Python (for further analysis, if needed)
Running the Script
Set up Ghidra scripting environment:

Place the AnalyzeCurlScript.java file in the appropriate Ghidra scripts directory.
Open Ghidra and load your curl32 or curl64 executable.
Run the AnalyzeCurlScript.java from the Ghidra Script Manager.
Script Functionality:

The script will disassemble the entire code section of the executable correctly.
It will generate 1000 random offsets within the code section.
From each random offset, it will attempt to disassemble and measure the number of instructions before encountering a re-alignment or invalid instruction.
The results will be saved for further analysis.
Next Steps
Complete Automation:

Finalize the automation of the random offset disassembly and data collection process.
Ensure robust error handling and data recording.
Data Analysis:

Analyze the collected data to understand the distribution and frequency of re-alignments and invalid instructions.
Use Python for statistical analysis and visualization of the results.
Reporting:

Compile the findings into a detailed report.
Include visualizations such as histograms, box plots, or scatter plots to represent the data effectively.

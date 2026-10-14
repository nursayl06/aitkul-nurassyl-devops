#!/bin/bash

INFO_FILE="$HOME/devops/aitkul_nurassyl/Aitkul_Nurassyl_info.txt"

echo "=============================="
echo "Student Information"
echo "=============================="
echo ""
echo "Name: Nurassyl"
echo "Surname: Aitkul"
echo "Group: IT2-2307"
echo "Student ID: 37375"
echo ""
echo "=============================="
echo "System Information"
echo "=============================="
echo ""
echo "Username: $(whoami)"
echo "Hostname: $(hostname)"
echo "Current Date: $(date)"
echo "Operating System: $(uname -s) $(uname -r)"
echo ""
echo "Disk Usage:"
df -h /
echo ""
echo "Memory Usage:"
free -h
echo ""

if [ -f "$INFO_FILE" ]; then
    echo "Student information file exists."
else
    echo "Student information file does not exist."
fi

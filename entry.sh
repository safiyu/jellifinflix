#!/bin/bash
echo "Start: $(date)"
echo "Starting scan"
cp /app/replace.sh /media
ls -l
cd /media
ls -l
chmod +x replace.sh
source replace.sh
rm /media/replace.sh
echo "Scan ended"
echo "End: $(date)"
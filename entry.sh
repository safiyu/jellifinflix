#!/bin/bash
echo "Start: $(date)"
echo "Starting scan"
cp /app/replace.sh /media
cd /media
chmod +x replace.sh
source replace.sh
rm /media/replace.sh
echo "Scan ended"
echo "End: $(date)"
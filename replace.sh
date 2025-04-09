#!/bin/bash

find . -type d -exec bash -c '
        join_paths() {
            (IFS=/; echo "$*" | tr -s /)
        }
        for dir do
            full_path=$(join_paths "$dir" ".ignore")
            if find "$dir" -maxdepth 1 -type f \( -name "*.mkv" -o -name "*.mp4" \) | read; then
                echo "$dir - Video file exists. skipping folder"
                if [ -f "$full_path" ]; then
                    rm "$full_path"
                fi
            else
                subdircount=$(find "$dir" -maxdepth 1 -type d | wc -l)

                if [[ "$subdircount" -eq 1 ]]
                then
                    echo "$dir - No video file exists. creating $full_path"
                    touch "$full_path"
                else
                    if [ -f "$full_path" ]; then
                        rm "$full_path"
                    fi
                fi
                
                
            fi
            FILES_FOUND=$(find "$dir" -type f \( -name "*.mkv" -o -name "*.mp4" \) -print)
	    	if [ -z "$FILES_FOUND" ]; then
		  # Create an empty text file
		  touch "$full_path"
		else
		   	if [ -f "$full_path" ]; then
		            rm "$full_path"
		        fi	
		fi
        done' bash {} +

curl -s -S -d "" -w "jellyfin library refresh completed with http_code:%{http_code}\\n" -H "Accept: application/json" "$JF_URL/library/refresh?api_key=$JF_API_KEY"

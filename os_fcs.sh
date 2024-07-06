#!/bin/bash


whiptail --title "Home Page" --msgbox "OS - File Controlling System" 10 60

# Displaying options
opt=$(whiptail --title "MAIN MENU" --menu "" 17 60 10 \
	1 "List All Files and Directories." \
	2 "Create New Files." \
	3 "Edit File Content." \
	4 "Rename Files." \
	5 "Searching Files." \
	6 "Details of Particular File." \
	7 "Count Number of Files." \
	8 "Sort File Content." \
	9 "List only Directories in Folders." \
	10 "Count Number of Directories." \
	11 "View Content of File." \
	12 "Delete Existing Files." \
	13 "Sort Files in a Directory." \
	14 "List Files of Particular Extension." \
	0 "End Menu" 3>&2 2>&1 1>&3
	# Redirects standard input (0) to "End Menu"
    # Creates a custom file descriptor 3 and makes it point to the same location as standard error (2)
   	# Redirects standard error (2) to the same location as standard output (1)
    # Redirects standard output (1) to the same location as the custom file descriptor 3
)

# Handling user choices
case $opt in
    1)  # Option 1: List all files and directories
        echo "Showing all files and directories...."
        { 
            for ((i = 0; i <= 100; i+=5)); do
                sleep 0.1
                echo $i
            done
        } | whiptail --gauge "Loading..." 6 50 0
        ls
        echo " ";;

    2)  # Option 2: Create new files
        echo "Enter File Name: "
        read fileName
        touch "$fileName"
        { 
            for ((i = 0; i <= 100; i+=5)); do
                sleep 0.1
                echo $i
            done
        } | whiptail --gauge "Creating..." 6 50 0
        sleep 3
        echo "File Created Successfully"
        echo " ";;

    3)  # Option 3: Edit file content
        echo "Enter File Name with Extension : "
        read edit

        { 
            for ((i = 0; i <= 100; i+=5)); do
                sleep 0.1
                echo $i
            done
        } | whiptail --gauge "Checking File..." 6 50 0
        sleep 3

        if [ -f "$edit" ]; then
            { 
                for ((i = 0; i <= 100; i+=5)); do
                    sleep 0.1
                    echo $i
                done
            } | whiptail --gauge "Opening..." 6 50 0
            sleep 3
            nano "$edit"
            echo " "
        else
            echo "$edit File does not exist..Try again."
        fi
        ;;

    4)  # Option 4: Rename files
        echo "Enter Old Name of File with Extension.."
        read old

        { 
            for ((i = 0; i <= 100; i+=5)); do
                sleep 0.1
                echo $i
            done
        } | whiptail --gauge "Checking File..." 6 50 0
        sleep 3

        if [ -f "$old" ]; then
            echo "Now Enter New Name for file with Extension"
            read new
            mv "$old" "$new"
            { 
                for ((i = 0; i <= 100; i+=5)); do
                    sleep 0.1
                    echo $i
                done
            } | whiptail --gauge "Renaming..." 6 50 0
            sleep 3
            echo "Successfully Rename."
            echo "Now Your File Exist with $new Name"
        else
            echo "$old does not exist..Try again with correct filename."
        fi
        echo " ";;

    5)  # Option 5: Searching Files
        echo "Search files here.."
        echo "Enter File Name with Extension to search"
        read f

        if [ -f "$f" ]; then
            { 
                for ((i = 0; i <= 100; i+=5)); do
                    sleep 0.1
                    echo $i
                done
            } | whiptail --gauge "Searching for $f file..." 6 50 0
            sleep 5
            echo "File Found."
            find /home -name "$f"
            echo " "
        else
            echo "File Does not Exist..Try again."
            echo " "
        fi
        ;;

    6)  # Option 6: Details of Particular File
        echo "Enter File Name with Extension to see Detail : "
        read detail

        { 
            for ((i = 0; i <= 100; i+=5)); do
                sleep 0.1
                echo $i
            done
        } | whiptail --gauge "Checking..." 6 50 0
        sleep 3

        if [ -f "$detail" ]; then
            { 
                for ((i = 0; i <= 100; i+=5)); do
                    sleep 0.1
                    echo $i
                done
            } | whiptail --gauge "Loading Properties..." 6 50 0
            sleep 3
            stat "$detail"
        else
            echo "$detail File does not exist..Try again"
        fi
        echo " ";;

    7)  # Option 7: Count Number of Files
        { 
            for ((i = 0; i <= 100; i+=5)); do
                sleep 0.1
                echo $i
            done
        } | whiptail --gauge "Counting..." 6 50 0
        sleep 3

        echo "Number of Files are : "
        ls -l | grep -v 'total' | wc -l
        echo " ";;

    8)  # Option 8: Sort File Content
        echo "Sort files content here.."
        echo "Enter File Name with Extension to sort :"
        read sortfile

        if [ -f "$sortfile" ]; then
            { 
                for ((i = 0; i <= 100; i+=5)); do
                    sleep 0.1
                    echo $i
                done
            } | whiptail --gauge "Sorting..." 6 50 0
            sleep 3
            sort "$sortfile"
        else
            echo "$sortfile File does not exist..Try again."
        fi
        echo " ";;

    9)  # Option 9: List only Directories in Folders
        echo "showing all Directories..."
        { 
            for ((i = 0; i <= 100; i+=5)); do
                sleep 0.1
                echo $i
            done
        } | whiptail --gauge "Loading..." 6 50 0

        ls -d */
        echo " ";;

    10)  # Option 10: Count Number of Directories
        { 
            for ((i = 0; i <= 100; i+=5)); do
                sleep 0.1
                echo $i
            done
        } | whiptail --gauge "Loading..." 6 50 0
        sleep 3

        echo "Number of Directories are : "
        echo */ | wc -w
        echo " ";;

    11)  # Option 11: View Content of File
        echo "Enter File Name : "
        read readfile

        if [ -f "$readfile" ]; then
            { 
                for ((i = 0; i <= 100; i+=5)); do
                    sleep 0.1
                    echo $i
                done
            } | whiptail --gauge "Showing..." 6 50 0
            sleep 3
            cat "$readfile"
        else
            echo "$readfile does not exist"
        fi
        echo " ";;

    12)  # Option 12: Delete Existing Files
        echo "Enter name of File you want to Delete!"
        read delFile

        if [ -f "$delFile" ]; then
            rm "$delFile"
            { 
                for ((i = 0; i <= 100; i+=5)); do
                    sleep 0.1
                    echo $i
                done
            } | whiptail --gauge "Deleting..." 6 50 0
            sleep 3
            echo "Successfully Deleted."
            echo " "
        else
            echo "File Does not Exist..Try again"
            echo " "
        fi
        ;;

    13)  # Option 13: Sort Files in a Directory
        echo "Sort Files here.."
        echo "Your Request of Sorting file is Generated."
        { 
            for ((i = 0; i <= 100; i+=5)); do
                sleep 0.1
                echo $i
            done
        } | whiptail --gauge "Sorting..." 6 50 0
        sleep 3
        ls | sort
        echo " ";;

    14)  # Option 14: List Files of Particular Extension
        echo "Enter List type extension: "
        read ext
        { 
            for ((i = 0; i <= 100; i+=5)); do
                sleep 0.1
                echo $i
            done
        } | whiptail --gauge "Showing..." 6 50 0

        ls *"$ext"
        echo " ";;

    0)  # Option 0: End the program
        { 
            for ((i = 0; i <= 100; i+=5)); do
                sleep 0.1
                echo $i
            done
        } | whiptail --gauge "Closing..." 6 50 0
        echo "Successfully Exit..."
        exit 0
        ;;

    *)  # Default case for invalid input
        echo "Invalid Input! Try again...."
        ;;
esac


clear
echo -en "\n"
echo "1. pwd"

echo -en "\n"
echo "pwd stands for 'Print Working Directory'."
echo "This command will print the full path of the directory you are currently working in, starting from the root directory."
echo "pwd accepts two potential arguments, however they will not be covered because they refer to commands that are not in this tutorial."

skip=false
menu=false
keepGoing=true
while [ ${keepGoing} = true ]; do
	echo -en "\n"
	echo "Enter the number of the option you would like to proceed to:"
	echo "1. Practice problem"
	echo "2. Skip practice / Next tutorial"
	echo "3. Return to menu"
	echo -en "\n"
	read -p "> " input

	if [ "${input}" == "1" ]; then
		# practice
		echo -en "\n"
		echo "Practice Problem:"
		echo "Use the pwd command to find the name of the current directory (it is included in the full path). Then, enter the name of the current directory."
		echo "To show the solution, enter 'solve'. To skip this question and proceed to the next tutorial, enter 'skip'. To return to the menu, enter 'menu':"
		problemBoolean=true

		while [ ${problemBoolean} = true ]; do
			echo -en "\n"
			read -p "> " answer
			if [ "${answer}" == "pwd" ]; then
				echo -en "\n"
				${answer}
			elif [ "${answer}" == "bash-tutorial" ]; then
				echo -en "\n"
				echo "Correct! Moving on to the next command."
				problemBoolean=false
				keepGoing=false
				skip=true
			elif [ "${answer}" == "skip" ]; then
				echo -en "\n"
				echo "Moving on to the next command."
				problemBoolean=false
				keepGoing=false
				skip=true
			elif [ "${answer}" == "solve" ]; then
				echo -en "\n"
				echo "The answer to this question is 'bash-tutorial'."
				echo "To find this answer, you would have to enter 'pwd'. This would show you the full path of the current directory, with the current directory appearing at the end:"
				echo -en "\n"
				echo "> pwd"
				pwd
				echo -en "\n"
				echo "As you can see, 'bash-tutorial' is the directory name."
				problemBoolean=false
			elif [ "${answer}" == "menu" ]; then
				echo -en "\n"
				echo "Returning to the menu."
				problemBoolean=false
				keepGoing=false
				menu=true
			else
				${answer}
				if [ $? -eq 0 ]; then
    					#the command just works
				else
    					echo "Command failed. Try another input."
					sleep 2
				fi
			fi
		done
	elif [ "${input}" == "2" ]; then
		echo -en "\n"
		echo "Moving on to the next command."
		keepGoing=false
		skip=true
	elif [ "${input}" == "3" ]; then
		echo -en "\n"
		echo "Returning to the menu."
		keepGoing=false
		menu=true
	else 
		echo "You entered an invalid input. Please try again."
	fi
done

if [ ${skip} = true ]; then
	sleep 2
	bash ./scripts/ls.sh
elif [ ${menu} = true ]; then
	sleep 2
	bash ./welcome.sh
fi	

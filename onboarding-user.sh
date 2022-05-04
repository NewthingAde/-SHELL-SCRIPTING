#! /bin/bash

# created by: Oluwasegun Adesanya
# Date : 04/02/2021
#purpose : Onboarding users and adding them to a specfic groupand then creating an authorized key for the ssh remote login 



clear


# path to name file
file=names.csv

# default of ssh directory stored in a variable
ssh=/etc/skel/.ssh

# authorized key file in a variable
key=authorized_keys

# Ensure Group has been created manually, then add and set sefaukt password and group to new user

group="develop"
pass="ade123456789"

# populate skel directory with ssh folder

if [ -d "$ssh" ] ;
then 
	echo 
	echo "ssh folder already exist"
	echo
else
	sudo mkdir -p $ssh
	sudo bash -c "echo $key >> $ssh/authorized_keys"
	echo "$ssh directory is now created and ready for use"
	sudo bash -c "echo $key >> $ssh/authorized_keys"
	echo "$ssh directory is now created and ready for use"
	echo
fi

while IFS= read user
	do
		# Check if the user already exists
		if [ $(getent passwd $user) ] ;
		then 
			echo "This user - $user already exists."
			echo
		else
			

			sudo useradd -m -G $group -s /bin/bash $user
			sudo echo -e "$pass\n$pass" | sudo passwd "${user}" 
			sudo passwd -x 3 ${user}
			sudo chmod 600 /home/$user/.ssh
			sudo chmod 600 /home/$user.ssh/authorized_keys
			sudo chmod $user /home/$user/.ssh/authorized_keys
			echo "$user created..."
			echo
		fi
		done < $file && "User created succefully completed"






	









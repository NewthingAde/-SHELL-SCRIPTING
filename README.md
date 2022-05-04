# -SHELL-SCRIPTING

Creating Shell Scripting In Linux

This project is to automate some work using Shell Scripts. In other to complete this, we need to onboard 20 new Linux users onto a server. Create a shell script that reads a csv file that contains the first name of the users to be onboarded.

- Create a Ec2 instance on Aws. In my case i used Ubuntu but you can decide to use any instance.

- Connect to your instance 

- Create the project folder called Shell and moved into the folder
                        
                        mkdir Shell && cd Shell
                        
- Create a csv file name names.csv and onboarding-user open it. Insert some random names into it. (One name per line)

                        touch names.csv && vi names.csv
                        
                        touch onboarding-user.sh && vi onboarding-user.sh

- insert the what is inside the .sh file in my folder

- next is to chage the persimiison of the onboarding-user.csv. The permission 600 means that the file is Protected against any access from other users, while the issuing user still has full access.
                               
                               chmod 700 onboarding-user.sh
                                
- Next we run the file using the command 

                                   ./onboarding-user.sh
                                   
- Next we can check the password of each user and also their group usijg the follwoing command

                                    cat /etc/passwd
                                    
                                    cat /etc/group
                                    
- We can list the user and their directories using the command line 

                                    sudo ls -lla /home/
                                    
- Next i can list the files in one of the user let us take the user motun as an example

                                    sudo vi /home/tolu/ 
                                    
- Next we open the authorized_key of the user and insert the public key file in the public_key.txt

                                        sudo vi /home/tolu/.ssh/authorized_keys

- Next we `cd` back into the root directory and we generate our gen key using the command below

                                              cd ..
                                        
                                         ssh-keygen
                                         
<img width="584" alt="Screenshot 2022-05-04 at 13 44 20" src="https://user-images.githubusercontent.com/80678596/166674980-f11c0453-a482-400f-829c-c3ff2a6e8f69.png">

                                       
- Next we will check this by listing the file in the directory (Note: I´m using Ubuntu but if you are using ec2-user then your command line will chamge)

                                     sudo ls -lla /home/ubuntu/.ssh/
                                     
<img width="555" alt="Screenshot 2022-05-04 at 13 45 07" src="https://user-images.githubusercontent.com/80678596/166675006-6dc585e0-307a-4b99-96e7-8934bb729cd4.png">

- Next change the permission of all the file in the folder, giving it 600 permission. 

                                    sudo chmod 600 /home/ubuntu/.ssh/authorized_keys
                                    
                                    sudo chmod 600 /home/ubuntu/.ssh/id_rsa
                                    
                                    sudo chmod 600 /home/ubuntu/.ssh/id_rsa.pub
                                    
if we use this command `sudo cat /home/ubuntu/.ssh/id_rsa.pub` we will get the public key given to us by AWS but that is not what we needed

      
                                      sudo vi /home/ubuntu/.ssh/id_rsa.pub
      
- We will chmage the public key to our own public key ij the public_key.txt file  
      
                                sudo vi /home/ubuntu/.ssh/authorized_key
      
      
- Here you will put the private key in the private.txt and replace it with the private_key.txt that AWS gives us


                                   sudo vi /home/ubuntu/.ssh/id_rsa


- Next we can go into the sshd_config file in the /etc/ssh/ folder. Check the picture below and ensure the yellow colour is checked in your code.

                                         sudo vi /etc/sshd_config 

<img width="1440" alt="Screenshot 2022-05-04 at 14 40 06" src="https://user-images.githubusercontent.com/80678596/166682962-ece29b41-3d93-4f29-a859-851819ee8185.png">

- Next, we will use login into one of the user we are using (tolu) using the following command

                                      ssh tolu@172.31.26.91

If you did everthing rightly, you will get something similar to below 

<img width="993" alt="Screenshot 2022-05-04 at 14 37 58" src="https://user-images.githubusercontent.com/80678596/166682654-52f8c560-26d1-4875-9fe2-d928b7eb28b8.png">

- You can then use `exit` to exit the user

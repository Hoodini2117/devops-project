TASK 2 : ROLL BASED AUTHENTICATION

![Screenshot from 2024-11-28 22-44-18](https://github.com/user-attachments/assets/8b1543d5-6a87-4192-b527-af932da8608a)

6 users were added with the names as :
devops 1 / devops 2
developer 1 / developer 2 
testing 1 / testing 2

The developer / devops / test roles have been created and they are given their respective authorisations. 2 global roles have been added as global admin / global reader to give everyone read permissions.


![Screenshot from 2024-11-28 22-54-52](https://github.com/user-attachments/assets/188d3d89-1872-4137-b783-b127ce60ec07)


Global reader has been given to all the roles and global admin has been give to the admin user as seen in the screenshot above.


![Screenshot from 2024-11-28 22-54-57](https://github.com/user-attachments/assets/1db455fa-7776-4edc-93c8-3729d4224c43)


TASK 3 : PIPELINE FOR DISK USAGE AUR PROCESS MANAGEMENT

![image](https://github.com/user-attachments/assets/a4f177e4-3ad3-4193-83ca-86e62f6a7269)

This script identifies the top 10 resource intensive CPU and memory processes and lists them. It also lists zombie processes using the ps auk statement.

![image](https://github.com/user-attachments/assets/cc9295b6-b573-4c5f-82de-d8344083ace9)

This script checks the memory consumption from the (/) folder files. If the usage is above 80% then it will print a warning other wise it will show normal usage.



![image](https://github.com/user-attachments/assets/a1930af2-22e8-4526-a88c-b5b1ef7b72e9)



This groovy script checks the source code from github repo (devops-project) . It reads script 1 and script 2 for disk usage / process management. If the build fails, a notification is sent to the mail "ayaan171104@gmail.com".

Task 4 : BACKUP PROCESS 

![image](https://github.com/user-attachments/assets/0ca76d3d-a325-4119-be10-4765d2749c4a)


Script passes command-line arguments to set a source "-s" and a destination "-d" directories with an option of compression "-c" . A log funtion is created to store log the timestamps or tracking. If the mandatory requirements are not met it exits with a message.



![image](https://github.com/user-attachments/assets/7dfcb117-ae15-4636-a197-96cc0b49ee1e)


This part of the script checks if the source and the destination passed previously, exists or not. If it exists, the cript will continue naturally and if it does not exist, a new directory will be made. If it further fails while creating a directory it will show an error message and exit while upodating the log.


![image](https://github.com/user-attachments/assets/491d417a-02a6-443e-80e5-585473e758a5)


The cript will perform a backup of the source dir at the destination dir, It generates a timestamp backup name. If the compress option is used, the dir is backed up in a .tar.gz file using tar . If not used, it copies the source dir to the new dir. Logs are updated at each step whether success or failure. There is also a cleanup fucntion that will remove any bacup files after 7 days .



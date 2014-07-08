Script to install nZEDb. 

Sign up to AWS, figure out how to use keys and security groups. I may write a tutorial on this later on, but for now it's assumed. 

Instructions:

1. I encourage you to look through go.sh and see what it does, and ensure i'm not hacking your gibson

2. Launch a "Ubuntu Server 14.04 LTS" - ami-41128a7b, the t2.micro tier works fine if you're just starting out, and it's free for a year for new AWS accounts.

3. ssh to said machine

4. sudo su -

5. wget https://raw.githubusercontent.com/xelfer/nZEDbgo/master/go.sh

6. bash go.sh 

7. Browse to http://your-server-ip/

You should see:
![nZEDb config page](http://note.io/U03IuC)


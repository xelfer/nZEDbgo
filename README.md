Script to install nZEDb. 

Sign up to AWS, figure out how to use keys and security groups. I may write a tutorial on this later on, but for now it's assumed. 

Instructions:

1. Launch a "Ubuntu Server 14.04 LTS" - ami-41128a7b, the t2.micro tier works fine if you're just starting out, and it's free for a year for new AWS accounts.

2. ssh to said machine

3. sudo su -

4. wget https://raw.githubusercontent.com/xelfer/nZEDbgo/master/go.sh

5. bash go.sh
..and follow the on-screen instructions. 

6. Browse to http://your-server-ip/

A script to install nZEDb automagically. 

_Notes:_

It's your responsibility to sign up to AWS and to figure out how to use keys and security groups. I may write a tutorial on this later on, but for now it's assumed you know what you're doing here. If you don't and need a place to start, head over to http://aws.amazon.com/. There's probably a bunch of tutorials for this online already. 

I encourage you to look through go.sh and see what it does, and ensure i'm not hacking your gibson.

This script completely disables apparmor. If you need it, you can probably figure out how to remove the mysql exception and re-enable it. 

The script does NOT set your php timezone, that's up to you as I don't have a clue where you're from. (it's not 100% necessary either).  You can fix this by editing /etc/php5/apache2/php.ini and setting the date.timezone option. (Don't forget to restart apache). 

_Instructions:_

1. Launch a "Ubuntu Server 14.04 LTS" - ami-41128a7b, the t2.micro tier works fine if you're just starting out, and it's free for a year for new AWS accounts. Alternatively, a fresh install of ubuntu on a home machine will probably work, but it's untested. 

2. ssh to said machine

3. sudo su -

4. wget https://raw.githubusercontent.com/xelfer/nZEDbgo/master/go.sh

5. bash go.sh 

6. Browse to http://your-server-ip/

You should see: ![nZEDb config page](http://note.io/U03IuC)

7. Follow the buttons "Go to step one" and then on the next page "go to step two". 

8. Enter the following: ![nZEDb db config](http://note.io/U04BTN)

9. "Go to step 3" then enter in your news server details. If you need one I recommend [usenetbucket](https://www.usenetbucket.com/en-r/?u=28679). Complete this by scrolling down and clicking "Test Primary Connection".

10. The final step is something about local account creation. do that.  

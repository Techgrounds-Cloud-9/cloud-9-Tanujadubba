firewalls.md
# Firewall
 A firewall is a network security device that monitors and filters incoming and outgonig network traffic based on on an oraganizations previously establised security policies.
 > For ubuntu the standard fire wall is UFW
 **Different types of fire wall**
 Packet filetering firewall
 ciruit level gateways
 Stateful inspection firewalls
 Application level gateways
 Next gen firewall
 # Exercise
 -I have already installed apache2 websevre for my previous assingnments.To chechk the status of the server i used *systemctl status apache2*command.
 By using you ip address and private port number you will be able to see the default page of the severe.

 [![alt text](../..00_includes/week2images/apache2web.png "apache2web")] 

 >To set the firewall for the web traffic , you have to use the command sudo ufw deny http


 [![alt text](../..00_includes/week2images/Sec2notworking.png "Sec2notworking")] 

 
 [![alt text](../..00_includes/week2images/Sec2port80deny.png "Sec2port80deny")] 

 # Overcomechallenges:
 I was able to  finish the exercise without any problems by using the commands.That's what i thought but i was not able to connect my vm.After few discusions with my team mates i still didnt get any solution.I thought if i cant login there is nothing to do from my end.For some time i was stuck then i trace back my steps,then i realize that when i enabled firewall,it
 blocks everyhing by default.I explained that to Shika.  

# Source
(https://www.compuquip.com/blog/types-firewall-architectures)
(https://www.forcepoint.com/cyber-edu/firewall)
(https://www.howtoforge.com/ufw-uncomplicated-firewall-on-ubuntu/#:~:text=You%20can%20use%20the%20%22delete,be%20deleted%2C%20allow%20or%20deny.&text=That%20command%20will%20delete%20the,yourself%20out%20of%20the%20server.)
(https://linuxways.net/ubuntu/how-to-configure-and-host-an-application-in-apache-web-server/)


# send_message_integration
Running on a mac OS based server or client, this allows the user to use a web page to submit iMessages / sms / mms etc.

files : 
send.php
sendMessage.applescript
send_sms.scpt - is a stand alone file that can be used to send sms and imessages either through the terminal command line or send them through script edior. - This script checks the closes service to the sender, incorporates it into the script and sends the message via two available services in apple messages - either sms or imessage. 


Send.php can be assessed in a browser allowing the user to send iMessage "sms/mms/etc" through a mahine with iMessage instaled. The form can be used to submit, or a url can be used to submit using $_GET

The script will then shell out and execeute sendMessage.aqpplescrtipt.

The server must be running OS and the iphone must have provided access to the mac in order to send.

If you require any support - please email me at david@mstone.com.au 
David Sparrius

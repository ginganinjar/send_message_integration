# send_message_integration
Running on a mac OS X based server, this allows the user to use a web page to submit iMessages / sms / mms etc.

files : 
send.php
sendMessage.applescript

Send.php can be assessed in a browser allowing the user to send iMessage "sms/mms/etc" through a mahine with iMessage instaled. The form can be used to submit, or a url can be used to submit using $_GET

The script will then shell out and execeute sendMessage.aqpplescrtipt.

The server must be running OS and the iphone must have provided access to the mac in order to send.


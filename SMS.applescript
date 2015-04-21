on urldecode(theText)
	set sDst to ""
	set sHex to "0123456789ABCDEF"
	set i to 1
	repeat while i ² length of theText
		set c to character i of theText
		if c = "+" then
			set sDst to sDst & " "
		else if c = "%" then
			if i > ((length of theText) - 2) then
				display dialog ("Invalid URL Encoded string - missing hex char") buttons {"Crap..."} with icon stop
				return ""
			end if
			set iCVal1 to (offset of (character (i + 1) of theText) in sHex) - 1
			set iCVal2 to (offset of (character (i + 2) of theText) in sHex) - 1
			if iCVal1 = -1 or iCVal2 = -1 then
				display dialog ("Invalid URL Encoded string - not 2 hex chars after % sign") buttons {"Crap..."} with icon stop
				return ""
			end if
			set sDst to sDst & (ASCII character (iCVal1 * 16 + iCVal2))
			set i to i + 2
		else
			set sDst to sDst & c
		end if
		set i to i + 1
	end repeat
	return sDst
end urldecode


on open location this_url

	set x to the offset of "?" in this_url
	set the argument_string to text from (x + 1) to -1 of this_url
	set AppleScript's text item delimiters to "&"
	set these_arguments to every text item of the argument_string
	set AppleScript's text item delimiters to ""
	
	-- PROCESS ACTIONS
	-- This loop will execute scripts located within the Resources folder
	-- of this applet depending on the key and value passed in the URL
	repeat with i from 1 to the count of these_arguments
		set this_pair to item i of these_arguments
		set AppleScript's text item delimiters to "="
		copy every text item of this_pair to {this_key, this_value}
		set AppleScript's text item delimiters to ""
		
		
		if this_key is "sendsms" then
			display dialog "we seem to be here"
			
			if this_value is "1" then
				display dialog "The passed URL is:" & return & return & this_url buttons {"OK"} default button 1 with title "Webpage Helper" with icon 1
			else if this_value is "2" then
				if my load_run("Reveal This Application.scpt") is false then error number -128
			else if this_value is "3" then
				if my run_scriptfile("Make Helper Folder.scpt") is false then error number -128
			else if this_value begins with "4!-" then
				set the target_URL to text 4 thru -1 of this_value
				if my load_run("Import Image.scpt", target_URL) is false then error number -128
			end if
		end if
	end repeat
end open location


on sendMessage(targetBuddyPhone, targetMessage)
	tell application "Messages"
		set targetService to 1st service whose service type = iMessage
		set targetBuddy to buddy targetBuddyPhone of targetService
		set theTextDec to urldecode(targetMessage) of me
		send theTextDec to targetBuddy
	end tell
	
end sendMessage


on run
	display dialog "This script applet will respond to webpage links beginning with:" & return & return & "crm.mstone.com.au/sms://" buttons {"OK"} default button 1 with title "Webpage Helper" with icon 1
	tell application "Finder" to update (path to me)
end run

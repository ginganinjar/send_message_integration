<?php

/**
 * David Sparrius
 * Send imessages from webpage using php get command
 * and execute applescript - must be run on machine with mac osx to work.
 * @author David Sparrius - davesparrius@icloud.com
 */


// error reporting coz - well, you make mistakes.
//error_reporting(E_ALL);
//ini_set("display_errors", 1);

function escape($value) {
    $return = '';
    for($i = 0; $i < strlen($value); ++$i) {
        $char = $value[$i];
        $ord = ord($char);
        if($char !== "'" && $char !== "\"" && $char !== '\\' && $ord >= 32 && $ord <= 126)
            $return .= $char;
        else
            $return .= '\\x' . dechex($ord);
    }
    return $return;
}

$message = null;
$recipientnumber = null;


if(!empty($_GET["number"])) {$recipientnumber = strip_tags($_GET["number"]);
$recipientnumber = escape($recipientnumber);}

if(!empty($_GET["message"])) {
$message         = strip_tags($_GET["message"]);
$message         = escape($message);
$message = urlencode($message); }


  if((isset($_GET["message"])) && (isset($_GET["number"]))) {


	echo 'TO :'.urldecode($recipientnumber).' MESSAGE: '.urldecode($message).'</BR>';	
	shell_exec('osascript sendMessage.applescript '.$recipientnumber.' '.$message.' ');

	echo "Done </BR>".PHP_EOL;
	echo "<a href='/send.php'>Send another message </a>";

} else {
	?>
	<form action="/send.php">
																					</BR>
																						<b>Use value "number" for recipient number and value "message" for recipient message.</b></BR></BR>
																						For example</BR>
																						send.php?number="0408431992"&message="hello+bla+bla+bla";</BR>
																							</BR>

																																	Recipient Number:<br>
																																	<input type="text" name="number" value="<?php echo $recipientnumber ?>">
																																	<br>
																																	Message:<br>


																													<textarea rows="4" cols="50" name="message" value="<?php echo $message ?>"></textarea>
																														</BR>
																																	<input type="submit" value="Submit">

																																	</form>

	<?
}

?>
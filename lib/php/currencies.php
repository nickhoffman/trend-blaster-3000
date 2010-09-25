<?php
	$url = 'http://graupel.oanda.com:8081/v1/rate/list_symbols.json';

	$headers = array( 
        "Cache-Control: no-cache", 
        "Pragma: no-cache"
    ); 
    
    $ch = curl_init();
			
	curl_setopt($ch, CURLOPT_URL, $url);
	curl_setopt($ch, CURLOPT_HTTPHEADER, $headers); 
	curl_setopt($ch, CURLOPT_POST, false);
	curl_setopt($ch, CURLOPT_FOLLOWLOCATION, true);
	curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
	curl_setopt($ch, CURLOPT_CONNECTTIMEOUT, 15);
	curl_setopt($ch, CURLOPT_HEADER, false);
	curl_setopt($ch, CURLOPT_VERBOSE, false);
	//curl_setopt($ch, CURLOPT_STDERR, $fh);
	
	$content = curl_exec($ch);
	$response = curl_getinfo($ch);
	
	curl_close($ch);
	
	$oanda_data = json_decode($content);
	
	print_r($oanda_data);
?>
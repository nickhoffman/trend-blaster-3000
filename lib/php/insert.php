<?php
	$currency = 'AUD/USD';
	$currency_id = 8;
	$int_reversevalue = 0;
	$url = 'http://graupel.oanda.com:8081/v1/rate/history.json?symbol=' . $currency . '&granularity=86400&points=500';

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
	
	print_r($response);
	
	$oanda_data = json_decode($content);
	
	//print_r($oanda_data);
	
	$fp = fopen('pricepoints.sql', 'w');
	
	for ($i = 0; $i < (sizeof($oanda_data->price_points) - 1); $i++) {
		$date_bid = $oanda_data->price_points[$i]->time;
		$value = $oanda_data->price_points[$i]->close_bid;
		
		if ( $int_reversevalue == 1 ) { 
			$value = 1 / $value;
		}
		
		$str = "INSERT INTO currency_values (value, date_bid, currency_id, created_at, updated_at) VALUES ('" . $value . "', FROM_UNIXTIME('" . $date_bid . "'), '" . $currency_id . "', NOW(), NOW());\n";

		fwrite($fp, $str);
	}
	
	fclose($fp);
?>
<?php
$api_key = get_auth_key(); 
$channel = get_channel(); 
$max_results = 10;
$url = "https://www.googleapis.com/youtube/v3/search?key=$api_key&channelId=$channel&part=id&maxResults=$max_results&format=json";
$response = file_get_contents($url);
$response_ds = json_decode($response,true);

if(isset($response_ds['error']))
 echo "error";
else
{
	$vid_list = $response_ds['items'];
	foreach($vid_list as $vid)
	{
		$vid_id = $vid['id']['videoId'];
		$vid_url = "https://youtube.com/watch?v=$vid_id";
		$yt_download = "youtube-dl -o vid $vid_url; castnow vid";
		system($yt_download);
	}
}

function get_channel($row = 0)
{
	$channels = parse_ini_file("channels.ini");
	if(!isset($channels['channel_list']))
	{
		echo "No channel found to play.";
		exit();
	}
	$channel_list = $channels['channel_list'];
	$channel_list = explode(",",$channel_list);
	var_dump($channel_list);
 	if(isset($channel_list[$row]))
		return $channel_list[$row];
	else
		return $channel_list[0];
}

function get_auth_key()
{
	$auth = parse_ini_file("auth.ini");
	if(!isset($auth['api_key']))
	{
		echo "No API key found";
	 	exit();	
	}
	$api_key = $auth['api_key'];
 	return $api_key;	
}
?>

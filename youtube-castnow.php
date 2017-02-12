#!/usr/bin/php
<?php
require_once __DIR__.'/vendor/autoload.php';

try
{
	(new Dotenv\Dotenv(__DIR__))->load();
}
catch (Dotenv\Exception\InvalidPathException $e)
{
	die("Unable to load .env");
}


$api_key = getenv('API_KEY'); 
$channel = get_channel_playlist(); 
if(file_exists("vid"))
	@unlink('vid');
$vid_id = get($channel[0],$channel[1]);
if($vid_id == false)
	die("Failed to get Video url");
$vid_url = "https://youtube.com/watch?v=$vid_id";
$yt_download = "youtube-dl -o vid $vid_url; castnow vid";
//system($yt_download);
echo $yt_download;

function get_channel_playlist($row = 0)
{
	$list = 'CHANNEL_LIST';
	if(getenv('CHANNEL_LIST') == '')
	{
		if(getenv('PLAY_LIST') == '')
			die("No channel of playlist given in .env");
		else
			$list = 'PLAY_LIST';
	}
	$channel_list = getenv($list);
	$channel_list = explode(",",$channel_list);
	if($list == 'CHANNEL_LIST')
		$list = 'channel';
	else
		$list = 'playlist';
 	if(isset($channel_list[$row]))
		return array($channel_list[$row], $list);
	else
		return array($channel_list[0], $list);
}

function get($id = '',$type = 'channel')
{
	$max_results = getenv('MAX_RESULTS');
	$api_key=getenv('API_KEY');
	$url = "https://www.googleapis.com/youtube/v3/search?key=$api_key&".$type."Id=$id&part=id&maxResults=$max_results&format=json";
	$response = file_get_contents($url);
	$response_ds = json_decode($response,true);
	$start = rand(1,$max_results);

	//echo $url; exit();

	if(isset($response_ds['error']))
		return false; 
	else
	{
		$items = $response_ds['items'];
		foreach($items as $row => $vid)
		{
			if($start > $row)
			  continue;
			if($type == 'channel')
			{
				$item = $vid['id']['playlistId'];
				$item = get($item,'playlist');
			}
			else
				$item = $vid['id']['videoId'];
			return $item;
		}
	}

}

?>

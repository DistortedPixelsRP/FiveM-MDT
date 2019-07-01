<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
<?php

function steamAvatar($SteamID) {
        $SteamAPI_KEY = "5983858A0DEB07846F46D2D2386E89BA";
        //$SteamID = "76561198164179083";
	
	$Name = "Player Name";
	$Avatar  = 'img/noavatar.jpg';
	/*
	if (isset($_GET['steamid'])) 
	{
            */
		$SteamAPI = 'http://api.steampowered.com/ISteamUser/GetPlayerSummaries/v0002/?key=' . $SteamAPI_KEY . '&steamids=' . $SteamID;
		
		$SteamAPI_Returned = file_get_contents($SteamAPI);
		
		$steamAPI = json_decode($SteamAPI_Returned, true);
		
		if (isset($steamAPI['response']['players'][0]['personaname']))
		{
			$Name = $steamAPI['response']['players'][0]['personaname'];
		}
		
		if (isset($steamAPI['response']['players'][0]['avatarfull']))
		{
			$Avatar = $steamAPI['response']['players'][0]['avatarfull'];
		}
                
                return $Avatar;
}
	//}

$string = "11000010c27788b"; // == 245 in base 10  

echo base_convert($string, 16, 10);  

?>
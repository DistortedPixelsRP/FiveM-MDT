/*


  ____    _       _____      _      ____    _____     ____     ___      _   _    ___    _____     _____    ___    _   _    ____   _   _ 
 |  _ \  | |     | ____|    / \    / ___|  | ____|   |  _ \   / _ \    | \ | |  / _ \  |_   _|   |_   _|  / _ \  | | | |  / ___| | | | |
 | |_) | | |     |  _|     / _ \   \___ \  |  _|     | | | | | | | |   |  \| | | | | |   | |       | |   | | | | | | | | | |     | |_| |
 |  __/  | |___  | |___   / ___ \   ___) | | |___    | |_| | | |_| |   | |\  | | |_| |   | |       | |   | |_| | | |_| | | |___  |  _  |
 |_|     |_____| |_____| /_/   \_\ |____/  |_____|   |____/   \___/    |_| \_|  \___/    |_|       |_|    \___/   \___/   \____| |_| |_|
                                                                                                                                        


*/

var currentVersion = "2.0";

var getJSON=function(url,callback){var xhr=new XMLHttpRequest();xhr.open('GET',url,true);xhr.responseType='json';xhr.onload=function(){var status=xhr.status;if(status===200){callback(null,xhr.response);}else{callback(status,xhr.response);}};xhr.send();};console.log('%cHey you! Hold up, wait a second!\n%cThe console is for developer and server owner use only!\n%cAre you interested in this project? Visit the developer at https://bennyfaelz.com/','color: red; -webkit-text-stroke: 1.5px black; font-size:4em; font-weight: 600;','color: black; font-size:2em; font-weight: 600;','color: black; font-size:1.5em; font-weight: 600;');getJSON('https://bennyfaelz.com/mdt/webVersionCheck.json',function(err,data){if(err!==null){console.log('Something went wrong: '+err);}else{if(currentVersion===data.latestVersion){console.log('Web MDT is running version '+data.latestVersion+' and is up to date.');}else{console.log('Web MDT is running an OUTDATED version ('+currentVersion+')! Please update to the latest version ('+data.latestVersion+') for more features, bug fixes and support.');console.log('Download: '+data.downloadURL);if(data.changes!==""){console.log('Changes: '+data.changes);}} if(data.extraInfo!==""){console.log(data.changes);}}});
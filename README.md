<p align="center">
<h1 align="center">FiveM MDT</h1>
<h3 align="center">By Benny F</h3>
</p>

I have decided that the MDT is ready to be released! Please follow the instructions below.


## Features
- In game character selection system
- In game ID card system
- In game vehicle registration system
- Web admin panel
- Built in automatic server restart
- Multiple server support
- Built in divisions and departments
- Person and plate search
- Built in AOP
- Dispatch dashboard
- Easy call creation
- Easy to use interface
- Easy setup
- Optional require account creation code (for private communities)

### Pictures
<details>
     <summary>Show/Hide</summary>
  
  ### Login
  ![Login](https://i.imgur.com/neKVkUX.png)
    
  ### Create Account
  ![Create](https://i.imgur.com/E997Dp4.png)
      
  ### Departments
  ![Departments](https://i.imgur.com/BOznQNf.png)
        
  ### Law Enforcement Divisions
  ![Departments](https://i.imgur.com/iUNfiD4.png)
  
  ### Law Enforcement Call
  ![Call](https://i.imgur.com/rFD1Ua6.png)
  
  ### Law Enforcement Name Search
  ![Search](https://i.imgur.com/iPrE2Ts.png)
    
  ### Law Enforcement Citation
  ![Ticket](https://i.imgur.com/Z5GvBRg.png)
      
  ### Law Enforcement Dispatch
  ![Dispatch](https://i.imgur.com/Z5GvBRg.png)
  
  ### Civilian
  ![Civilian](https://i.imgur.com/UCwNLdE.png)
        
  ### Admin Pannel Server List
  ![Admin1](https://i.imgur.com/Ar8zZXe.png)
          
  ### Admin Pannel Server Options
  ![Admin2](https://i.imgur.com/VHc0sFG.png)
            
  ### Admin Pannel User Controls
  ![Admin3](https://i.imgur.com/6PReeiw.png)
              
  
</details>

### Upcoming Features
- More Essentialmode compatibility
- Utilization of ES and ESX
- Improved UI
- Revamped Civilian Department
- More admin features

## Requirements
- MySQL server
- Web server w/ latest version of PHP
- FiveM Server
     - [mysql-async](https://github.com/brouznouf/fivem-mysql-async)

## How To install
This section is divided into 3 parts:
- [MySQL](https://github.com/BennyFaelz/FiveM-MDT/blob/master/README.md#mysql)
- [FiveM](https://github.com/BennyFaelz/FiveM-MDT/blob/master/README.md#fivem)
- [Website](https://github.com/BennyFaelz/FiveM-MDT/blob/master/README.md#website)

### MySQL
1. Open a program like [HeidiSQL](https://www.heidisql.com/) and login to your MySQL server

2. Create a new database and name it something simple. For example "mdt"

3. Import `mbt.sql` into the new database

4. Verify everything imported correctly and continue to the next section

### FiveM
1. Open the `fivem` folder from the download

2. Copy start `server.bat` into the same folder as `FXServer.exe` and `run.cmd`

3. Right click on start `server.bat` and select edit

4. Change the two locations to the proper ones for your server and edit the server id if needed then save the file

5. Open the `fivem` folder from the download again and copy the mdt folder into your FiveM server's  resource folder

     - **Important:** Do **not** rename the `mdt` folder because it will not work.
     
6. Download [mysql-async](https://github.com/brouznouf/fivem-mysql-async) if you have not already and follow the [installation](https://github.com/brouznouf/fivem-mysql-async#installation) instructions

7. Open your `server.cfg` and add `start mdt`, `start mysql-async`, and `set mysql_connection_string "server=<IP>;uid=<Username>;password=<Password>;database=<database>"`
     - **Important:** Make sure `set mysql_connection_string` is above `start mysql-async`
     
### Website
1. Open the `web` folder from the download

2. Copy `mdt` into your webserver

3. Open the `mdt` folder thats inside your webserver and edit the file `settings.php`

4. Follow the instructions inside the file

### Done
You are almost done! Open up HeidiSQL and go to the server table. In the `ip` column enter your FiveM server's [public IPv4](https://www.whatismyip.com/). In the `port` column enter your FiveM server's port (default port is 30120). Next, start your FiveM server using `start server.bat`. Now when you open your MBT login page you will see when you click on the server selector that one server is server online.

To become admin and use the admin panel open HeidiSQL and select the users table. In the row with your account set the admin column to any number greater than 0. Currently the only way to get to the pannel is by typing in the url: `<your mdt login page url>/admin`. (ex. `bennyfaelz.com/mdt/admin/`)

### FiveM Commands
- `/link` used to link your FiveM and MDT account. When logging in for the first time it will ask to link to your FiveM
- `/unlink` used to unlink your FiveM from your MDT account
- `/giveID` hands your ID to the nearest player
- `/returnID` if you are holding someone elses ID, it gives it back to them
- `/resetID` forcefully gives you your ID back
- `/register` registers the vehicle you are in to your current character
- `/me <message>` sends your message to only the players in the radius
- `/changeCharacter` opens up the character selection screen
- `setRestartTime <hh> <mm>` used in the server console to set the restart time of the server

### Troubleshooting
###### Nothing showing up in server dropdown list
- You did not change the IP and/or port in the database
- The FiveM server is not running
- You are not using the servers [public IP](https://www.whatismyip.com/) or the FiveM server is not port forwarded

###### No connection could be made because the target machine actively refused it.
- Your MySQL is not running
- You did not set the settings.php file up correctly

###### \[ERROR\] connect ECONNREFUSED \<ip\>:\<port\>
- Your MySQL is not running
- mysql_connection_string is not set up correctly

###### Infinite Checking...
- Your MySQL is not running
- mysql_connection_string is not set up correctly
- Make sure your using the latest version.

### Known Bugs/Issues
- All department/divison pics have to be .png
- If one of the FiveM servers in the DB are offline the login and admin pages might have longer loading times.
- Servers not showing up. Fix: Change allow_url_fopen in your php.ini to On 
- Suspending users in the admin panel does not work. No fix, I'm just dumb and forgot to finish it before release lol.

### Suggestions and Support
Join the discord
https://discord.gg/E8k92YY

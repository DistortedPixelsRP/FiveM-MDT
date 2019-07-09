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

## Requirements
- MySQL server
- Web server
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

4. Change the two locations to the proper ones for your server then save the file

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
You are almost done! Open up HeidiSQL and go to the server table. In the `ip` column enter your FiveM server's public IP. In the `port` column enter your FiveM server's port (default port is 30120). Now when you open your MBT login page you will see when you click on the server selector that one server is server online.

To become admin and use the admin panel (example.com/mdt/admin) open HeidiSQL and select the users table. In the row with your account set the admin column to any number greater than 0. 

### Suggestions and Support
Join the discord
https://discord.gg/E8k92YY

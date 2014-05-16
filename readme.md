TOERH - WEB API
===============

## Instructions
### Backend
Both the "Registration site" and the "Web-API" folder has a .bat file named startup which will boot up each server respectively. I recommend starting the registration site first.

Otherwise, in the folder *Registration site* is the web application where a user can register as a developer and recieve an API key. This needs to be running in order for the web API to function properly since we query this application for the API key to verify that it's valid. As of now it should be running on the same machine as the API server and it should listen to the port 3002. To set port start the server with *rails s --port=3002* in your terminal.

In the second folder, *Web-API* is the actual web API. This should run on the default port of 3000 but it shouldn't matter.

It should also be noted that there's a link pointing to the documentation on the registration site but that one is broken as the GitHub repo is private (where the documentation lies) but the same file is also included here.

### Front-end
I decided not to use either Node.js, grunt or anything like that so the front-end application is pretty much straight forward. You will need a webserver in order to run it without changing the script-tags that uses "//" instead of "http://".

## Changes made to the web API
* Minor bug fixes.
* Added rack-cors.
* Added a login/logout controller.
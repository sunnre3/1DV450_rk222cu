TOERH - WEB API
===============

# Readme

In the folder *Registration site* is the web application where a user can register as a developer and recieve an API key. This needs to be running in order for the web API to function properly since we query this application for the API-key to verify that it's valid. As of now it should be running on the same machine as the API server and it should listen to the port 3002. To set port start the server with *rails s --port=3002* in your terminal.

In the second folder, *Web-API* is the actual web API. This should run on the default port of 3000 but it shouldn't matter.

It should also be noted that there's a link pointing to the documentation on the registration site but that one is broken as the GitHub repo is private (where the documentation lies) but the same file is also included here.
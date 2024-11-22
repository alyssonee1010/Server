# Seminar Arbeit, DDOS Attack Mitigation

## Installation

First run `npm install` to install the packages for the API Call

## Starting server and Frontend

to start the server run `node tcp-server.js` 

in other terminal run `node index.js` to start the frontend

Now you can go in your browser to `http:localhost:3000`

## Attacking

In a third terminal go to the folder slowloris with `cd slowloris` and now to start the attack run the command:
`python3 slowloris.py localhost -p 8080 -s 100000 --sleeptime 2`


-s: sockets, the more sockets more powerful the attack is.
--sleeptime is in seconds how often the flood should be sent

## Requirements

To be able to run this code you need to have Python and Node install in your machine


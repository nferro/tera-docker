#!/bin/sh
node set port:$NODE_PORT httpport:$PORT password:$PASSWORD
node run-node.js

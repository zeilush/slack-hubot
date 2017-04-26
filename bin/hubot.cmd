@echo off

call npm install
SETLOCAL
SET HUBOT_SLACK_TOKEN=xoxb-171228128566-0GHGlMhEXvOpu5KmtdS2OyPv
SET PATH=node_modules\.bin;node_modules\hubot\node_modules\.bin;%PATH%

node_modules\.bin\hubot.cmd --name "wk_bot" %* 

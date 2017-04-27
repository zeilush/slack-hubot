# Description:
#   Example scripts for you to examine and try out.
#
# Notes:
#   They are commented out by default, because most of them are pretty silly and
#   wouldn't be useful and amusing enough for day to day huboting.
#   Uncomment the ones you want to try and experiment with.
#
#   These are from the scripting documentation: https://github.com/github/hubot/blob/master/docs/scripting.md

module.exports = (robot) ->

  robot.respond /-\?/i, (res) ->
    r = "Here is a list of all services i offer:\n"
    r += "\n"
    r += "*STATUS:*\n"
    r += "is alive [SELECTOR]\n"
    r += "\n"
    r += "*JENKINS:*\n"
    r += "jenkins list\n"
    r += "jenkins deploy [JOBNAME]\n"
    r += "jenkins describe [JOBNAME]\n"
    r += "jenkins last [JOBNAME]\n"
    r += "j d [INTERNAL_ID]\n"
    r += "\n"
    r += "*GRAFANA:*\n"
    r += "graf list\n"
    r += "graf db|dashboard [DASHBOARDNAME](:[WIDGETNAME])\n"
    r += "\n"
    r += "*GITLAB:*\n"
    r += "git petclinic commits [AMOUNT]\n"
    res.send(r)

  robot.respond /git petclinic commits ([0-9]*)/i, (res) ->
    if res.match && res.match[1]
      amount = res.match[1]
      robot.http('https://api.github.com/repos/zeilush/slack-app/commits').get() (err, serverRes, body) ->
        body = JSON.parse(body);
        if (amount > body.length)
          amount = body.length

        for i in [0...amount]
          commit = body[i].commit
          r = "MESSAGE: #{commit.message} \n"
          r += "SHA: #{commit.tree.sha} \n"
          r += "URL: #{commit.url} \n"
          r += "DATE: #{commit.author.date} \n"
          r += "NAME: #{commit.author.name} \n"
          r += "----------------------------\n"
          res.send(r)


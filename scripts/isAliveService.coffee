urlStorage = {
  google: 'http://www.google.de',
  petshop: 'https://slack-it-petclinic.herokuapp.com/'
}

module.exports = (robot) ->
  robot.hear /is alive (.*)/i, (res) ->
    selector = res.match[1]

    if urlStorage.hasOwnProperty(selector)
      res.http(urlStorage[selector])
      .get() (err, serverRes, body) ->
        if serverRes.statusCode isnt 200
          res.send "Request didn't come back HTTP 200 :("
          return

        res.send "Yolo " + urlStorage[selector]
    else
      res.send "wrong selector :("
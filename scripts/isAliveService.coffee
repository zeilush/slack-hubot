urlStorage = {
  google: 'http://www.google.de',
  petclinic: 'https://slack-it-petclinic.herokuapp.com/'
}

module.exports = (robot) ->
  robot.respond /is alive(.*)?/i, (res) ->
    selector

    if res.match[1]
      selector = res.match[1].replace(' ','')

    if urlStorage.hasOwnProperty(selector)
      res.http(urlStorage[selector])
      .get() (err, serverRes, body) ->
        if serverRes.statusCode isnt 200
          res.reply "Request didn't come back HTTP 200 :("
          return

        res.reply "It's alive " + urlStorage[selector]
    else
      selectors = ''
      for prop of urlStorage
        if urlStorage.hasOwnProperty(prop)
          selectors +=  ( prop + ' ' )

      res.reply "Didn't recognize the selector, please use one of the following: #{selectors}"
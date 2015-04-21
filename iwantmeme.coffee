# Description:
#   Get a random meme from open api
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   meme me

module.exports = (robot) ->
  robot.respond /i want meme$/i, (msg) ->
    getMemes msg, (meme) ->
      msg.send meme

  getMemes = (msg, cb) ->
    msg.http('http://version1.api.memegenerator.net/Instances_Select_ByPopular?languageCode=en&pageIndex=0&pageSize=24&urlName=&days=1')
      .get() (err, res, body) ->
        memes = JSON.parse(body)
        meme = memes.result[Math.floor(Math.random() * memes.result.length)];
        memeUrl = meme.instanceImageUrl;
        cb memeUrl

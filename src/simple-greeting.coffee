# Description
#   A simple hubot script that gives your robot some friendly greetings
#
# Configuration:
#   HUBOT_SIMPLE_GREETING_SLACK - true or false
#
# Commands:
#   hubot howdy|hallo|hey|hi|hello|yo|good day
#   "Well hello there <person>! :grinning:",
#
# Notes:
#   <optional notes required for the script>
#
# Author:
#   Paul Theurer <paultheurer@gmail.com>

module.exports = (robot) ->
  greetings = require('../data/greetings.json');
  hellos = greetings.hubot.hellos
  mornings = greetings.hubot.mornings
  evenings = greetings.hubot.evenings

  # hubot is running on slack, so jazz up those messages a little bit
  if process.env.HUBOT_SIMPLE_GREETING_SLACK == true
    hellos = greetings.slack.hellos
    mornings = greetings.slack.mornings
    evenings = greetings.slack.evenings

  robot.respond /(howdy|hallo|hey|hi|hello|yo|good day)/i, (res) ->
    message = res.random hellos
    res.send message.replace "%", '@' + res.message.user.name

  robot.respond /(morning|good morning|mornin)/i, (res) ->
    message = res.random mornings
    res.send message.replace "%", '@' + res.message.user.name

  robot.respond /(good evening|evening|night)/i, (res) ->
    message = res.random evenings
    res.send message.replace "%", '@' + res.message.user.name

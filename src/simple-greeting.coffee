# Description
#   A simple hubot script that gives your robot some friendly greetings
#   Pass in `HUBOT_SIMPLE_GREETING_SLACK` (true) to have jazzy messages just for Slack!
#
# Configuration:
#   HUBOT_SIMPLE_GREETING_SLACK
#   Pass true if using Slack, leave it out otherwise
#
# Commands:
#   hubot howdy|hallo|hey|hi|hello|yo|good day
#   "Well hello there <person>! :grinning:"
#
# Notes:
#   Update data/greetings.json to add your own custom greeting messages
#   (If you update these, check the tests too)
#
# Author:
#   Paul Theurer <paultheurer@gmail.com>

module.exports = (robot) ->
  greetings = require('../data/greetings.json');

  # if hubot is running on slack, jazz up those messages a little bit
  if process.env.HUBOT_SIMPLE_GREETING_SLACK
    hellos = greetings.slack.hellos
    mornings = greetings.slack.mornings
    evenings = greetings.slack.evenings
  else
    hellos = greetings.hubot.hellos
    mornings = greetings.hubot.mornings
    evenings = greetings.hubot.evenings

  robot.respond /(howdy|hallo|hey|hi|hello|yo|good day)/i, (res) ->
    message = res.random hellos
    res.send message.replace "%", '@' + res.message.user.name

  robot.respond /(morning|good morning|mornin)/i, (res) ->
    message = res.random mornings
    res.send message.replace "%", '@' + res.message.user.name

  robot.respond /(good evening|evening|night)/i, (res) ->
    message = res.random evenings
    res.send message.replace "%", '@' + res.message.user.name

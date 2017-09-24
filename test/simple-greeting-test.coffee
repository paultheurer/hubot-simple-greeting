Helper = require('hubot-test-helper')
chai = require 'chai'

expect = chai.expect

helper = new Helper('../src/simple-greeting.coffee')
hellos = ["Well hello there @cake!", "Hey @cake :)", "Alrighty @cake! ;)", "Lookin' good @cake!", "Howdy @cake"]
mornings = ["Good morning @jaffa!", "And a good morning to you too @jaffa!", "Morning @jaffa. Time for coffee?"]
nights = ["Cheerio @oreo - have a fantastical evening!", "Sleep tight... Don't let them bed bugs bite!",
  "Night night... Zzz...", "Have a good one @oreo!"]
describe 'simple-greeting', ->
  beforeEach ->
    @room = helper.createRoom()

  afterEach ->
    console.log(@room.messages)
    @room.destroy()

  it 'responds to hello', ->
    @room.user.say('cake', '@hubot hello').then =>
      expect(@room.messages[0]).to.eql(['cake', '@hubot hello'])
      expect(@room.messages[1][1]).to.satisfy((str) => hellos.indexOf(str) > -1)


  it 'responds to good morning', ->
    @room.user.say('jaffa', '@hubot good morning').then =>
      expect(@room.messages[0]).to.eql(['jaffa', '@hubot good morning'])
      expect(@room.messages[1][1]).to.satisfy((str) => mornings.indexOf(str) > -1)


  it 'responds to good night', ->
    @room.user.say('oreo', '@hubot night').then =>
      expect(@room.messages[0]).to.eql(['oreo', '@hubot night'])
      expect(@room.messages[1][1]).to.satisfy((str) => nights.indexOf(str) > -1)

# hubot-simple-greeting

A simple hubot script that gives your robot some friendly greetings.
Pass in `HUBOT_SIMPLE_GREETING_SLACK` (true or false) to have jazzy messages just for Slack!

See [`src/simple-greeting.coffee`](src/simple-greeting.coffee) for full documentation.

## Installation

In hubot project repo, run:

`npm i -S hubot-simple-greeting`

Then add **hubot-simple-greeting** to your `external-scripts.json`:

```json
[
  "hubot-simple-greeting"
]
```

## Sample Interaction

```
> hubot howdy|hallo|hey|hi|hello|yo|good day
> Well hello there <person>! :grinning:
```

## NPM Module

https://www.npmjs.com/package/hubot-simple-greeting

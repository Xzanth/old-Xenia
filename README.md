# XENIA
The [pugbot](https://github.com/Xzanth/pugbot) that is ran on
[#midair.pug](irc://irc.quakenet.org:6667/#midair.pug) for organising pick up
games of [midair](https://www.playmidair.com).

## Usage
Install the requirements with:

`bundle install`

and then start the bot with:

`bundle exec bin/xenia`

By default xenia will look for a config file: config.yml wherever you are
running the bot. You can specifiy a specific config file by using the
`-c/--config` flag as follows

`bundle exec bin/xenia --config testing.config.yml`

Notice the config files in the repo: testing.config.yml and
production.config.yml rely upon environment variables for the auth passwords and
slack api keys.

## Contributing
Most of the relevant code can be found in the
[pugbot](https://github.com/Xzanth/pugbot) repository, so please submit any
issues or other contributions there unless they are specifically relevant to
this repo.

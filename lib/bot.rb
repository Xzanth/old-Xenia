dir = File.dirname(__FILE__)
$LOAD_PATH.unshift(dir) unless $LOAD_PATH.include? dir

require "cinch"
require "cinch/commands"
require "cinch/plugins/identify"
require "cinch/plugins/integrate"
require "cinch/plugins/auth-autovoice"
require "dm-sqlite-adapter"
require "dm-migrations"
require "yaml"
require "pugbot"
begin
  require "dm-postgres-adapter"
rescue LoadError
  warn "Postgres adapter gem missing"
end

def start_bot(config)
  bot = Cinch::Bot.new do
    configure do |c|
      c.plugins.plugins = [
        Cinch::Plugins::Identify,
        Cinch::Commands::Help,
        PugBot::BotPlugin,
        Cinch::Plugins::Integrate,
        Cinch::Plugins::AuthAutovoice
      ]
      c.plugins.options[Cinch::Plugins::Identify] = {
        username: config["username"],
        password: config["password"],
        type:     config["auth"]
      }
      c.plugins.options[PugBot::BotPlugin] = {
        channel:   config["pug_channel"],
        integrate: config["integrate"],
        link:      config["link"]
      }
      c.plugins.options[Cinch::Plugins::Integrate] = {
        integrations:     config["integrations"],
        slack_key:        config["slack_key"]
      }
      c.plugins.options[Cinch::Plugins::AuthAutovoice] = {
        channels:           config["channels"],
        wait_until_opped:   config["wait_until_opped"],
        check_periodically: config["check_periodically"]
      }
      c.plugins.options[Cinch::Commands::Help] = {
        help_response: config["help_response"]
      }
      c.nick       = config["nick"]
      c.realname   = config["realname"]
      c.user       = config["user"]
      c.server     = config["server"]
      c.channels   = config["channels"]
      c.local_host = config["local_host"]
    end
  end

  args = ""
  if config["db_type"] == "sqlite"
    args = File.expand_path(config["db_file"])
  else config["db_type"] == "postgres"
    args << "#{config['db_user']}:#{config['db_password']}"
    args << "@#{config['db_host']}/#{config['db_name']}"
  end
  DataMapper.setup(:default, "#{config['db_type']}://#{args}")
  DataMapper.auto_upgrade!
  bot.start
end

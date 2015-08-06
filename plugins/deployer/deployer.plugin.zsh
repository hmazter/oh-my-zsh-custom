_deployer_bin () {
  echo "php $(find . -maxdepth 3 -mindepth 1 -name 'dep' | head -n 1)"
}

# Deployer basic command completion
_deployer_get_command_list () {
	`_deployer_bin` --no-ansi | sed "1,/Available commands/d" | awk '/^ +[a-z]+/ { print $1 }'
}

_deployer_get_servers () {
	cat servers.yml | awk '/^[a-zA-Z]+/ { print $1 }'
}

_deployer () {
	if [ "$CURRENT" = "3" ]; then
       compadd `_deployer_get_servers`
    else
       compadd `_deployer_get_command_list`
    fi
}

#compdef _deployer deployer
compdef _deployer `./bin/dep`


#compdef _deployer_servers `./bin/dep deploy `

#Alias
#alias dep='deployer'
set :branch, 'master'
server '46.101.191.53', user: 'deploy', roles: %w{app db web}

set :ssh_options, {forward_agent: false}
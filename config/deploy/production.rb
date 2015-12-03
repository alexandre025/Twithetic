server '37.187.116.10', user: 'deployer', roles: %w{app db web}
set :port, 6060

set :default_env, { path: '~/.rbenv/shims:~/.rbenv/bin:$PATH'}
set :branch, 'master'

set :ssh_options, {
    forward_agent: true,
    auth_methods: %w(password),
    password: '',
    user: 'deployer',
    port: 6060
}

set :rails_env, :production
set :conditionally_migrate, true
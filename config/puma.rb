environment 'production'
daemonize false

pidfile 'puma/puma.pid'
state_path 'puma/puma.state'
threads 0, 16
bind 'unix://tmp/sockets/puma.sock'

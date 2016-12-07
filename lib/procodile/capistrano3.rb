namespace :procodile do
  desc 'Start procodile processes'
  task :start do
    on fetch(:procodile_roles, roles(:app)) do
      within current_path do
        with rails_env: fetch(:stage) do
          execute :bundle, :exec, procodile_command(:start)
        end
      end
    end
  end

  desc 'Stop procodile processes'
  task :stop do
    on fetch(:procodile_roles, roles(:app)) do
      within current_path do
        with rails_env: fetch(:stage) do
          execute :bundle, :exec, procodile_command(:stop)
        end
      end
    end
  end

  desc 'Restart procodile processes'
  task :restart do
    on fetch(:procodile_roles, roles(:app)) do
      within current_path do
        with rails_env: fetch(:stage) do
          execute :bundle, :exec, procodile_command(:restart)
        end
      end
    end
  end

  desc 'Status of procodile processes'
  task :status do
    on fetch(:procodile_roles, roles(:app)) do
      within current_path do
        with rails_env: fetch(:stage) do
          execute :bundle, :exec, procodile_command(:status)
        end
      end
    end
  end

  after 'deploy:finished', 'procodile:start'

  def procodile_command(command, options = '')
    binary = fetch(:procodile_binary, 'procodile')
    processes = fetch(:processes, nil)
    user = fetch(:procodile_user, nil)

    options = "-p #{processes} #{options}" if processes
    command = "#{binary} #{command} #{options}"

    user ? "sudo -u #{user} #{command}" : command
  end
end

require 'io/console'
require './database.rb'
require './conts.rb'
require './menu.rb'
require './utils.rb'
require './user.rb'

def add_new_service
  print "Enter the name of the service: "
  service_name = gets.chomp
  service_identifier = service_name.to_sym

  # if (!PASSWORD_VAULT.key?(service_name))
  #   PASSWORD_VAULT[service_name] = {}
  # end

  unless PASSWORD_VAULT.key?(service_name)
    PASSWORD_VAULT[service_identifier] = {}
  end

  print "Enter the username for #{service_name}: "
  service_username = gets.chomp
  PASSWORD_VAULT[service_identifier][:username] = service_username

  print "Enter the password for #{service_name}: "
  service_password = STDIN.noecho(&:gets).chomp
  PASSWORD_VAULT[service_identifier][:password] = service_password

  puts "Succesfully saved #{service_name}!"
end

def get_service
  print "Enter the name of the service you wish to access credential for: "
  requested_service_name = gets.chomp
  credentials = PASSWORD_VAULT[requested_service_name.to_sym]

  unless credentials == nil
    break_line
    puts "Here are the credentials for #{requested_service_name}: "
    break_line
    show_credentials(credentials)
  else
    puts "Service not found."
  end
end

def print_all_credentials
  PASSWORD_VAULT.each do |service, credentials|
    puts "The credentials for #{service.to_s}"
    show_credentials(credentials)
    break_line
  end
end

def show_credentials(credentials)
  credentials.each do |username, password|
    puts "#{username}: #{password}"
  end
end

def main
  user_selection = nil

  puts "Welcome to the authenticator"
  break_line

  username = prompt_username
  unless verify_username?(username)
    exit
  end

  password = prompt_password
  break_line
  unless verify_password?(password)
    exit
  end

  break_line
  puts "Welcome #{username}."
  break_line
  print_menu
  user_selection = gets.chomp

  loop do
    case user_selection
    when "1"
      add_new_service
      break_line
      print_menu
      user_selection = gets.chomp
    when "2"
      get_service
      break_line
      print_menu
      user_selection = gets.chomp
    when "3"
      print_all_credentials
      break_line
      print_menu
      user_selection = gets.chomp
    else
      puts "Closing the password manager..."
      user_selection = nil
      exit
    end
  end
end

main()

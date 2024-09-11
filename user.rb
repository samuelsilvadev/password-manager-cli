require './conts.rb'

def prompt_username
  print "Enter your username: "
  gets.chomp
end

def prompt_password
  print "Enter your password: "
  STDIN.noecho(&:gets).chomp
end

def verify_username?(username)
  if username == USERNAME
    puts "Valid username ✅"
    return true
  end

  if username.nil? or username.empty?
    puts "Username can't be empty"
  else
    puts "Invalid username 🚫"
  end

  return false
end

def verify_password?(password)
  if password.empty?
    puts "Password can't be empty"
    return false
  end

  # condition not thruthy
  unless password != PASSWORD
    puts "Valid password ✅"
    return true
  else
    puts "Invalid password 🚫"
    return false
  end

  # Alternative for the unless
  # elsif password == PASSWORD
  #   puts "Welcome #{username}."
  # else
  #   puts "Invalid password ❌"
  #   exit
  # end
end

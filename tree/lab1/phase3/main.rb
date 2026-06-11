require_relative 'event'
require_relative 'handler'
require_relative 'event_router'
require_relative 'handlers/console_handler'
require_relative 'handlers/file_handler'
require_relative 'handlers/stats_handler'
require_relative 'handlers/slack_handler'

router = EventRouter.new
console = ConsoleHandler.new
file = FileHandler.new
stats = StatsHandler.new
slack = SlackHandler.new

router.register(console)
router.register(file)
router.register(stats)
router.register(slack)

puts "=== LifeTrack ==="
puts "1. Log a work session"
puts "2. Log a study session"
puts "3. Log an exercise session"
puts "4. Log a meal"
puts "5. Exit"

loop do
  print "\nChoose an option: "
  input = gets
  break if input.nil?
  
  choice_str = input.chomp.strip
  unless choice_str.match?(/^\d+$/)
    puts "Invalid option. Please enter a number between 1 and 5."
    next
  end

  choice = choice_str.to_i

  case choice
  when 1..4
    description = ""
    loop do
      print "Description: "
      desc_input = gets
      break if desc_input.nil?
      description = desc_input.chomp.strip
      break unless description.empty?
      puts "Description cannot be empty."
    end
    break if description.empty?

    duration = 0
    loop do
      print "Duration (minutes): "
      dur_input = gets
      break if dur_input.nil?
      dur_str = dur_input.chomp.strip
      if dur_str.match?(/^\d+$/) && dur_str.to_i > 0
        duration = dur_str.to_i
        break
      end
      puts "Duration must be a positive integer."
    end
    break if duration == 0

    types = ["WORK", "STUDY", "EXERCISE", "MEAL"]
    type = types[choice - 1]

    event = Event.new(type, description, duration)
    router.dispatch(event)

  when 5
    puts "Goodbye!"
    break
  else
    puts "Invalid option. Please enter a number between 1 and 5."
  end
end
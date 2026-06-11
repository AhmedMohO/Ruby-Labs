class ConsoleHandler < Handler
  def handle(event)
    puts event.to_s
    puts "✓ Event logged."
  end
end
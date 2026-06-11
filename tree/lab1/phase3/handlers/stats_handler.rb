class StatsHandler < Handler
  def initialize
    @total_events = 0
    @total_duration = 0
    at_exit { print_summary }
  end

  def handle(event)
    @total_events += 1
    @total_duration += event.duration
  end

  private

  def print_summary
    puts "\n=== LifeTrack Summary ==="
    puts "Total events: #{@total_events}"
    puts "Total duration: #{@total_duration} minutes"
    puts "Average session: #{(@total_duration.to_f / @total_events).round(1)} minutes" if @total_events > 0
    puts "=========================="
  end
end
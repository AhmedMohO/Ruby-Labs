class Event
  attr_reader :type, :description, :duration, :timestamp

  def initialize(type, description, duration)
    @type = type.upcase
    @description = description
    @duration = duration.to_i
    @timestamp = Time.now
  end

  def to_s
    "[#{@timestamp.strftime('%Y-%m-%d %H:%M')}] #{@type} — #{@description} (#{@duration} min)"
  end
end
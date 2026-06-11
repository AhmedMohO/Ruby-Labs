class EventRouter
  def initialize
    @handlers = []
  end

  def register(handler)
    @handlers << handler
  end

  def dispatch(event)
    @handlers.each do |handler|
      handler.handle(event)
    end
  end
end
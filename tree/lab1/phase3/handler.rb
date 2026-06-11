class Handler
  def handle(event)
    raise NotImplementedError, "Handler subclasses must implement #handle"
  end
end
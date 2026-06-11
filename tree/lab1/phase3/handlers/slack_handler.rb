class SlackHandler < Handler
  def handle(event)
    puts "[Slack] 🔔 Notification: #{event.to_s}"
  end
end

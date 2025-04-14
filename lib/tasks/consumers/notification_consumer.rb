# lib/consumers/notification_consumer.rb

require_relative '../../config/environment'

connection = Bunny.new
connection.start
channel = connection.create_channel
queue = channel.queue("notifications", durable: true)

puts " [*] Waiting for messages in 'notifications'. To exit press CTRL+C"

queue.subscribe(block: true) do |_delivery_info, _properties, body|
  data = JSON.parse(body)
  puts " [x] Received: #{data}"

  # Process message
  Notification.create(user_id: data["user_id"], event: data["event"])
end

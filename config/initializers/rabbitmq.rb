require 'bunny'

begin
  $rabbitmq_conn = Bunny.new(ENV.fetch('RABBITMQ_URL', 'amqp://guest:guest@localhost:5672'))
  $rabbitmq_conn.start

  $rabbitmq_channel = $rabbitmq_conn.create_channel
rescue Bunny::TCPConnectionFailed => e
  Rails.logger.error("RabbitMQ connection failed: #{e.message}")
end
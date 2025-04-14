class RabbitmqPublisher
    def self.publish(queue_name, payload)
      queue = $rabbitmq_channel.queue(queue_name, durable: true)
      queue.publish(payload.to_json, persistent: true)
    end
end
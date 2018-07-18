require "bunny"

connection=Bunny.new(

    :hostname=>"150.95.214.48",
    :port=>5672,
    :vhost=>"/mss_vhost",
    :user=>"web",
    :pass=>"U7zCgdJQ",
    automatically_recover: false
)

connection.start

channel=connection.create_channel

queue=channel.queue('hello')
queue.publish("hello", persistent: true)

puts "[x] send message"

connection.close

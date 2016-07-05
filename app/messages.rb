before do
  headers "Content-Type" => "text/html; charset=utf-8"
end

get '/messages/new' do
  @title = "Send new message"
  haml :new
end

post '/messages/create' do
  body = params[:message].values.join(", ")

  conn = Bunny.new
  conn.start

  ch = conn.create_channel
  q  = ch.queue("messages_to_db")
  x  = ch.default_exchange.publish(body, :routing_key => q.name)

  conn.close
  @title = "Your message was sending.."
  haml :new
end

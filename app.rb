require 'bundler/setup'
Bundler.require
require 'sinatra/reloader' if development?
require './models.rb'

before do
  if Count.count == 1
    Count.create(number: 0)
  end
end

get "/" do
  @number = Count.first.number
  @number2 = Count.find(2).number
  erb :index
end

post "/plus" do
  count = Count.first
  count.number = count.number + 1
  count.save
  redirect "/"
end

post "/plus2" do
  count = Count.find(2)
  count.number = count.number + 1
  count.save
  redirect "/"
end

post "/minus" do
  count = Count.first
  count.number = count.number - 1
  count.save
  redirect "/"
end

post "/multi" do
  count = Count.first
  count.number = count.number * 2
  count.save
  redirect "/"
end

post "/division" do
  count = Count.first
  count.number = count.number / 2
  count.save
  redirect "/"
end

post "/clear" do
  count = Count.first
  count.number = 0
  count.save
  redirect "/"
end

post "/text" do
  @text = params[:text]
  erb :index
  
end


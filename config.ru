require 'rack'
require 'rubygems'
require 'bundler/setup'
require 'sinatra'
require 'haml'
require './app/base'
require './app/messages'

run Sinatra::Application

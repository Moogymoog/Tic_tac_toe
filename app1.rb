require 'bundler'
Bundler.require

$:.unshift File.expand_path("./../lib/classes", __FILE__)
require 'Board'
require 'BoardCase'
require 'Game'
require 'Player'
require 'Application'

Application.new.perform
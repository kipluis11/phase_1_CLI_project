#require all files so they can talk to eachother
require 'bundler'
Bundler.require #requires all gems listed in Gemfile. 

require_relative "./lib/api"
require_relative "./lib/cli"
require_relative "./lib/spell"
#this "./" is saying "look at the file right above me"
#requires something that "lives" inside the same repo folder; 
#if someone was to clone this project, it would still have have the file that lives in this envirnment file. 
#use  this when we require files from the same repository.

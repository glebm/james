# If using the gem, replace with:
#
# require 'rubygems'
# require 'james'
require File.expand_path '../../lib/james', __FILE__

# Time dialog by Florian Hanke.
#
# This is a very simple James example.
#
# It has only one state, :shake, and a single
# entry/hook phrase, "Shake the eight ball"
#
James.dialog do

  attr_reader :states

  def initialize
    @states = [
      "It is certain",
      "It is decidedly so",
      "Without a doubt",
      "Yes – definitely",
      "You may rely on it",

      "As I see it, yes",
      "Most likely",
      "Outlook good",
      "Signs point to yes",
      "Yes",

      "Reply hazy, try again",
      "Ask again later",
      "Better not tell you now",
      "Cannot predict now",
      "Concentrate and ask again",

      "Don't count on it",
      "My reply is no",
      "My sources say no",
      "Outlook not so good",
      "Very doubtful"
    ]
  end

  hear 'Shake the eight ball' => :shake,
       'I have a question'    => :shake

  state :shake do
    hear ['Shake the eight ball', 'I have another question', 'Again']
    into do
      states[rand(states.size)]
    end
  end

end
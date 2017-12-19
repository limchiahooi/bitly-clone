require 'securerandom'

class Url < ActiveRecord::Base
	# This is Sinatra! Remember to create a migration!

before_create :shorten
validates :long_url, :presence => true, :format => URI::regexp(%w(http https))
validates :long_url, :uniqueness => true
validates :short_url, :uniqueness => true

  def shorten
  	self.short_url = SecureRandom.hex(3)
  # 	write a method here
  #		self.short_url = "asd"
  end


def count
	self.click_count += 1
	self.save
end



end



#!/usr/bin/ruby

require 'rubygems'
require 'json'
require 'erb'
require 'pp'
require 'uri'
require 'htmlentities'

class Station
  def initialize(stationID, stationPublicID, stationName)
    @stationID = stationID
    @stationPublicID = stationPublicID
    @stationName = stationName
  end
end

json = File.read(ARGV[0])
lage = JSON.parse(json)

@marker = lage['marker']
@stationen = []
@bikesHammerbrook = "U"
@bikesBerlinertor = "U"

@marker.each do |m|
  stationID = m['hal2option']['standort_id'].to_i
  he = HTMLEntities.new
  nbsp = he.decode('&nbsp;')
  concatenatedNameString = he.decode(m['hal2option']['tooltip'])
  s = concatenatedNameString.gsub("\u00a0", ' ')
  s =~ /^\'(\d+) ([^\']*)/
  stationPublicID = $1
  m[:stationPublicID] = stationPublicID 
  m[:stationName] = $2
  bikes = m['hal2option']['bikes'].split(',')
  numbikes = bikes.length
  m[:numbikes] = numbikes
  if stationPublicID == "2651"
    @bikesHammerbrook = numbikes
  elsif stationPublicID == "2645"
    @bikesBerlinertor = numbikes
  end
#  print "#{stationPublicID} "
#  print "#{stationName}\n"
end

@marker.each do |m|
  if m[:stationPublicID] == "2651" or m[:stationPublicID] == "2645"
#    print "#{m[:stationPublicID]} #{m[:stationName]} #{m[:numbikes]}\n"
  end

end

system("rrdtool update /home/armin/rrd/stadtrad.rrd N:#{@bikesHammerbrook}:#{@bikesBerlinertor}")


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
@bikesPerStation = Hash.new()

@marker.each do |m|
  stationID = m['hal2option']['standort_id'].to_i
  he = HTMLEntities.new
  nbsp = he.decode('&nbsp;')
  concatenatedNameString = he.decode(m['hal2option']['tooltip'])
  s = concatenatedNameString.gsub("\u00a0", ' ')
  s =~ /^\'(\d+) ([^\']*)/
  stationPublicID = $1
  m[:stationPublicID] = stationPublicID.to_i
  m[:stationName] = $2
  bikes = m['hal2option']['bikes'].split(',')
  numbikes = bikes.length
  m[:numbikes] = numbikes
end

@marker.each do |m|
  @bikesPerStation[m[:stationPublicID]] = m[:numbikes]
  print "#{m[:stationPublicID]} #{m[:stationName]}\n"
#  system("rrdtool update /home/armin/rrd/#{m[:stationPublicID]}.rrd N:#{m[:numbikes]}")
end


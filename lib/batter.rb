 class Batter
   
 include HTTParty
 
 base_uri "gd2.mlb.com/components/game/mlb"
 
 attr_accessor :ab, :r, :single, :double, :triple, :hr, :rbi, :bb, :sb, :cs, :id, :error, :points
 
  def initialize(ab, r, single, double, triple, hr, rbi, bb, sb, cs, id, error)
    self.ab =Integer(ab)
    self.r = Integer(r)
	self.single = Integer(single)
	self.double = Integer(double)
	self.triple = Integer(triple)
    self.rbi = Integer(rbi)
    self.hr = Integer(hr)
	self.bb = Integer(bb)
	self.sb = Integer(sb)
	self.cs = Integer(cs)
	self.id = id
	self.error = error
	self.points = @single+@double*2+@triple*3+@hr*4+@bb+@rbi+@r+@sb*3-@cs
  end
 
  # Returns the versions for this particular RemoteGem
  def self.todaystats(id)
    time = Time.new
	url= "/year_#{time.year}/month_#{time.strftime("%m")}/day_#{time.strftime("%d")}/batters/#{id}_1.xml"
	#SHOW URL pp url
    response = get(url)
    batting = response["batting"]
	if response.success?
	# pp batting
       self.new(batting["ab"], batting["r"], batting["single"], batting["double"],batting["triple"],batting["hr"], batting["rbi"], batting["bb"], batting["sb"], batting["cs"], id, "")
    else
      self.new(0, 0, 0, 0,0,0,0,0,0, 0, id, "no stats")
    end
  end	
  def each
  end
 end

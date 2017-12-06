class String
  def ^(arg)
    self.unpack('c*').zip(arg.unpack('c*')).map{ |a,b| a ^ b }.pack('c*')
  end
end

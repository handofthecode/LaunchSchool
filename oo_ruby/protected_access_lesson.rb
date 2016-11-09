class Machine
  def start
    flip_switch(:on)
  end

  def stop
    flip_switch(:off) ## Can't call to a private method with explicit receiver
  end                 ## e.g: self.flip_switch

  private

  attr_writer :switch

  def flip_switch(desired_state)
    self.switch = desired_state  ## must have an explicit receiver when setting
  end                            ## ivars within a class.  
end

machine = Machine.new

p machine.start
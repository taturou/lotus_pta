class DateTime
  def ymdHM
    self.strftime("%Y/%m/%d %H:%M")
  end

  def mdHM
    self.strftime("%m/%d %H:%M")
  end
end

class String
  def html
    self.gsub(/\r\n|\r|\n/, "<br/>")
  end
end

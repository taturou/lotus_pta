class String
  def to_html
    self.gsub(/\r\n|\r|\n/, "<br/>")
  end
end

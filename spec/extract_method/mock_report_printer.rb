class MockReportPrinter

  def print(text)
    (@text ||= '') << text
  end

  def get_text
    @text
  end

end
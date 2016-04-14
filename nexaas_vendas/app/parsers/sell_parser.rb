class SellParser
  attr_accessor :tab_file

  def initialize(filename)
    @tab_file = File.open(filename, 'r')
    @lines = @tab_file.readlines
  end

  def parse
    raise SellParserError.new('Arquivo de vendas nao contem registros!') unless @lines.size > 1

    @lines[1..-1].each do |line|
      @sells = Sell.from_file_line(line)
    end
  end

  class SellParserError < StandardError
  end
end
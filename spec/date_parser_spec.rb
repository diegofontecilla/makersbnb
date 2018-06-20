#all dates are in the following format: %Y%m%d

require 'date_parser'
require 'date'

describe DateParser do
  context '.parse' do

    it 'should be able to parse a simple date' do
      expect(DateParser.parse "20180606").to eq [Date.new(2018, 6, 6)]
    end

    it 'should be able to parse two simple dates' do
      expect(DateParser.parse "20180606, 20180707")
        .to eq [Date.new(2018, 6, 6), Date.new(2018, 7, 7)]
    end

    it 'should be able to parse a range of dates' do
      expect(DateParser.parse "20180606-20180608")
        .to eq [Date.new(2018, 6, 6), Date.new(2018, 6, 7), Date.new(2018, 6, 8)]
    end

    it 'should able to parse complex date input' do
      expect(DateParser.parse "20180606 - 20180608, 20180610-20180612, 20180614")
        .to eq [Date.new(2018, 6, 6), Date.new(2018, 6, 7), Date.new(2018, 6, 8), Date.new(2018, 6, 10), Date.new(2018, 6, 11), Date.new(2018, 6, 12), Date.new(2018, 6, 14)]
    end
  end

  context '.to_str' do
    it 'should convert parsed dates to database ready format' do
      expect(DateParser.to_str([Date.new(2018, 6, 6), Date.new(2018, 6, 7), Date.new(2018, 6, 8)]))
        .to eq "20180606,20180607,20180608"
    end
  end
end

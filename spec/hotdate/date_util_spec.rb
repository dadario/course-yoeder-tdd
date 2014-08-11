require_relative '../spec_helper'

describe DateUtil do

  def a_date(year, month, day)
    Date.strptime("#{year}-#{month}-#{day}", '%Y-%m-%d')
  end


  context 'TestOridinaryHotDate' do

    it 'Ordinary Date is not a Hot Date.' do
      ship_by_date = a_date(2011, 7, 8) # Friday, July 8 th 2011
      order_date = a_date(2011, 7, 6) # Wednesday, July 6 th 2011
      expect(DateUtil.hotdate?(ship_by_date, order_date)).to be_falsy
    end

    it 'Ordinary Date is not a Hot Date.' do
      ship_by_date = a_date(2011, 7, 6) # Wednesday, July 6 th 2011
      order_date = a_date(2011, 7, 4) # Monday, July 4 th 2011
      expect(DateUtil.hotdate?(ship_by_date, order_date)).to be_falsy
    end

  end

  describe 'TestBasicHotDate' do

    it 'Same Day Date is a Hot Date.' do
      ship_by_date = a_date(2011, 7, 5); # Tuesday, July 5th 2011
      order_date = a_date(2011, 7, 4); # Monday, July 4th 2011

      expect(DateUtil.hotdate?(ship_by_date, order_date)).to be_truthy
    end

    it 'Next Day Date is a Hot Date' do
      ship_by_date = a_date(2011, 7, 4); # Monday, July 4th 2011
      order_date = a_date(2011, 7, 4); # Monday, July 4th 2011
      expect(DateUtil.hotdate?(ship_by_date, order_date)).to be_truthy
    end

    it 'Two Day Date is not a Hot Date' do
      ship_by_date = a_date(2011, 7, 6); # Wednesday, July 6th 2011
      order_date = a_date(2011, 7, 4); # Monday, July 4th 2011

      expect(DateUtil.hotdate?(ship_by_date, order_date)).to be_falsy
    end

  end

  describe 'TestHotDateFriday' do

    let(:order_date) { a_date(2011, 7, 1) } # Friday, July 1 st 2011
    let(:ship_by_date) { a_date(2011, 7, 1) } # Friday, July 1 st 2011

    it 'Friday is a Hot Date' do
      expect(DateUtil.hotdate?(ship_by_date, order_date)).to be_truthy
    end

    it 'Saturday is a Hot Date.' do
      # Saturday, July 2 nd 2011
      expect(DateUtil.hotdate?(ship_by_date + 1, order_date)).to be_truthy
    end
    it 'Sunday is a Hot Date' do
      # Sunday, July 3 rd 2011
      expect(DateUtil.hotdate?(ship_by_date + 2, order_date)).to be_truthy
    end

    it 'Monday is a Hot Date' do
      # Monday, July 4 th 2011
      expect(DateUtil.hotdate?(ship_by_date + 3, order_date)).to be_truthy
    end
  end

  describe 'TestHotDateSaturday' do

    let(:order_date) { a_date(2011, 7, 2) } # Saturday, July 2 nd 2011
    let(:ship_by_date) { ship_by_date = a_date(2011, 7, 2) } #  Saturday, July 2 nd 2011

    it 'Saturday is a Hot Date' do
      expect(DateUtil.hotdate?(ship_by_date, order_date))
    end

    it 'Sunday is a Hot Date' do
      # Sunday, July 3 rd 2011
      expect(DateUtil.hotdate?(ship_by_date + 1, order_date))
    end

    it 'Monday is a Hot Date' do
      expect(DateUtil.hotdate?(ship_by_date + 2, order_date))
    end
  end


end


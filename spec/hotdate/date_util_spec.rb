require_relative '../spec_helper'

describe DateUtil do


  context 'TestOridinaryHotDate' do


    it 'Error: Ordinary Date is not a Hot Date.' do
      ship_by_date = Date.new(2011, 6, 8) # Friday, July 8 th 2011
      order_date = Date.new(2011, 6, 6) # Wednesday, July 6 th 2011
      expect(DateUtil.hotdate?(ship_by_date, order_date)).to be_falsy
    end

    it 'Error: Ordinary Date is not a Hot Date.' do
      ship_by_date = Date.new(2011, 6, 6) # Wednesday, July 6 th 2011
      order_date = Date.new(2011, 6, 4) # Monday, July 4 th 2011
      expect(DateUtil.hotdate?(ship_by_date, order_date)).to be_falsy
    end

  end

  it 'TestBasicHotDate'

  it 'TestHotDateFriday'

  it 'TestHotDateSaturday'


end


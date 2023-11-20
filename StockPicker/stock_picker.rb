def stock_picker(stocks)   
 max_profit_days = Array.new(2)
 max = 0 
 stocks.each_index{|purchase_day|
    for sell_day in (purchase_day+1)..(stocks.length - 1) do
    gain = stocks[sell_day] - stocks[purchase_day]
    if (gain>max)
        max = gain
        max_profit_days = [purchase_day, sell_day]    
    end
    end   
}
max_profit_days
end     


stock_picker([17,3,6,9,15,8,6,1,10])
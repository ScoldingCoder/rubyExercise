def bubble_sort(list)
    list.each_index{|i|
    sorted = true
    for j in 0..(list.length - 2 -i) do
        if(list[j]> list[j+1])
            sorted = false
            list[j],list[j+1] = list[j+1],list[j]
        end  
    end 
 if(sorted == true) 
    break
 end
}
list
end

 



bubble_sort([1,3,4,2])

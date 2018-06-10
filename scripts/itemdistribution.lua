local itemdistribution = {}

function itemdistribution.RollNumberArray(amount, maxvalue)
    local values = {}
    if amount > 0 then
        for i = 1, amount, 1
        do
            values[i] = math.random(1, maxvalue)
        end
    end
    return values
end

function itemdistribution.EvaluateItemFromArray(numberArray, categoryArray)
    local returnedItems = {}
    local arraySize = table.getn(numberArray)
    if arraySize > 0 then
        for i = 1, arraySize, 1
        do
            returnedItems[i] = categoryArray[numberArray[i]]
        end
    end
    return returnedItems
end

function itemdistribution.CreateRandomItemArray(amount, categoryArray)
    local numberArray = itemdistribution.RollNumberArray(amount, table.getn(categoryArray))
    return  itemdistribution.EvaluateItemFromArray(numberArray, categoryArray)
end

return itemdistribution
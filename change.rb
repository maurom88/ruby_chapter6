amount_owed = 5.30

change_owed = amount_owed * 100

coins_available = {toonie: 200, loonie: 100, quarter: 25, dime: 10, nickel: 5}

coins_owed = {toonies: 0, loonies: 0, quarters: 0, dimes: 0, nickels: 0}

finished = false

while finished != true do
    if change_owed >= coins_available[:toonie]
        coins_owed[:toonies] += 1
        change_owed -= 200
    else
        finished = true
    end
end

finished = false

while finished != true do
    if change_owed >= coins_available[:loonie]
        coins_owed[:loonies] += 1
        change_owed -= 100
    else
        finished = true
    end
end

finished = false

while finished != true do
    if change_owed >= coins_available[:quarter]
        coins_owed[:quarters] += 1
        change_owed -= 25
    else
        finished = true
    end
end

finished = false

while finished != true do
    if change_owed >= coins_available[:dime]
        coins_owed[:dimes] += 1
        change_owed -= 10
    else
        finished = true
    end
end

finished = false

while finished != true do
    if change_owed >= coins_available[:nickel]
        coins_owed[:nickels] += 1
        change_owed -= 5
    else
        finished = true
    end
end

puts coins_owed
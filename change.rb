amount_owed = 0.00

while amount_owed == 0
    print "Enter a number: "
    amount_owed = gets.chomp.to_f
end

change_owed = amount_owed * 100

def count_change
    coins_available = {toonie: 200, loonie: 100, quarter: 25, dime: 10, nickel: 5}
    coins_owed = {toonies: 0, loonies: 0, quarters: 0, dimes: 0, nickels: 0}

    coins_owed[:toonies] = yield coins_available[:toonie]
    coins_owed[:loonies] = yield coins_available[:loonie]
    coins_owed[:quarters] = yield coins_available[:quarter]
    coins_owed[:dimes] = yield coins_available[:dime]
    coins_owed[:nickels] = yield coins_available[:nickel]

    puts coins_owed
end

count_change do |coins_available|
    finished = false
    coins_owed = 0

    while finished != true do
        if change_owed >= coins_available
            coins_owed += 1
            change_owed -= coins_available
        else
            finished = true
        end
    end
    coins_owed
end
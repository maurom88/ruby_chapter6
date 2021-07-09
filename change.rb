amount_owed = 0.00
input_ok = false

while input_ok == false
    print "Enter a number: "
    amount_input = gets.chomp.to_s

    if amount_input.to_i >= 0
        amount_owed_dollars = amount_input.to_i

        if !amount_input.split('.')[1] || amount_input.split('.')[1].length != 2
            input_ok = false
        else
            amount_owed_cents = amount_input.split('.')[1].to_f
            amount_owed = (amount_owed_dollars + (amount_owed_cents / 100)).round(2)
            input_ok = true
        end
    else
        input_ok = false
    end
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

    puts "You need to dispense:"
    if coins_owed[:toonies] == 1
        puts "#{coins_owed[:toonies]} toonie"
    elsif coins_owed[:toonies] > 1
        puts "#{coins_owed[:toonies]} toonies"
    end

    if coins_owed[:loonies] == 1
        puts "#{coins_owed[:loonies]} loonie"
    elsif coins_owed[:loonies] > 1
        puts "#{coins_owed[:loonies]} loonies"
    end

    if coins_owed[:quarters] == 1
        puts "#{coins_owed[:quarters]} quarter"
    elsif coins_owed[:quarters] > 1
        puts "#{coins_owed[:quarters]} quarters"
    end

    if coins_owed[:dimes] == 1
        puts "#{coins_owed[:dimes]} dime"
    elsif coins_owed[:dimes] > 1
        puts "#{coins_owed[:dimes]} dimes"
    end

    if coins_owed[:nickels] == 1
        puts "#{coins_owed[:nickels]} nickel"
    elsif coins_owed[:nickels] > 1
        puts "#{coins_owed[:nickels]} nickels"
    end
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
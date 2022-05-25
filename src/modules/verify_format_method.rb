module CommonChecks
  def verify_index(array, message: 'Select by index: ', error: 'This Index does not exist. Choose another: ')
    loop do
      index = verify_int(message: message)
      value = array[index]
      return index if value

      print error
    end
  end

  def verify_int(message: 'Enter your value:', error: 'Unacceptable Value. Please enter only numbers:')
    print message
    int = gets.chomp

    until int.match(/^[0-9]*$/)
      print error
      int = gets.chomp
    end

    int.to_i
  end

  def verify_date(message: 'Enter the date in the format yyyy-mm-dd:',\
                  error: 'Unacceptable Value.'\
                         ' Please enter an acceptable date in the format yyyy-mm-dd:')
    print message
    date = gets.chomp.strip

    until date.match(/^\d{4}-(0[1-9]|1[0-2])-(0[1-9]|[12][0-9]|3[01])$/)
      print error
      date = gets.chomp.strip
    end

    Date.strptime(date, '%Y-%m-%d')
  end

  def verify_str(message: 'Enter your value:', error: 'Wrong Value. Please enter a string:')
    print message
    str = gets.chomp
    loop do
      break if str.length.positive?

      print error
      str = gets.chomp
    end
    str
  end

  def verify_range(first, last, message: 'Select Value: ', error: 'Value not in range. Please input value in range: ')
    print message
    input = gets.chomp.strip.to_i
    until (first..last).cover?(input)
      print error
      input = gets.chomp.strip.to_i
    end
    input
  end

  def yes_or_not(message: 'Please type Y for Yes and N for No (Y/N)', error: 'Please type only Y or N.')
    option = true
    loop do
      print message
      evaluate = gets.chomp.downcase
      case evaluate
      when 'n'
        option = false
        break
      when 'y'
        break
      else
        puts error
      end
    end
    option
  end

  def good_or_bad(message: 'Please type good or bad', error: 'Please type only good or bad.')
    option = 'good'
    loop do
      print message
      evaluate = gets.chomp.downcase
      case evaluate
      when 'bad'
        option = 'bad'
        break
      when 'good'
        break
      else
        puts error
      end
    end
    option
  end
end

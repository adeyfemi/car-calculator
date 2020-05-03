def prompt(message)
  Kernel.puts("=> #{message}")
end

def valid_loan_amount?(input)
  Integer(input) rescue false
end

def valid_apr?(apr)
  Float(apr) rescue false
end

def valid_loan_duration?(dur)
  Integer(dur) rescue false
end

def operation_to_message(op)
  case op
  when '1'
    'Calculating the monthly interest rate'
  when '2'
    'Calculating the loan duration in months'
  end
end

num_of_months = 12

prompt("Welcome to the mortgage/car calculator! Enter your name:")

name = ''

loop do
  name = Kernel.gets().chomp()

  if name.empty?()
    prompt("Make sure you use a valid name.")
  else
    break
  end
end

loop do
  prompt("Hi #{name}")

  loan_amount = ''

  loop do
    prompt("What is the loan amount?")
    loan_amount = Kernel.gets().chomp()

    if valid_loan_amount?(loan_amount)
      break
    else
      prompt("Please input a valid loan amount")
    end
  end

  annual_percentage_rate = ''

  loop do
    prompt("What is your annual percentage rate?")
    annual_percentage_rate = Kernel.gets().chomp()

    if valid_apr?(annual_percentage_rate)
      break
    else
      puts("Please input a valid annual percentage rate")
    end
  end

  loan_duration = ''

  loop do
    prompt("How long is the duration of the loan in years?")
    loan_duration = Kernel.gets().chomp()

    if valid_loan_duration?(loan_duration)
      break
    else
      puts("Please input a valid loan duration")
    end
  end

  operator_prompt = <<-MSG

  What operation would you like to perform?
  1) calculate the monthly interest rate
  2) calculate the loan duration in months

  MSG

  prompt(operator_prompt)
  operator = ''

  loop do
    operator = Kernel.gets().chomp()

    if %w(1 2).include?(operator)
      break
    else
      prompt("Must choose 1 or 2")
    end
  end
  
  prompt("#{operation_to_message(operator)} for the loan...")
  
  loan_dur_mths = (loan_duration.to_i * num_of_months.to_i)
  mth_int = (annual_percentage_rate.to_f / 100).round(2)
  mth_int_rate = loan_amount.to_i * (mth_int_rate.to_f / (1 - (1 + mth_int)**(-loan_dur_mths)))

  case operator
  when '1'
    prompt("The monthly interest amount is #{sprintf("%0.2f", mth_int_rate)}.")
  when '2'
    prompt("The loan duration is #{sprintf("%0.2f", loan_dur_mths)} months.")
  end

  prompt("Do you want to recalculate? (Y to calculate the again).")
  answer = Kernel.gets().chomp()
  break unless answer.downcase().start_with?('y')

end

prompt("Thank you #{name} for using the calculator.")

# # informal psuedo code
# given the loan amount, APR, and loan duration in years and months

# calculate the monthly interest rate
#  - divide the APR by 12 and assign that to a variable called monthly_interest_rate

# calculate the loan duration in months
#  - multiply the number of years by 12 and add this to the loan_duration_in_months variable

# calculate the monthly loan payment

# output the monthly payment
# output the number of payments and total amount that will be paid
# output the total interest that will be paid

# # formal psuedo code
# START

# GET "Enter the loan amount"
# SET loan_amount

# GET "Enter the Annual Percentage Rate expressed as a decimal"
# SET apr
# SET monthly_interest_rate = apr / 12

# GET "Enter the loan duration in years"
# SET loan_dur_years

# GET "Enter any remaining months in the loan duration"
# SET loan_dur_months
# SET loan_dur_months = loan_dur_months + (loan_dur_years * 12)

# SET monthly_payment = loan_amount * (monthly_interest_rate / (1 - (1 + monthly_interest_rate)**(-1 * loan_dur_months))) # validated in irb that this formula is accurate

# PRINT montly_payment

# END

# next step is to start building the program

#################################################################
# code for main program
#################################################################

def prompt(text)
  Kernel.puts("=> #{text}")
end

def valid_number?(num)
  num.to_i.to_s == num
end

def valid_float?(num)
  num.to_f.to_s == num 
end

loan_amount = ''
loop do # loan amount input loop
  prompt('Enter the loan amount in USD')
  loan_amount = Kernel.gets().chomp()

  if valid_number?(loan_amount)
    break
  else
    prompt('Please enter a valid number')
  end
end

apr = ''
loop do # apr input loop
  prompt('Enter the Annual Percentage Rate, expressed as a decimal (Ex: 5%, would be 0.05)')
  apr = Kernel.gets().chomp()

  if valid_float?(apr)
    break
  else
    prompt('Please enter a decimal number')
  end
end

monthly_interest_rate = apr.to_f / 12

loan_dur_years = ''
loop do # loan duration in years input loop
  prompt('enter the loan duration in years')
  loan_dur_years = Kernel.gets().chomp()

  if valid_number?(loan_dur_years)
    break
  else
    prompt('Please enter a valid number')
  end
end

loan_dur_months = ''
loop do
  prompt('Enter any remaining months in the loan calculator')
  loan_dur_months = Kernel.gets().chomp()

  if valid_number?(loan_dur_months)
    break
  else
    prompt('Please enter a valid number')
  end
end

loan_dur_months = loan_dur_months.to_i + (loan_dur_years.to_i * 12)

monthly_payment = loan_amount.to_i * (monthly_interest_rate / (1 - (1 + monthly_interest_rate)**(-1 * loan_dur_months)))

Kernel.puts(monthly_payment)
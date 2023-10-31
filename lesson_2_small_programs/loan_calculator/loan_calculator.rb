# informal psuedo code
given the loan amount, APR, and loan duration in years and months

calculate the monthly interest rate
 - divide the APR by 12 and assign that to a variable called monthly_interest_rate

calculate the loan duration in months
 - multiply the number of years by 12 and add this to the loan_duration_in_months variable

calculate the monthly loan payment

output the monthly payment
output the number of payments and total amount that will be paid
output the total interest that will be paid

# formal psuedo code
START

GET "Enter the loan amount"
SET loan_amount

GET "Enter the Annual Percentage Rate expressed as a decimal"
SET apr
SET monthly_interest_rate = apr / 12

GET "Enter the loan duration in years"
SET loan_dur_years

GET "Enter any remaining months in the loan duration"
SET loan_dur_months
SET loan_dur_months = loan_dur_months + (loan_dur_years * 12)

SET monthly_payment = loan_amount * (monthly_interest_rate / (1 - (1 + monthly_interest_rate)**(-1 * loan_dur_months))) # validated in irb that this formula is accurate

PRINT montly_payment

END
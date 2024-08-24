create database bank_analytics;
use bank_analytics;

select  *  from finance_01;
select * from finance_02;

--- Total_Loan_Amount
Select concat("$",format(sum(Loan_amount)/1000000,2),"M") as Total_loan_amount from finance_01;

--- Total_Loan_Issued
Select distinct concat (format(count(Member_id)/1000,2),"K") as Number_of_loan_issued
from finance_01;

--- Cumulative_Interest_Rate
Select concat(format(100*avg(Interest_rate),2),"%") as Cumulative_interest_rate
from finance_01;

--- Total_Funded_Amount
Select concat("$",format(sum(Funded_amount)/1000000,2),"M") as Total_funded_amount
from finance_01;

--- Average DTI(Dept-to-income-Ratio)
Select concat(format(avg(dti),2),"%") as Average_DTI from finance_01;

# KPI 1
-- Year wise Loan Amount Stats
Select year(Issue_date) as Year_of_issue_date,
concat("$",format(sum(Loan_amount)/1000000,2),"M") as Total_loan_amount from Finance_01
group by Year_of_issue_date
order by Year_of_issue_date;

# KPI 2
-- Grade and Sub-Grade wise Revolving Balance 
Select f1.Grade, f1.Sub_grade, concat("$",format(sum(f2.Revolve_balance)/1000000,2),"M") as Revolving_Balance 
from finance_01 as f1 inner join finance_02 as f2 
on f1.id = f2.id
group by Grade, Sub_grade
order by Grade, Sub_grade;

# KPI 3
-- Total Payment for Verified Status Vs Total Payment for Non-Verified Status
Select Verification_status, concat("$",format(sum(Total_payment)/1000000,2),"M") as Total_Payment from finance_01 inner join finance_02 on
finance_01.id = finance_02.id 
group by Verification_status;

# KPI 4 
-- State wise and Month wise Loan status 
Select address_state as State ,monthname(Last_credit_pull_date) as Month_name,Loan_status   from 
finance_01 inner join finance_02 
on finance_01.id = finance_02.id
order by State, Month_name;

# KPI 5 
-- Home Ownership Vs Last Payment date 
Select Home_ownership, Last_payment_date from 
finance_01 inner join finance_02 on  
finance_01.id = finance_02.id
order by Home_ownership; 









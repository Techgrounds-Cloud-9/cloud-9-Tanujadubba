
print ("Please Enter your details below")
first_name=str(input("First Name:"))
last_name=str(input("Last Name:"))
job_title=str(input("Job Title:"))
company=str(input("Company:"))

dict_mydetails={
    "first_name":first_name,
    "last_name":last_name,
    "job_title":job_title,
    "company":company
}
print(dict_mydetails)

import csv
import os

file_details=open("mydetails.csv","a")
str_csv_det=""
list_values=list(dict_mydetails.values())
length_values=len(list_values)
for x in range(length_values):
    if x < length_values-1:
        str_csv_det=str_csv_det+list_values[x]+","
    else:
        str_csv_det=str_csv_det+list_values[x] 
file_details.write(str_csv_det+os.linesep)
file_details.close()





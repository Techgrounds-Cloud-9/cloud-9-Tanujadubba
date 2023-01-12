from cmath import log
import math
from mimetypes import guess_extension
import random
from tkinter import Y

x = int(input("Enter your first value:- "))
Y = int(input("Enter your second value:- "))

z = random.randint (x,Y)
print("\n\tYou've only ",
       round(math.log(z - x + 1, 2)),
      " chances to guess the integer!\n")

count = 0
while count < math.log(Y - x + 1, 2):
    
  count += 1
  guess = int(input("Guess a number:- "))
  if x == guess:
    print("Congratulations you did it in", count, "try")
    break
  elif z > guess:
    print ("You guessed too small!")
    print( "try again!")
  elif z < guess:
    print("You guessed too heigh!")
    print( "try again!")
if count >= math.log(Y - x + 1, 2): 
    print("\nThe number is %d" %x)   
    print("\tGood luck next time")   
#Order Pizza 
From https://replit.com/@WarisaraBoontha/Batch6ChatbotOrderPizza#main.r

print("Welcome to Jana's Pizza")

#Q1
print("What is your name?")
user_name <- readLines("stdin", n=1) 
paste("Hello K.",user_name)

#Q2
print("What do you want to do?")
print("Order")
print("Exit")

Action <- readLines("stdin", n=1) 
if (Action =="Order"){ 
  print("Here is our Pizza Menu ")
  print("Meat Lover")
  print("Hawaiian")
  print("Four Cheese")
    Pizza_order <- readLines("stdin", n=1) 

  #Q3
  print("What is the size?")
  print("Small")
  print("Meduim")
  print("Large")
  Pizza_size <-readLines("stdin", n=1) 
 
  #Q4
    print("Do you want some drinks?")
  print("Coke")
  print("Water")
  print("Tea")
  print("None")
  Drink_order <-readLines("stdin", n=1) 

  #Q5
    print("Do you want some side")
  print("Freshfried")
  print("Mashed Potato")
  print("Salad")
  print("None")
  Side_order <-readLines("stdin", n=1) 
  
 #Q6
    print("What is your phone number?")
  Phone_number <-readLines("stdin", n=1) 
#Q7
     print("What is your delivery address?")
 Delivery_Address <-readLines("stdin", n=1) 

  print("----------------------------------------")
  #Q8
  print("You are all set!")
  print("Order summary:")
  print(paste("Name:",user_name))
  print(paste("Phone number:",Phone_number))
  print(paste("Delivery Address",Delivery_Address))
  print(paste("Your order:",Pizza_size, Pizza_order))
  print(paste("Side :",Side_order))
  print(paste("Drinks:",Drink_order))
 print("----------------------------------------")
  print("Thank you!")
  
} else print("Thank you!")






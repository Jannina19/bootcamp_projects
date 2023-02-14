class ATM:
    #double undescore >> dunder
    def __init__(self, pin, name, balance ):
        self.pin = pin
        self.name = name
        self.balance = balance
#1
    def deposit(self,money):
        self.balance += money
        print(f"Deposit money(Baht):{money}")
        print("Deposit successfully")
        print(f"New balance(Baht):{self.balance}")
        print("--------------------------")
#2
    def tranfer(self,tranfer):
        self.balance -= tranfer
        print(f"Tranfer money(Baht):{tranfer}")
        print("Tranfer successfully")
        print(f"New balance(Baht):{self.balance}")
        print("--------------------------")
#3
    def withdraw(self,withdraw):
        self.balance -= withdraw
        print(f"Withdraw money(Baht):{withdraw}")
        print("Withdraw successfully")
        print(f"Total balance(Baht):{self.balance}")
        print("--------------------------")
#4 
    def pay_bill(self,bills):
        self.balance -= bills
        print(f"You pay bills {bills} baht")
        print(f"Your Total balance: {self.balance}")
        print("--------------------------")
#5
    def check_balance(self):
         print("--------------------------")
         print("Check balance")
         print(f"Your Total balance: {self.balance}")
   


import random
import pyautogui
import os
import datetime

clear = lambda: os.system('cls')

letterssmall="abcdefghijklmnopqrstuvwxyz"
lettersCaps="ABCDEFGHIJKLMNOPQRSTUVWXYZ"
numbers="0123456789"
special="!'"'#$%&"'"()*+,-./:;<=>?@[\]^_`{|}~"
character=letterssmall + lettersCaps + numbers +special

character_list=list(character)
password=pyautogui.password("Enter Pass to check Brutforce time:")
guess_password=''

begin_time = datetime.datetime.now()

while(guess_password!=password):
    guess_password=random.choices(character_list,k=len(password))

    print("Munes>>>>>"+str(guess_password)+"<<<<<Munes")

    if(guess_password==list(password)):
        clear()
        print("Pass is:"+"".join(guess_password))
        print("Execution Time is:"+ str(datetime.datetime.now() - begin_time))
        break
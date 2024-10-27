secret_number = 99  

print("Загадайтк число от 0 до 99")

while True:
    user_input = input("Введите ваше число: ")

    if not user_input.isdigit():  #число или нет
        print("Введите число")
        continue  #снова начинает цикл
        
        
    guessed_number = int(user_input)  #преобр в целое 
    
    

    if guessed_number < 0 or guessed_number > 99:
        print("Число должно быть от 0 до 99")
        continue 

    if guessed_number == secret_number:
        print("Молодец, угадал")
        break  
    elif guessed_number < secret_number:
        print("Число должно быть больше")  
    else:
        print("Число должно быть меньше")  
        




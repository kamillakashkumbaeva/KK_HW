<<<<<<< HEAD
=======

>>>>>>> 0234b2e51a35f951b82610cb0b9bce80251d261f
import math  # Для тригонометрич ф

# Функция для нахождения 3 стороны треугольника
def find_side(a, b, angle_rad):
    c = math.sqrt(a**2 + b**2 - 2 * a * b * math.cos(angle_rad))
    return c  

# Ввод значений от пользователя
a = float(input("Введите длину стороны a: ")) 
b = float(input("Введите длину стороны b: "))  
angle_deg = float(input("Введите угол между сторонами a и b (в градусах): "))  

angle_rad = math.radians(angle_deg)


c = find_side(a, b, angle_rad)


print(f"Длина третьей стороны треугольника: {c:.2f}")
<<<<<<< HEAD
=======

import math  # Для тригонометрич ф

# Функция для нахождения 3 стороны треугольника
def find_side(a, b, angle_rad):
    c = math.sqrt(a**2 + b**2 - 2 * a * b * math.cos(angle_rad))
    return c  

# Ввод значений от пользователя
a = float(input("Введите длину стороны a: ")) 
b = float(input("Введите длину стороны b: "))  
angle_deg = float(input("Введите угол между сторонами a и b (в градусах): "))  

angle_rad = math.radians(angle_deg)


c = find_side(a, b, angle_rad)


print(f"Длина третьей стороны треугольника: {c:.2f}")

>>>>>>> 0234b2e51a35f951b82610cb0b9bce80251d261f

g=function()
{
a <- as.numeric(readline(prompt = "Введите длину первой стороны: "))
b <- as.numeric(readline(prompt = "Введите длину второй стороны: "))
с <- as.numeric(readline(prompt = "Введите угол между сторонами в градусах: "))
d <- sqrt(a^2 + b^2 - 2*a*b*cospi(c*pi / 180))
d

}
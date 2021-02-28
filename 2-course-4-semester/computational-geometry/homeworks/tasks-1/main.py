import random
from PIL import Image, ImageDraw #Подключим необходимые библиотеки

image = Image.open("roof.JPG") #Открываем изображение
draw = ImageDraw.Draw(image) #Создаем инструмент для рисования
width  = image.size[0] #Определяем ширину 
height = image.size[1] #Определяем высоту 	
pix = image.load() #Выгружаем значения пикселей
for x in range(width):
    for y in range(height):
        r, g, b = pix[x, y][0], pix[x, y][1], pix[x, y][2]
        if 0 < x < height/3:
            b = int(b*0.4)
        elif 2:
            g, b = int(g*0.4), int(b*0.4)
        else:
            r, b = int(r*0.4), int(b*0.4)
        draw.point((x, y), (r, g, b))
image.show()
del draw

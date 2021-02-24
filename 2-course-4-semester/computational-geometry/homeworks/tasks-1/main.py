import random
from PIL import Image, ImageDraw #Подключим необходимые библиотеки

image = Image.open("roof.JPG") #Открываем изображение
draw = ImageDraw.Draw(image) #Создаем инструмент для рисования
width  = image.size[0] #Определяем ширину 
height = image.size[1] #Определяем высоту 	
pix = image.load() #Выгружаем значения пикселей
for x in range(width):
        for y in range(height):
                r = pix[x, y][0]
                g = pix[x, y][1]
                b = pix[x, y][2]
                draw.point((x, y), (int(r/2), int(g/2), int(b/2)))
image.show()
del draw

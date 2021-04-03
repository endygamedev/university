from PIL import Image, ImageDraw


image = Image.open("Pics/roof.JPG")
draw = ImageDraw.Draw(image)
width  = image.size[0]
height = image.size[1]
pix = image.load()
for x in range(width):
    for y in range(height):
        r, g, b = pix[x, y][0], pix[x, y][1], pix[x, y][2]
        if x < width/3:
            a = (r + g)//2
            r, g, b = a, a, 0
        elif width/3 <= x <= 2*width/3:
            g, b = 0, 0
        else:
            r, b = 0, 0
        draw.point((x, y), (r, g, b))
image.save("Pics/task2.jpg")
del draw

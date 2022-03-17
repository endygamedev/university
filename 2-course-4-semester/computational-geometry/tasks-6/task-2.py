from OpenGL.GL import *
from OpenGL.GLU import *
from OpenGL.GLUT import *

# Процедура инициализации
def init():
	glEnable(GL_DEPTH_TEST)
	glClearColor(0.5, 0.5, 0.5, 1.0) # Серый цвет для первоначальной закраски
	gluOrtho2D(-1.0, 1.0, -1.0, 1.0) # Определяем границы рисования по горизонтали и вертикали

# Процедура обработки обычных клавиш
def keyboardkeys(key, x, y):
	if key == b'\x1b':
		sys.exit(0)
	glutPostRedisplay()         # Вызываем процедуру перерисовки

def cubes(center: tuple, edge_len: float):
    x, y, z = center
    edge_len = edge_len / 2

    # Верхняя грань
    glColor3f(1, 0, 0)
    glVertex3f(x + edge_len, y + edge_len, z - edge_len)
    glVertex3f(x - edge_len, y + edge_len, z - edge_len)
    glVertex3f(x - edge_len, y + edge_len, z + edge_len)
    glVertex3f(x + edge_len, y + edge_len, z + edge_len)

    # Нижняя грань
    glColor3f(0, 1, 0)
    glVertex3f(x + edge_len, y - edge_len, z + edge_len)
    glVertex3f(x - edge_len, y - edge_len, z + edge_len)
    glVertex3f(x - edge_len, y - edge_len, z - edge_len)
    glVertex3f(x + edge_len, y - edge_len, z - edge_len)

    # Передняя грань
    glColor3f(0, 0, 1)
    glVertex3f(x + edge_len, y + edge_len, z + edge_len)
    glVertex3f(x - edge_len, y + edge_len, z + edge_len)
    glVertex3f(x - edge_len, y - edge_len, z + edge_len)
    glVertex3f(x + edge_len, y - edge_len, z + edge_len)


    # Задняя грань
    glColor3f(1, 1, 0)
    glVertex3f(x + edge_len, y - edge_len, z - edge_len)
    glVertex3f(x - edge_len, y - edge_len, z - edge_len)
    glVertex3f(x - edge_len, y + edge_len, z - edge_len)
    glVertex3f(x + edge_len, y + edge_len, z - edge_len)


    # Левая грань
    glColor3f(1, 0, 1)
    glVertex3f(x - edge_len, y + edge_len, z + edge_len)
    glVertex3f(x - edge_len, y + edge_len, z - edge_len)
    glVertex3f(x - edge_len, y - edge_len, z - edge_len)
    glVertex3f(x - edge_len, y - edge_len, z + edge_len)

    # Правая грань
    glColor3f(0, 1, 1)
    glVertex3f(x + edge_len, y + edge_len, z - edge_len)
    glVertex3f(x + edge_len, y + edge_len, z + edge_len)
    glVertex3f(x + edge_len, y - edge_len, z + edge_len)
    glVertex3f(x + edge_len, y - edge_len, z - edge_len)



# Процедура рисования
def draw(*args, **kwargs):
    glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT) # Очищаем экран и заливаем текущим цветом фона
    glRotated(0.01, 1, 1, 1)

    glBegin(GL_QUADS)

    cubes((-0.5, -0.5, -0.5), 0.2)
    cubes((0.5, -0.5, -0.5), 0.2)
    cubes((0.5, 0.5, -0.5), 0.2)
    cubes((0.5, 0.5, 0.5), 0.2)
    cubes((-0.5, 0.5, 0.5), 0.2)
    cubes((-0.5, -0.5, 0.5), 0.2)
    cubes((0.5, -0.5, 0.5), 0.2)
    cubes((-0.5, 0.5, -0.5), 0.2)

    glEnd()

    glutSwapBuffers()           # Меняем буферы
    glutPostRedisplay()         # Вызываем процедуру перерисовки

glutInitDisplayMode(GLUT_DOUBLE | GLUT_RGB | GLUT_DEPTH)
glutInitWindowSize(800, 600)
glutInitWindowPosition(50, 50)
glutInit(sys.argv)
glutCreateWindow(b"task-2")
# Определяем процедуру, отвечающую за рисование
glutDisplayFunc(draw)
# Определяем процедуру, отвечающую за обработку обычных клавиш
glutKeyboardFunc(keyboardkeys)
# Вызываем нашу функцию инициализации
init()
glutMainLoop()

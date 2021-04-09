from math import *
from OpenGL.GL import *
from OpenGL.GLU import *
from OpenGL.GLUT import *

# Процедура инициализации
def init():
	glEnable(GL_DEPTH_TEST)
	glClearColor(1.0, 1.0, 1.0, 1.0) # Белый цвет для первоначальной закраски
	gluOrtho2D(-1.0, 1.0, -1.0, 1.0) # Определяем границы рисования по горизонтали и вертикали
	global anglex, angley, anglez, filled
	anglex = 0
	angley = 0
	anglez = 0
	filled = 0

# Процедура обработки обычных клавиш
def keyboardkeys(key, x, y):
	global anglex, angley, anglez, filled
	if key == b'\x1b':
		sys.exit(0)
	if key == b'w':
		anglex += 5
	if key == b's':
		anglex -= 5
	if key == b'q':
		angley += 5
	if key == b'e':
		angley -= 5
	if key == b'a':
		anglez += 5
	if key == b'd':
		anglez -= 5
	if key == b' ':
		filled = 1 - filled
	glutPostRedisplay()         # Вызываем процедуру перерисовки

def cilinder():
	R = 0.5

	glBegin(GL_TRIANGLE_FAN)

	glVertex3d( 0,  0, -0.5)
	for i in range(21):
		glVertex3d(R * cos(2*pi*i/20), \
			R * sin(2*pi*i/20), -0.5)

	glEnd()

	glBegin(GL_QUAD_STRIP)

	for i in range(21):
		glVertex3d(R * cos(2*pi*i/20), \
			R * sin(2*pi*i/20), -0.5)
		glVertex3d(R * cos(2*pi*i/20), \
			R * sin(2*pi*i/20), 0.5)

	glEnd()

	glBegin(GL_TRIANGLE_FAN)

	glVertex3d( 0,  0, 0.5)
	for i in range(21):
		glVertex3d(R * cos(2*pi*i/20), \
			R * sin(2*pi*i/20), 0.5)

	glEnd()

def conus():
	R = 0.5

	glBegin(GL_TRIANGLE_FAN)

	glVertex3d( 0,  0, -0.5)
	for i in range(21):
		glVertex3d(R * cos(2*pi*i/20), \
			R * sin(2*pi*i/20), -0.5)

	glEnd()

	glBegin(GL_TRIANGLE_FAN)

	glVertex3d( 0,  0, 0.5)
	for i in range(21):
		glVertex3d(R * cos(2*pi*i/20), \
			R * sin(2*pi*i/20), -0.5)

	glEnd()

def sphere():
	R = 0.5

	for j in range(-9,9):
		glBegin(GL_QUAD_STRIP)

		for i in range(21):
			glVertex3d(R * cos(pi*j/18) * cos(2*pi*i/20), \
				R * cos(pi*j/18) * sin(2*pi*i/20), \
				R * sin(pi*j/18))
			glVertex3d(R * cos(pi*(j+1)/18) * cos(2*pi*i/20), \
				R * cos(pi*(j+1)/18) * sin(2*pi*i/20), \
				R * sin(pi*(j+1)/18))

		glEnd()

def thor():
	R = 0.5
	R2 = R * 0.3

	for i in range(20):
		glBegin(GL_QUAD_STRIP)

		for j in range(21):
			glVertex3d((R + R2 * cos(2*pi*j/20)) * cos(2*pi*i/20), \
				(R + R2 * cos(2*pi*j/20)) * sin(2*pi*i/20), \
				R2 * sin(2*pi*j/20))
			glVertex3d((R + R2 * cos(2*pi*j/20)) * cos(2*pi*(i+1)/20), \
				(R + R2 * cos(2*pi*j/20)) * sin(2*pi*(i+1)/20), \
				R2 * sin(2*pi*j/20))

		glEnd()

def cube():
	glBegin(GL_QUADS)

	glVertex3d( 0.5,  0.5, 0.5)
	glVertex3d(-0.5,  0.5, 0.5)
	glVertex3d(-0.5, -0.5, 0.5)
	glVertex3d( 0.5, -0.5, 0.5)

    glVertex3d( 0.5,  0.5,-0.5)
	glVertex3d(-0.5,  0.5,-0.5)
	glVertex3d(-0.5, -0.5,-0.5)
	glVertex3d( 0.5, -0.5,-0.5)

	glVertex3d( 0.5,  0.5, 0.5)
	glVertex3d( 0.5,  0.5,-0.5)
	glVertex3d( 0.5, -0.5,-0.5)
	glVertex3d( 0.5, -0.5, 0.5)

	glVertex3d(-0.5,  0.5, 0.5)
	glVertex3d(-0.5,  0.5,-0.5)
	glVertex3d(-0.5, -0.5,-0.5)
	glVertex3d(-0.5, -0.5, 0.5)

	glVertex3d( 0.5,  0.5, 0.5)
	glVertex3d( 0.5,  0.5,-0.5)
	glVertex3d(-0.5,  0.5,-0.5)
	glVertex3d(-0.5,  0.5, 0.5)

	glVertex3d( 0.5, -0.5, 0.5)
	glVertex3d( 0.5, -0.5,-0.5)
	glVertex3d(-0.5, -0.5,-0.5)
	glVertex3d(-0.5, -0.5, 0.5)

	glEnd()

# Процедура рисования
def draw(*args, **kwargs):
    glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT) # Очищаем экран и заливаем текущим цветом фона
    glLoadIdentity()
    global anglex, angley, anglez, filled
    glRotated(anglex,1,0,0)
    glRotated(angley,0,1,0)
    glRotated(anglez,0,0,1)
    glRotated(-105,1,0,0)
    if filled == 1:
        glPolygonMode(GL_FRONT_AND_BACK, GL_FILL)
    else:
        glPolygonMode(GL_FRONT_AND_BACK, GL_LINE)

    glPushMatrix()
    glColor3f(1, 0, 0)
    glScaled(1, 1, 0.5)
    cilinder()
    glPopMatrix()

    glPushMatrix()
    glColor3f(0, 0, 1)
    glTranslated(0, 0, 0.375)
    glScaled(1, 1, 0.25)
    conus()
    glPopMatrix()

    glutSwapBuffers()           # Меняем буферы
    glutPostRedisplay()         # Вызываем процедуру перерисовки

glutInitDisplayMode(GLUT_DOUBLE | GLUT_RGB | GLUT_DEPTH)
glutInitWindowSize(600, 600)
glutInitWindowPosition(50, 50)
glutInit(sys.argv)
glutCreateWindow(b"OpenGL Second Program!")
# Определяем процедуру, отвечающую за рисование
glutDisplayFunc(draw)
# Определяем процедуру, отвечающую за обработку обычных клавиш
glutKeyboardFunc(keyboardkeys)
# Вызываем нашу функцию инициализации
init()
glutMainLoop()

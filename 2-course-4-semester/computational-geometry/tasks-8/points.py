import math


class Point:
    def __init__(self, x, y):
        self.x = x
        self.y = y

    def __str__(self):
        return f"({format(self.x, '.2f')}, {format(self.y, '.2f')})"

    def distanceTo(self, point):
        return math.sqrt((self.x-point.x)**2 + (self.y-point.y)**2)

class Line:
    def __init__(self, a, b, c):
        self.a = a
        self.b = b
        self.c = c

    def __str__(self):
        signb = "+" if self.b > 0 else "-"
        signc = "+" if self.c > 0 else "-"
        return f"{format(self.a, '.2f')}x {signb} {format(abs(self.b), '.2f')}y {signc} {format(abs(self.c), '.2f')} = 0"

    @staticmethod
    def fromCoord(x1, y1, x2, y2):
        return Line(y1-y2, x2-x1, x1*y2-x2*y1)


    def distanceToZero(self):
        return abs(self.c)/math.sqrt(self.a**2+self.b**2)

    def distanceToPoint(self, point):
        return abs(self.a*point.x + self.b*point.y + self.c)/math.sqrt(self.a**2+self.b**2)

    def isParallel(self, line):
        return self.a*line.b - line.a*self.b == 0 or abs(self.a*line.b - line.a*self.b) <= 0.001

    def intersection(self, line):
        zn = self.a*line.b - line.a*self.b
        if abs(zn) <= 0.001:
            return None
        x = -(self.c*line.b-line.c*self.b)/zn
        y = -(self.a*line.c-line.a*self.c)/zn
        pt = Point(x, y)
        return pt

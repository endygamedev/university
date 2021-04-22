import math


class Vector3:
    def __init__(self, x, y, z):
        self.x = x
        self.y = y
        self.z = z

    def __str__(self):
        return f"({format(self.x, '.2f')}, {format(self.y, '.2f')}, {format(self.z, '.2f')})"

    def len(self):
        return math.sqrt(self.x**2 + self.y**2 + self.z**2)

    def norm(self):
        return Vector3(0, 0, 0) if all((self.x == 0, self.y == 0, self.z == 0)) else Vector3(self.x/self.len(), self.y/self.len(), self.z/self.len())

    def xR(self, r):
        return Vector3(r*self.x, r*self.y, r*self.z)

    def plusV(self, vec):
        return Vector3(self.x + vec.x, self.y + vec.y, self.z + vec.z)

    def minusV(self, vec):
        return Vector3(self.x - vec.x, self.y - vec.y, self.z - vec.z)

    def dotV(self, vec):
        return self.x*vec.x + self.y*vec.y + self.z*vec.z

    def xV(self, vec):
        return Vector3(self.y*vec.z - self.z*vec.y, self.z*vec.x - self.x*vec.z, self.x*vec.y - self.y*vec.x)


class Matrix3x3:
    def __init__(self, a, b, c):
        self.a = a
        self.b = b
        self.c = c

    def __str__(self):
        return f"({self.a},\n {self.b},\n {self.c})"

    def I():
        return Matrix3x3(Vector3(1, 0, 0), Vector3(0, 1, 0), Vector3(0, 0, 1))

    def xR(self, r):
        return Matrix3x3(self.a.xR(r), self.b.xR(r), self.c.xR(r))

    def plusM(self, mat):
        return Matrix3x3(self.a.plusV(mat.a), self.b.plusV(mat.b), self.c.plusV(mat.c))

    def minusM(self, mat):
        return Matrix3x3(self.a.minusV(mat.a), self.b.minusV(mat.b), self.c.minusV(mat.c))

    def xV(self, vec):
        return Vector3(self.a.dotV(vec), self.b.dotV(vec), self.c.dotV(vec))

    def xM(self, mat):
        col1 = Vector3(mat.a.x, mat.b.x, mat.c.x)
        col2 = Vector3(mat.a.y, mat.b.y, mat.c.y)
        col3 = Vector3(mat.a.z, mat.b.z, mat.c.z)
        row1 = Vector3(self.a.dotV(col1), self.a.dotV(col2), self.a.dotV(col3))
        row2 = Vector3(self.b.dotV(col1), self.b.dotV(col2), self.b.dotV(col3))
        row3 = Vector3(self.c.dotV(col1), self.c.dotV(col2), self.c.dotV(col3))
        return Matrix3x3(row1, row2, row3)

    def MRot(vec, angle):
        S = Matrix3x3(Vector3(0, vec.z, -vec.y), Vector3(-vec.z, 0, vec.x), Vector3(vec.y, -vec.x, 0))
        return Matrix3x3.I().plusM(S.xR(math.sin(angle))).plusM(S.xM(S).xR(1-math.cos(angle)))

v0 = Vector3(4, 5, 6)
v1 = Vector3(1, 2.5, 4.7)
v2 = Vector3(1, 1, 0)
m = Matrix3x3(v0, v1, v2)
m1 = Matrix3x3.I()
m2 = Matrix3x3.MRot(v1, 3)
print(v1)
print(v1.len())
print(v1.norm().len())
print(v0.norm())
print(v1.xR(5))
print(v1.plusV(v0))
print(v0.minusV(v1))
print(v0.dotV(v1))
print(v0.xV(v1))
print(m)
print(m1)
print(m1.xR(3))
print(m.plusM(m1))

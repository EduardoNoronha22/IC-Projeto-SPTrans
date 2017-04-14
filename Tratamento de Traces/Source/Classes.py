from geopy.distance import vincenty

class veiculo(object):
    def set_id(self, i):
        self.id = i

    def get_id(self):
        return int(self.id)

    def set_data(self, d):
        self.data = d

    def get_data(self):
        return str(self.data)

    def set_x(self, a):
        origem = (41.9, 12.4)
        auxiliar = (a, 0.0)
        self.x = (vincenty(auxiliar, origem).kilometers) - 1000

    def set_y(self, b):
        origem = (41.9, 12.4)
        auxiliar = (b, 0.0)
        self.y = (vincenty(auxiliar, origem).kilometers) - 3400

    def set_horario(self, h):
        self.horario = h

    def __str__(self):
        return str(self.id) + " " + str(self.data)+ "," + str(self.horario) + "," + \
               str(self.x) + "," + str(self.y)

    def __str1__(self):
        return " " + str(self.data) + "," + str(self.horario) + "," + \
            str(self.x) + "," + str(self.y)
from animals import Animal

class AnimalRegistry:
    def __init__(self):
        self.animals = []

    def add_animal(self, animal):
        self.animals.append(animal)

    def list_commands(self, animal_name):
        for animal in self.animals:
            if animal.name == animal_name:
                return animal.list_commands()
        return []

    def train_animal(self, animal_name, new_command):
        for animal in self.animals:
            if animal.name == animal_name:
                animal.add_command(new_command)
                return True
        return False

    def list_animals_by_birth_date(self):
        sorted_animals = sorted(self.animals, key=lambda x: x.birth_date)
        return sorted_animals
class Animal:
    total_count = 0

    def __init__(self, name, birth_date):
        self.name = name
        self.birth_date = birth_date
        self.commands = []

        Animal.total_count += 1

    def add_command(self, command):
        self.commands.append(command)

    def list_commands(self):
        return self.commands

    def train_command(self, new_command):
        self.add_command(new_command)

class Dog(Animal):
    pass

class Cat(Animal):
    pass

class Hamster(Animal):
    pass

class Horse(Animal):
    pass

class Donkey(Animal):
    pass

class Camel(Animal):
    pass
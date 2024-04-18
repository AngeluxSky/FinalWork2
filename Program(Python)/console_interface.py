from animal_registry import AnimalRegistry
from animals import Dog, Cat, Hamster, Horse, Camel, Donkey
from counter import count_total_animals

def main():
    registry = AnimalRegistry()

    while True:
        print("\nМеню:")
        print("1. Добавить животное")
        print("2. Вывести список команд животного")
        print("3. Обучить животное новой команде")
        print("4. Вывести список животных по дате рождения")
        print("5. Выйти из программы")

        choice = input("\nВыберите действие: ")

        if choice == "1":
            print("\nДобавление животного:")
            add_animal(registry)
        elif choice == "2":
            print("\nСписок команд животного:")
            list_commands(registry)
        elif choice == "3":
            print("\nОбучение новой команде:")
            train_animal(registry)
        elif choice == "4":
            print("\nСписок животных по дате рождения:")
            list_animals_by_birth_date(registry)
        elif choice == "5":
            print("\nДо свидания ;)")
            break
        else:
            print("\nНеверный ввод. Попробуйте снова.")

def add_animal(registry):
    name = input("Введите имя животного: ")
    birth_date = input("Введите дату рождения животного: ")
    animal_type = input("Введите тип животного (например, dog, cat): ")

    if animal_type.lower() == "dog":
        animal = Dog(name, birth_date)
    elif animal_type.lower() == "cat":
        animal = Cat(name, birth_date)
    elif animal_type.lower() == "hamster":
        animal = Hamster(name, birth_date)
    elif animal_type.lower() == "horse":
        animal = Horse(name, birth_date)
    elif animal_type.lower() == "camel":
        animal = Camel(name, birth_date)
    elif animal_type.lower() == "donkey":
        animal = Donkey(name, birth_date)
    else:
        print("Неподдерживаемый тип животного.")
        return

    registry.add_animal(animal)
    print(f"\nЖивотное {name} успешно добавлено.")

    print(f"Общее количество созданных животных: {count_total_animals()}")

def list_commands(registry):
    animal_name = input("Введите имя животного: ")
    commands = registry.list_commands(animal_name)
    if commands:
        print(f"Список команд для животного {animal_name}: {', '.join(commands)}")
    else:
        print(f"Животное {animal_name} не найдено.")

def train_animal(registry):
    animal_name = input("Введите имя животного: ")
    new_command = input("Введите новую команду для обучения: ")
    if registry.train_animal(animal_name, new_command):
        print(f"Животное {animal_name} успешно обучено новой команде.")
    else:
        print(f"Животное {animal_name} не найдено.")

def list_animals_by_birth_date(registry):
    animals = registry.list_animals_by_birth_date()
    if animals:
        for animal in animals:
            print(f"{animal.name}: {animal.birth_date}")
    else:
        print("Животные не найдены.")

if __name__ == "__main__":
    main()
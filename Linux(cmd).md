**Использование команды cat в Linux**
---
1. Создаём файл "Pets" и произведём запись:
- *cat > Pets*

Dog

Cat

Hamster



2. Создаём файл "Pack animals" и произведём запись:
- *cat > "Pack animals"*

Horse

Camel

Donkey

---

3. Объединяем содержимое двух файлов "Pets" и "Pack animals" в один файл и переименовываем в "HumanFriends.txt":
- *cat Pets "Pack animals" > HumanFriends.txt*

---

4. Просмотр содержимого в новом файле:
-  *cat HumanFriends.txt*

***Доп. - Проверяем результат: - ls*** 

---

**Работа с директориями в Linux**
---

1. Создаём новую директорию (в моём случае, я создам Friends):

-  *mkdir Friends*

---

2. Переместим файл "HumanFriends.txt" в созданную директорию:

-  *mv HumanFriends.txt Friends/*

***Доп. - Проверяем результат: - ls*** 

---

3. Переходим в новую директорию "Friends":
-  *cd Friends*

***Доп. - Так же проверяем результат: - ls*** 

---

**Работа с MySQL в Linux. “Установить MySQL на вашу вычислительную машину”**
---

11. Установим MySQL (актуальной версии):

-  *sudo wget https://dev.mysql.com/get/mysql-apt-config_0.8.23-1_all.deb*
-  *sudo dpkg -i mysql-apt-config_0.8.23-1_all.deb*
-  *sudo apt-get update*
-  *sudo apt-get install mysql-server*
---

**Управление deb-пакетами**
---

12. Установим deb-пакет на примере Zoom:

-  *wget https://zoom.us/client/latest/zoom_amd64.deb*
-  *sudo dpkg -i zoom_amd64.deb*
-  *sudo dpkg -r zoom*
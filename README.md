# Добавляет файл лицензии в файлы .py и .sh проекта.
## Пример использования
```bash
# Example use script: ./add_license.sh [-h help] [-f ./license ] [-autor 'Oleg Neoleg'] ./my_project
./add_license.sh ./my_project
./add_license.sh -f ./license -autor "Anton Ivanov" ./project
```
## Шаблон лицензии
```txt
#File: {file} - имя файла
#Project: {project} - дериктория проекта
#Autor: {autor} - автор
# Здесь идет текст лиценизи
```
### После выполнения в папке со скриптом создается файл log, там указываются файлы в которые была добавлена лицензия.

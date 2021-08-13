# Добовляет файл лицензии в файлы .py и .sh проэкта.
## Пример использования
```bash
# Example use script: ./add_license.sh [-h help] [-f ./license ] [-autor 'Oleg Neoleg'] ./my_project
./add_license.sh ./my_project
./add_license.sh -f ./license -autor "Anton Ivanov" ./project
```
## Шаблон лицензии
```txt
#File: {file} - имя файла
#Project: {project} - дериктория проэкта
#Autor: {autor} - автор
# Здесь идет текст лиценизи
```
### После выполнения в папке со скриптом создается файл log, там указываються файлы в которые была добавлена лицензия.

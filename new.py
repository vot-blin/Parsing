import requests
import psycopg2

# Подключение к базе данных
def get_vacancies():
    url = 'https://api.hh.ru/vacancies'
    params = {'text': 'python', 'area': '1', 'per_page': 50}
    response = requests.get(url, params=params)
    vacancies_data = response.json()
    return vacancies_data
conn = psycopg2.connect(dbname='postgres', user='postgres',
                        password='dcfv147', host='localhost')
cur = conn.cursor()

# Удаление таблицы vacancies, если она уже существует
cur.execute('DROP TABLE IF EXISTS vacancies')
conn.commit()

# Создание таблицы vacancies
cur.execute("CREATE TABLE vacancies (id SERIAL PRIMARY KEY, name VARCHAR, company VARCHAR, salary VARCHAR, url TEXT);")
conn.commit()

vacancies = get_vacancies()
# Парсинг данных и сохранение их в базу данных
for vacancy in vacancies['items']:
    name = vacancy['name']
    company = vacancy['employer']['name']
    salary = vacancy['salary']['from'] if vacancy['salary'] is not None else None
    url = vacancy['alternate_url']

    cur.execute('''INSERT INTO vacancies (name, company, salary, url) 
                   VALUES (%s, %s, %s, %s)''', (name, company, salary, url))
    conn.commit()

conn.close()
import telebot, wikipedia, re
import psycopg2
from sklearn.feature_extraction.text import CountVectorizer
from sklearn.linear_model import LogisticRegression

#bot = telebot.TeleBot('Ваш ключ от BotFather')
#bot = telebot.TeleBot('6320585106:AAE4Vf8rkttQen7b7ty-c8Pi__Wo3Uf0B2Q')
bot = telebot.TeleBot('7108687276:AAHkeCewHsJDV5AF2s48ivDbCUiXmVomud0')

wikipedia.set_lang("ru")

def clean_str(r):
	r = r.lower()
	r = [c for c in r if c in alphabet]
	return ''.join(r)

alphabet = ' 1234567890-йцукенгшщзхъфывапролджэячсмитьбюёqwertyuiopasdfghjklzxcvbnm?%.,()!:;'

def update():
    with open('C:/Users/User/dialogues.txt', encoding='utf-8') as f:
        content = f.read()
    blocks = content.split('\n')
    dataset = []
    for block in blocks:
        replicas = block.split('\\')[:2]
        if len(replicas) == 2:
            pair = [clean_str(replicas[0]), clean_str(replicas[1])]
            if pair[0] and pair[1]:
                dataset.append(pair)

    X_text = []
    y = []

    for question, answer in dataset[:10000]:
        X_text.append(question)
        y += [answer]

    global vectorizer
    vectorizer = CountVectorizer()
    X = vectorizer.fit_transform(X_text)

    global clf
    clf = LogisticRegression()
    clf.fit(X, y)


update()
def get_generative_replica(text):
        text_vector = vectorizer.transform([text]).toarray()[0]
        question = clf.predict([text_vector])[0]
        return question

def getwiki(s):
    try:
        ny = wikipedia.page(s)
        wikitext=ny.content[:1500]
        wikimas=wikitext.split('.')
        wikimas = wikimas[:-1]
        wikitext2 = ''
        for x in wikimas:
            if not('==' in x):
                if(len((x.strip()))>3):
                   wikitext2=wikitext2+x+'.'
            else:
                break
        #wikitext2=re.sub('\([^()]*\)', '', wikitext2)
        #wikitext2=re.sub('\([^()]*\)', '', wikitext2)
        #wikitext2=re.sub('\{[^\{\}]*\}', '', wikitext2)
        return wikitext2
    except Exception as e:
        return 'В энциклопедии нет информации об этом'

@bot.message_handler(commands=['старт'])
def start_message(message):
	bot.send_message(message.chat.id,"Здравствуйте, Сэр.Мы начинаем работу.")

question = ""

@bot.message_handler(content_types=['text'])
def get_text_messages(message):
        command = message.text.lower()
        ss=" ".join(("Команда1 --",command))
        bot.send_message(message.chat.id,ss)
        if command =="вакансия":
#                bot.send_message(message.chat.id,ss)
                bot.send_message(message.from_user.id, "Укажите специализацию, город через , ?")
                bot.register_next_step_handler(message, wrong1)
        else:
                global question
                question = command
#                bot.send_message(message.chat.id,ss)
                reply = get_generative_replica(command)
                ss=" ".join(("Вопрос -",reply,"."))
                bot.send_message(message.chat.id,ss)
                if reply=="вики":
                        bot.send_message(message.from_user.id, getwiki(command))
                else:
                        bot.send_message(message.from_user.id, reply)
def wrong1(message):
        command1 = message.text.lower()
        ss1=" ".join(("Ищем вакансии --",command1))
        bot.send_message(message.from_user.id,ss1)
        pp4=message.text.lower()
        nn1=pp4.find(',')
        ss2=pp4.partition(',')
        ll1=len(pp4)
        if nn1>0 :
              pp1=pp4[0:nn1-1].strip() # специализация
#              pp1=ss2[0]
              pp5=pp4[nn1+1:ll1]   # город
              pp5=pp5.strip()
        else:
              pp1=pp4
              pp5='москва'   # город
#        bot.send_message(message.chat.id,pp1)
        db_config = {
        'dbname': 'postgres',
        'user': 'postgres',
        'password': 'dcfv147',
        'host': 'localhost',
        'port': '5432'}
        conn=psycopg2.connect(**db_config)
        cursor = conn.cursor()
        postgreSQL_select_Query = "select * from vacancies"
        cursor.execute(postgreSQL_select_Query)
#        print("Selecting rows from publisher table using cursor.fetchall")
        publisher_records = cursor.fetchall()
#        print("Print each row and it's columns values")
        for row in publisher_records:
            pp=row[1].lower()
            pp6=row[1].lower()
            nn3=pp6.find(pp5)
#           bot.send_message(message.chat.id,pp6)
#            bot.send_message(message.chat.id,str(nn3))
            nn2=pp.find(pp1)
            if nn2>0 :
#                    bot.send_message(message.chat.id,pp6)
#                    bot.send_message(message.chat.id,str(len(pp6)))
#                    bot.send_message(message.chat.id,str(len(pp5)))
                    if nn3==-1 :
                            ss=" ".join(map(str,row))
                            bot.send_message(message.chat.id,ss)
#            else:
#                    bot.send_message(message.from_user.id,"Не найдено вакансии")
#                    bot.send_message(message.chat.id,pp)

        conn.commit()
        cursor.close()
        bot.send_message(message.from_user.id, "Поиск закончен")
def wrong(message):
#	a = f"{question}\{message.text.lower()} \n"
#	with open('dialogues.txt', "a", encoding='utf-8') as f:
#		f.write(a)
        bot.send_message(message.from_user.id, "Готово")
#        return
#	update()
bot.polling(none_stop=True)

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create!([
  { email: 'moderator@test.com', password: 'pass987$', first_name: 'Moderator' },
  { email: 'user_1@test.com', password: 'pass12#', first_name: 'User one' },
  { email: 'user_2@test.com', password: 'pass27#', first_name: 'User two' }
])

moderator = User.find_by(first_name: :Moderator)

categories = Category.create!([
                               { title: 'Информатика' },
                               { title: 'Языки програмирования' },
                               { title: 'Операционные системы' }
                             ])
tests = Test.create!([
                      { title: 'Информатика, Информационные технологии', category: categories[0], author: moderator },
                      { title: 'Аппаратное обеспечение ЭВМ', level: 1, category: categories[0], author: moderator },
                      { title: 'Язык Си', category: categories[1], author: moderator },
                      { title: 'Lunix', level: 1, category: categories[2], author: moderator },
                      { title: 'Windows', level: 1, category: categories[2], author: moderator }
                    ])


questions = Question.create!([
                              { body: 'Один Килобайт равен?', test: tests[0] },
                              { body: 'Минимальная единица количества информации называется?', test: tests[0] },
                              { body: 'BIOS хранится?', test: tests[1] },
                              { body: 'Устройство, предназначенное для вывода информации на бумагу, называется', test: tests[1] },
                              { body: 'Является ли язык программирования Си объектно-ориентированным?', test: tests[2] },
                              { body: 'KDE, GNOME, Xfce — это названия?', test: tests[3] },
                              { body: 'Создатель операционной системы Linux?', test: tests[3] },
                              { body: 'Современные операционные системы компании Microsoft носят название?', test: tests[4] },
                              { body: 'Windows 3.1 — это название', test: tests[4] }
                            ])


Answer.create!([
                { body: '720 байтам', question: questions[0] },
                { body: '1024 байтам', correct: true, question: questions[0] },
                { body: '1000 байтам',  question: questions[0] },

                { body: 'Слова', question: questions[1] },
                { body: 'Байт', question: questions[1] },
                { body: 'Бит', correct: true, question: questions[1] },

                { body: 'в ПЗУ', correct: true, question: questions[2] },
                { body: 'в ОЗУ', question: questions[2] },
                { body: 'на HDD', question: questions[2] },
                { body: 'на CD', question: questions[2] },

                { body: 'LCD-монитор', question: questions[3] },
                { body: 'сканер', question: questions[3] },
                { body: 'принтер', correct: true, question: questions[3] },
                { body: 'CRT-монитор', question: questions[3] },

                { body: 'Да', question: questions[4] },
                { body: 'Нет', correct: true, question: questions[4] },

                { body: 'оболочек операционной системы Linux', correct: true, question: questions[5] },
                { body: 'операционных систем', question: questions[5] },
                { body: 'графических редакторов', question: questions[5] },
                { body: 'браузеров', question: questions[5] },
                { body: 'сред разработки', question: questions[5] },

                { body: 'Билл Гейтс', question: questions[6] },
                { body: 'Линус Торвальдс', correct: true, question: questions[6] },
                { body: 'Пол Аллен', question: questions[6] },

                { body: 'BSD', correct: true, question: questions[7] },
                { body: 'Windows', correct: true, question: questions[7] },
                { body: 'Microsoft', question: questions[7] },
                { body: 'MacOS', question: questions[7] },

                { body: 'одной из оболочек операционной системы MS DOS', correct: true, question: questions[8] },
                { body: 'текстового редактора', question: questions[8] }
              ])

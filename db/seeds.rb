# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create!([
  { first_name: 'Igor', last_name: 'Ivanov', email: 't_guru@list.ru', password: 'pass987' },
  { first_name: 'Vika', last_name: 'Sidorova', email: 'vika1980@list.ru', password: 'pass12' },
  { first_name: 'Anton', last_name: 'Kipa', email: 'anton12@list.ru', password: 'pass27' }
])

moderator = User.first

categories = Category.create!([
                                { title: 'Frontend' },
                                { title: 'Backend' },
                                { title: 'Mobile' }
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
BadgeRule.create!([
                   { name: 'Successful passing of all frontend tests', kind: 1, value: categories[0].id },
                   { name: 'Successful passing of all backend tests', kind: 1, value: categories[1].id },
                   { name: 'Successful passing of all mobile tests', kind: 1, value: categories[2].id },
                   { name: 'Successful passing of all level 1 tests', kind: 2, value: 1 },
                   { name: 'Successful passing of all level 2 tests', kind: 2, value: 2 },
                   { name: 'Successful passing of all level 3 tests', kind: 2, value: 3 },
                   { name: 'Successfully passing the test on the first try', kind: 0, value: 0 }
                  ])

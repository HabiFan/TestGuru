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
                      { title: 'Информатика, Информационные технологии', category_id: categories[0].id, author_id: moderator.id },
                      { title: 'Аппаратное обеспечение ЭВМ', level: 1, category_id: categories[0].id, author_id: moderator.id },
                      { title: 'Язык Си', category_id: categories[1].id, author_id: moderator.id },
                      { title: 'Lunix', level: 1, category_id: categories[2].id, author_id: moderator.id },
                      { title: 'Windows', level: 1, category_id: categories[2].id, author_id: moderator.id }
                    ])


questions = Question.create!([
                              { body: 'Один Килобайт равен?', test_id: tests[0].id },
                              { body: 'Минимальная единица количества информации называется?', test_id: tests[0].id },
                              { body: 'BIOS хранится?', test_id: tests[1].id },
                              { body: 'Устройство, предназначенное для вывода информации на бумагу, называется', test_id: tests[1].id },
                              { body: 'Является ли язык программирования Си объектно-ориентированным?', test_id: tests[2].id },
                              { body: 'KDE, GNOME, Xfce — это названия?', test_id: tests[3].id },
                              { body: 'Создатель операционной системы Linux?', test_id: tests[3].id },
                              { body: 'Современные операционные системы компании Microsoft носят название?', test_id: tests[4].id },
                              { body: 'Windows 3.1 — это название', test_id: tests[4].id }
                            ])


Answer.create!([
                { body: '720 байтам', question_id: questions[0].id },
                { body: '1024 байтам', correct: true, question_id: questions[0].id },
                { body: '1000 байтам',  question_id: questions[0].id },

                { body: 'Слова', question_id: questions[1].id },
                { body: 'Байт', question_id: questions[1].id },
                { body: 'Бит', correct: true, question_id: questions[1].id },

                { body: 'в ПЗУ', correct: true, question_id: questions[2].id },
                { body: 'в ОЗУ', question_id: questions[2].id },
                { body: 'на HDD', question_id: questions[2].id },
                { body: 'на CD', question_id: questions[2].id },

                { body: 'LCD-монитор', question_id: questions[3].id },
                { body: 'сканер', question_id: questions[3].id },
                { body: 'принтер', correct: true, question_id: questions[3].id },
                { body: 'CRT-монитор', question_id: questions[3].id },

                { body: 'Да', question_id: questions[4].id },
                { body: 'Нет', correct: true, question_id: questions[4].id },

                { body: 'оболочек операционной системы Linux', correct: true, question_id: questions[5].id },
                { body: 'операционных систем', question_id: questions[5].id },
                { body: 'графических редакторов', question_id: questions[5].id },
                { body: 'браузеров', question_id: questions[5].id },
                { body: 'сред разработки', question_id: questions[5].id },

                { body: 'Билл Гейтс', question_id: questions[6].id },
                { body: 'Линус Торвальдс', correct: true, question_id: questions[6].id },
                { body: 'Пол Аллен', question_id: questions[6].id },

                { body: 'BSD', correct: true, question_id: questions[7].id },
                { body: 'Windows', correct: true, question_id: questions[7].id },
                { body: 'Microsoft', question_id: questions[7].id },
                { body: 'MacOS', question_id: questions[7].id },

                { body: 'одной из оболочек операционной системы MS DOS', correct: true, question_id: questions[8].id },
                { body: 'текстового редактора', question_id: questions[8].id }
              ])

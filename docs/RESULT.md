# Целевая платформа

Android 11, 12

# Результаты

Я участник курса Flutter Surf к завершению которого я близок. Прохожу его с прошлого лета, как заметили менторы курса мне он непросто даётся и за это я им благодарен, так как ответов они не давали но помогли учиться. Благодаря пройденным заданиям я радовался каждой новой фиче, которую смог реализовать ибо за этим скрывались дни, недели, а то и месяцы неудачных попыток. Благодаря чему моя уверенность в том, что я любую задачу могу закрыть росла. 
В силу моего опыта я не могу похвастаться скоростью выполнения заданий, но факт что оно будет сделано гарантирован.

Начав выполнять задание из джема, я заметил что идёт работа с файлами, которые как раз рассматриваются на курсе в следующих темах, которые пока закрыты. Покритиковав себя за то, что не успел их пройти, приступил к заданию. Я не имел опыта в загрузке файлов при помощи Flutter. Спасала только уверенность, обретённая во время прохождения курса, дающая какое-то глобальное понимание как всё устроено. Просмотрев задания, я трезво отдал себе отчёт в том, что за сегодня я не успею всё выполнить, но это не значит что вообще не выполнил бы.

Первое, что реализовал было банальное добавление файлов в список. Но столкнулся со сложностью что не обновлялся список. Пришла в голову идея сразу реализовать Bloc. Хорошо я успел поработать с Bloc на курсе (собственно один из основных пунктов почему выбрал этот курс), так до этого была только сухая теория и глобальное непонимание Bloc на практике. 
Написав троицу (блок, эвенты и стэйт) принялся за отрисовку добавленных мест. Конечно у меня получилось сразу, но рано обрадовался, добавляло только одно место в список!
Остальные ни в какую. Потратил время на разбор, так видать торопился что забыл в Equatable в props указать поля, которые надо сравнивать - из-за него то и не перестраивалось.
Решив проблему, обдумывал задание, и решил начать с валидации. Часы гугления и готово понимание как она устроена, и что есть готовые RegExp для url. 

Увидев страшное количество символов на стэковерфлоу к коменту на подобный вопрос, я понял что такое сам бы и не написал и воспользовавшись любимым методом начинающих разработчиков скопипастил это дело. И вот уже валидация работает. Немного причесав её двинулся далее. С обрезанием окончания ссылки для вставки в тайтл особых проблем не возникло.
И тут File. И первая мысль как с ним вообще работать. А время поджимает уже, вечер. О5 гугл, ютуб и сбор информации. Страшные методы openSync, writeFromSync. Глаза боятся, руки делают. Не сразу метод загрузки получилось собрать, скачанный файл не открывался. Уже и не помню почему, что-то я наколдовал там и оно заработало и наконец-то скачанный файл открылся!

С прогресс баром и размером в МБ таска интересная. Тут я понимал что не силён в таких моментах ещё, не приходилось ни разу в ручную настраивать. Покопавшись в инете решение было найдено.
Иконки поменять было уже не сложно.
Остановку загрузки нашёл как делать, но возобновление не вышло - оставил эту затею, так как оставались уже минуты.
И тут time's up. Я понимаю что получилось сделать даже больше, чем ожидал. Да, я не успел подключить БД, и сделать остальные части задания - но уверенность что сделаю имеется. 

Ф-ух, вроде всё!
Если вы до сюда дочитали, дикий вам респектос. Я не знаю чем хвастаться просто, так как в чате вижу много людей куда шустрее меня в этом деле, поэтому просто описываю историю взаимодействия с данным проектом, так как мне дало удовлетворение что я смог сделать что-то, с чем ещё не сталкивался так подробно. Наверное это достижение.

# Ссылки на демонстрацию работы/скриншоты

Здесь видна реализация риппл эффекта, который я научился делать на курсе:

https://user-images.githubusercontent.com/91142494/230793109-7c276088-6327-45f6-b587-0c3723c56411.mp4

Демонстрация загрузки нескольких pdf'ок:

https://user-images.githubusercontent.com/91142494/230793144-5759d316-4481-4657-82b5-251b68cf2af5.mp4

Демонстрация процесса открытия скачанного pdf:

https://user-images.githubusercontent.com/91142494/230793190-6000a343-7528-4d57-abd1-63d9c29ff79e.mp4

Демонстрация работы валидатора:

https://user-images.githubusercontent.com/91142494/230793216-dac5fe2b-9391-4b2c-93e3-667ed04f562f.mov

Скриншоты:
1. Пустой стэйт. 2. Демонстрация неактивной кнопки "Добавить". 3. Валидатор - пустое поле.
<div style="display: flex;">
  <img src="https://user-images.githubusercontent.com/91142494/230793259-661e57d0-d409-43f3-905e-a6a881bda581.png" width="30%">
  <img src="https://user-images.githubusercontent.com/91142494/230793306-5f069a53-6fbe-4e12-9220-8c1853abd61c.png" width="30%">
  <img src="https://user-images.githubusercontent.com/91142494/230793343-1ca4c13e-9ef4-48e6-b899-149d926b0cbc.png" width="30%">
</div>

4. Валидатор - невалидное значение. 5. Валидатор - валидное значение. Кнопка "Добавить" активна. 6. Автоподстановка текста если он содержит ссылку на pdf файл.
<div style="display: flex;">
  <img src="https://user-images.githubusercontent.com/91142494/230793385-e232fb78-2f8a-4d36-959b-a035353be95f.png" width="30%">
  <img src="https://user-images.githubusercontent.com/91142494/230793410-cad1a8ce-e345-457f-9e87-dbc09efa0f41.png" width="30%">
  <img src="https://user-images.githubusercontent.com/91142494/230793463-a267cf5f-fc91-4cb8-96b9-d8af08d794cb.png" width="30%">
</div>


7. Демонстрация снэкбара об успешном добавлении файла для скачивания. 8. Демонстрация нескольких файлов готовых к скачиванию. 9. Демонстрация открытого pdf файла.
<div style="display: flex;">
  <img src="https://user-images.githubusercontent.com/91142494/230793520-02b67dcb-e5e7-425f-93e8-d3d1c03e619f.png" width="30%">
  <img src="https://user-images.githubusercontent.com/91142494/230793561-219cfe7c-d8d1-4f91-b1bc-9187d27f52be.png" width="30%">
  <img src="https://user-images.githubusercontent.com/91142494/230793584-790b6800-8713-4265-8ff8-696a9298e9b5.png" width="30%">
</div>


10. Демонстрация процессов (ожидает, загружается, остановлен, загружен)
<div style="display: flex;">
  <img src="https://user-images.githubusercontent.com/91142494/230793626-94bcd743-cb6c-4a9d-a18f-02d749b31c8a.png" width="30%">
</div>








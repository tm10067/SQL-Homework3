/* Урок 3. SQL – выборка данных, сортировка, агрегатные функции
Написать скрипт, возвращающий список имен (только firstname) пользователей без повторений в алфавитном порядке. [ORDER BY]
Выведите количество мужчин старше 35 лет [COUNT].
Сколько заявок в друзья в каждом статусе? (таблица friend_requests) [GROUP BY]
Выведите номер пользователя, который отправил больше всех заявок в друзья (таблица friend_requests) [LIMIT].
* Выведите названия и номера групп, имена которых состоят из 5 символов [LIKE]. */

USE vk;

/* Написать скрипт, возвращающий список имен (только firstname) пользователей без повторений в алфавитном порядке. [ORDER BY] */

  SELECT DISTINCT firstname
    FROM vk.users
ORDER BY firstname ASC;

/* Выведите количество мужчин старше 35 лет [COUNT]. */

SELECT COUNT(user_id) 
    AS number_of_males_above_35_years
  FROM vk.profiles
 WHERE gender = 'm' AND birthday < DATE_ADD(CURDATE(), INTERVAL -35 YEAR);

/* Сколько заявок в друзья в каждом статусе? (таблица friend_requests) [GROUP BY] */

  SELECT status, COUNT(requested_at)
	  AS number_of_requests_per_status
	FROM vk.friend_requests
GROUP BY status;

/* Выведите номер пользователя, который отправил больше всех заявок в друзья (таблица friend_requests) [LIMIT]. */

  SELECT initiator_user_id
      AS top_initiator_id
    FROM vk.friend_requests
GROUP BY initiator_user_id
ORDER BY COUNT(requested_at) DESC
   LIMIT 1;
   
/* Выведите названия и номера групп, имена которых состоят из 5 символов [LIKE]. */

SELECT name, id
  FROM vk.communities
 WHERE name LIKE '_____';
  
  

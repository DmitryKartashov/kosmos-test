/*
-- создаем таблицу с эвентами
CREATE TABLE event(
	event_id SERIAL PRIMARY KEY,
	user_id CHARACTER VARYING(24),
	media_source CHARACTER VARYING(10),
	client_time TIMESTAMP,
	event_name CHARACTER VARYING(20),
	event_data jsonb,
	session_index INT,
	game_status json
);

-- это пример для переноса датасета в базу данных
INSERT INTO event(user_id,media_source,
                        client_time,
				  		session_index,
				  		game_status,
				  		event_name,
                        event_data)
             VALUES ('60c588d7b4d1b24b40531f29','organic','2021-06-05 07:23:06',1,'{"coins":0,"freeRounds":0,"freeUndo":0,"freeWildCard":0,"freeAddCards":0,"level":0,"map":1,"bet":1,"gladeId":1,"league":0,"VIPPointsAmount":0,"VIPStatus":0}','appInstall','{"device":"Xiaomi POCO M2 Pro","graphicMemory":2048,"systemMemory":5582}');


-- таблица с временем удержания пользователей с момента первого посещения игры
CREATE TABLE times AS
SELECT user_id,
			EXTRACT(day FROM MAX(client_time) - MIN(client_time))*24*60*60 +
			EXTRACT(hours FROM MAX(client_time) - MIN(client_time))*60*60 +
			EXTRACT(minutes FROM MAX(client_time) - MIN(client_time))*60 +
			EXTRACT(seconds FROM MAX(client_time) - MIN(client_time)) AS hold_time
			
	FROM event
	GROUP BY user_id
	ORDER BY hold_time DESC;
*/


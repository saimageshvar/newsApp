PRAGMA foreign_keys=OFF;
BEGIN TRANSACTION;
CREATE TABLE "schema_migrations" ("version" varchar NOT NULL);
INSERT INTO "schema_migrations" VALUES('20160518104409');
INSERT INTO "schema_migrations" VALUES('20160518105917');
INSERT INTO "schema_migrations" VALUES('20160518105934');
INSERT INTO "schema_migrations" VALUES('20160518110101');
CREATE TABLE "users" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "name" varchar, "email" varchar, "password" varchar, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
INSERT INTO "users" VALUES(5,NULL,'xyz',NULL,'2016-05-18 11:23:43.894386','2016-05-18 11:23:43.894386');
CREATE TABLE "feeds" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "name" varchar, "url" text, "c_id" integer, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
INSERT INTO "feeds" VALUES(1,'Business Standard','http://www.business-standard.com/rss/international-116.rss',4,'2016-05-18 11:44:42.261985','2016-05-18 11:46:28.650296');
INSERT INTO "feeds" VALUES(2,'Asian Age','http://dc.asianage.com/rss/37',4,'2016-05-18 11:46:04.361820','2016-05-18 11:46:04.361820');
INSERT INTO "feeds" VALUES(3,'Hindu','http://www.thehindu.com/news/international/?service=rss',4,'2016-05-18 11:46:58.527194','2016-05-18 11:46:58.527194');
INSERT INTO "feeds" VALUES(4,'India Today','http://indiatoday.intoday.in/rss/article.jsp?sid=61',4,'2016-05-18 11:49:28.326557','2016-05-18 11:49:28.326557');
INSERT INTO "feeds" VALUES(5,'CNN IBN','http://www.ibnlive.com/xml/top.xml',1,'2016-05-18 11:53:37.328627','2016-05-18 11:53:37.328627');
INSERT INTO "feeds" VALUES(6,'Hindustan Times','http://feeds.hindustantimes.com/HT-HomePage-TopStories',1,'2016-05-18 11:54:23.562064','2016-05-18 11:54:23.562064');
INSERT INTO "feeds" VALUES(7,'Rediff','http://www.rediff.com/rss/inrss.xml',1,'2016-05-18 11:55:33.450381','2016-05-18 11:55:33.450381');
INSERT INTO "feeds" VALUES(8,'Business Standard','http://www.business-standard.com/rss/home_page_top_stories.rss',1,'2016-05-18 11:56:03.865680','2016-05-18 11:56:03.865680');
INSERT INTO "feeds" VALUES(9,'CNN IBN','http://www.ibnlive.com/xml/rss/business.xml',2,'2016-05-18 11:57:59.059478','2016-05-18 11:57:59.059478');
INSERT INTO "feeds" VALUES(10,'Central Chronicle','http://www.centralchronicle.com/business-news/feed',2,'2016-05-18 11:58:39.976689','2016-05-18 11:58:39.976689');
INSERT INTO "feeds" VALUES(11,'Financial Times','http://www.ft.com/rss/world/asiapacific/india',2,'2016-05-18 11:59:24.163810','2016-05-18 11:59:24.163810');
INSERT INTO "feeds" VALUES(12,'First Post','http://www.firstpost.com/business/feed',2,'2016-05-18 11:59:58.998117','2016-05-18 11:59:58.998117');
INSERT INTO "feeds" VALUES(13,'Free Press','http://www.freepressjournal.in/news/business?amp;feed=rss2',2,'2016-05-18 12:01:03.396131','2016-05-18 12:01:03.396131');
INSERT INTO "feeds" VALUES(14,'Deccan Herald','http://www.deccanherald.com/rss/entertainment.rss',3,'2016-05-18 12:01:47.221421','2016-05-18 12:01:47.221421');
INSERT INTO "feeds" VALUES(15,'Economic Times','http://economictimes.indiatimes.com/rssfeeds/13357410.cms',3,'2016-05-18 12:02:22.877376','2016-05-18 12:02:22.877376');
INSERT INTO "feeds" VALUES(16,'Times of India','http://timesofindia.indiatimes.com/rssfeeds/1081479906.cms',3,'2016-05-18 12:02:51.908641','2016-05-18 12:02:51.908641');
INSERT INTO "feeds" VALUES(17,'CNN IBN','http://www.ibnlive.com/xml/rss/sports.xml',5,'2016-05-18 12:03:39.221015','2016-05-18 12:03:39.221015');
INSERT INTO "feeds" VALUES(18,'First Post','http://www.firstpost.com/sports/feed',5,'2016-05-18 12:04:10.370904','2016-05-18 12:04:10.370904');
INSERT INTO "feeds" VALUES(19,'Free Press','http://www.freepressjournal.in/news/sports?amp;feed=rss2',5,'2016-05-18 12:04:36.352567','2016-05-18 12:04:36.352567');
INSERT INTO "feeds" VALUES(20,'Hindu','http://www.thehindu.com/sport/other-sports/?service=rss',5,'2016-05-18 12:05:03.087077','2016-05-18 12:05:03.087077');
INSERT INTO "feeds" VALUES(21,'CNN IBN','http://www.ibnlive.com/xml/rss/health.xml',6,'2016-05-18 12:05:39.971153','2016-05-18 12:05:39.971153');
INSERT INTO "feeds" VALUES(22,'Economic Times','http://economictimes.indiatimes.com/rssfeeds/13358070.cms',6,'2016-05-18 12:06:19.411557','2016-05-18 12:06:19.411557');
INSERT INTO "feeds" VALUES(23,'New Kerala','http://www.newkerala.com/health-news.xml',6,'2016-05-18 12:07:19.745280','2016-05-18 12:07:19.745280');
CREATE TABLE "categories" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "name" varchar, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
INSERT INTO "categories" VALUES(1,'Breaking News','2016-05-18 11:37:36.896960','2016-05-18 11:37:36.896960');
INSERT INTO "categories" VALUES(2,'Business','2016-05-18 11:37:55.528631','2016-05-18 11:37:55.528631');
INSERT INTO "categories" VALUES(3,'Entertainment','2016-05-18 11:38:08.067866','2016-05-18 11:38:08.067866');
INSERT INTO "categories" VALUES(4,'World','2016-05-18 11:38:25.836589','2016-05-18 11:38:25.836589');
INSERT INTO "categories" VALUES(5,'Sports','2016-05-18 11:38:38.895011','2016-05-18 11:38:38.895011');
INSERT INTO "categories" VALUES(6,'Health','2016-05-18 11:38:58.958227','2016-05-18 11:38:58.958227');
CREATE TABLE "subscribes" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "user_id" integer, "feed_id" integer, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
DELETE FROM sqlite_sequence;
INSERT INTO "sqlite_sequence" VALUES('users',5);
INSERT INTO "sqlite_sequence" VALUES('categories',6);
INSERT INTO "sqlite_sequence" VALUES('feeds',23);
CREATE UNIQUE INDEX "unique_schema_migrations" ON "schema_migrations" ("version");
COMMIT;

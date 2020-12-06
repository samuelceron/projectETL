-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/ALbpIU
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "Games" (
    "appid" int   NOT NULL,
    "name" varchar(250)   NOT NULL,
    "release_date" date   NOT NULL,
    "language" int   NOT NULL,
    "developer" int   NOT NULL,
    "publisher" int   NOT NULL,
    "required_age" int   NOT NULL,
    "achievements" int   NOT NULL,
    "positive_ratings" double   NOT NULL,
    "negative_ratings" double   NOT NULL,
    "average_playtime" double   NOT NULL,
    "median_playtime" double   NOT NULL,
    "owners" int   NOT NULL,
    "price" float   NOT NULL,
    "website" varchar(400)   NOT NULL,
    "support_website" varchar(400)   NOT NULL,
    "support_email" varchar(400)   NOT NULL,
    CONSTRAINT "pk_Games" PRIMARY KEY (
        "appid"
     )
);

CREATE TABLE "Developers" (
    "developerid" int   NOT NULL,
    "name" varchar(300)   NOT NULL,
    CONSTRAINT "pk_Developers" PRIMARY KEY (
        "developerid"
     )
);

CREATE TABLE "Publishers" (
    "publisherid" int   NOT NULL,
    "name" varchar(300)   NOT NULL,
    CONSTRAINT "pk_Publishers" PRIMARY KEY (
        "publisherid"
     )
);

CREATE TABLE "Language" (
    "languageid" int   NOT NULL,
    "language" varchar(20)   NOT NULL,
    CONSTRAINT "pk_Language" PRIMARY KEY (
        "languageid"
     )
);

CREATE TABLE "Platforms" (
    "platformid" int   NOT NULL,
    "name" varchar   NOT NULL,
    CONSTRAINT "pk_Platforms" PRIMARY KEY (
        "platformid"
     )
);

CREATE TABLE "Categories" (
    "categorieid" int   NOT NULL,
    "name" varchar(150)   NOT NULL,
    CONSTRAINT "pk_Categories" PRIMARY KEY (
        "categorieid"
     )
);

CREATE TABLE "Genres" (
    "genreid" int   NOT NULL,
    "name" varchar(150)   NOT NULL,
    CONSTRAINT "pk_Genres" PRIMARY KEY (
        "genreid"
     )
);

CREATE TABLE "Tags" (
    "tagid" int   NOT NULL,
    "name" varchar(150)   NOT NULL,
    CONSTRAINT "pk_Tags" PRIMARY KEY (
        "tagid"
     )
);

CREATE TABLE "Owners" (
    "ownersid" int   NOT NULL,
    "range" varchar(30)   NOT NULL,
    CONSTRAINT "pk_Owners" PRIMARY KEY (
        "ownersid"
     )
);

CREATE TABLE "Game_Platform" (
    "appid" int   NOT NULL,
    "platformid" int   NOT NULL,
    CONSTRAINT "pk_Game_Platform" PRIMARY KEY (
        "appid","platformid"
     )
);

CREATE TABLE "Game_Categorie" (
    "appid" int   NOT NULL,
    "categorieid" int   NOT NULL,
    CONSTRAINT "pk_Game_Categorie" PRIMARY KEY (
        "appid","categorieid"
     )
);

CREATE TABLE "Game_Genre" (
    "appid" int   NOT NULL,
    "genreid" int   NOT NULL,
    CONSTRAINT "pk_Game_Genre" PRIMARY KEY (
        "appid","genreid"
     )
);

CREATE TABLE "Game_Tag" (
    "appid" int   NOT NULL,
    "tagid" int   NOT NULL,
    CONSTRAINT "pk_Game_Tag" PRIMARY KEY (
        "appid","tagid"
     )
);

ALTER TABLE "Games" ADD CONSTRAINT "fk_Games_language" FOREIGN KEY("language")
REFERENCES "Language" ("languageid");

ALTER TABLE "Games" ADD CONSTRAINT "fk_Games_developer" FOREIGN KEY("developer")
REFERENCES "Developers" ("developerid");

ALTER TABLE "Games" ADD CONSTRAINT "fk_Games_publisher" FOREIGN KEY("publisher")
REFERENCES "Publishers" ("publisherid");

ALTER TABLE "Games" ADD CONSTRAINT "fk_Games_owners" FOREIGN KEY("owners")
REFERENCES "Owners" ("ownersid");

ALTER TABLE "Game_Platform" ADD CONSTRAINT "fk_Game_Platform_appid" FOREIGN KEY("appid")
REFERENCES "Games" ("appid");

ALTER TABLE "Game_Platform" ADD CONSTRAINT "fk_Game_Platform_platformid" FOREIGN KEY("platformid")
REFERENCES "Platforms" ("platformid");

ALTER TABLE "Game_Categorie" ADD CONSTRAINT "fk_Game_Categorie_appid" FOREIGN KEY("appid")
REFERENCES "Games" ("appid");

ALTER TABLE "Game_Categorie" ADD CONSTRAINT "fk_Game_Categorie_categorieid" FOREIGN KEY("categorieid")
REFERENCES "Categories" ("categorieid");

ALTER TABLE "Game_Genre" ADD CONSTRAINT "fk_Game_Genre_appid" FOREIGN KEY("appid")
REFERENCES "Games" ("appid");

ALTER TABLE "Game_Genre" ADD CONSTRAINT "fk_Game_Genre_genreid" FOREIGN KEY("genreid")
REFERENCES "Genres" ("genreid");

ALTER TABLE "Game_Tag" ADD CONSTRAINT "fk_Game_Tag_appid" FOREIGN KEY("appid")
REFERENCES "Games" ("appid");

ALTER TABLE "Game_Tag" ADD CONSTRAINT "fk_Game_Tag_tagid" FOREIGN KEY("tagid")
REFERENCES "Tags" ("tagid");


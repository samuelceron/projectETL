-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/ALbpIU
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE Games (
    app_id int   NOT NULL,
    name varchar(250)   NOT NULL,
    release_date date   NOT NULL,
    language int   NOT NULL,
    developer int   NOT NULL,
    publisher int   NOT NULL,
    required_age int   NOT NULL,
    achievements int   NOT NULL,
    positive_ratings decimal   NOT NULL,
    negative_ratings decimal   NOT NULL,
    average_playtime decimal   NOT NULL,
    median_playtime decimal   NOT NULL,
    owners int   NOT NULL,
    price decimal   NOT NULL,
    website varchar(400)   NOT NULL,
    support_website varchar(400)   NOT NULL,
    support_email varchar(400)   NOT NULL,
    CONSTRAINT pk_Games PRIMARY KEY (
        app_id
     )
);

CREATE TABLE Developers (
    developer_id int   NOT NULL,
    name varchar(300)   NOT NULL,
    CONSTRAINT pk_Developers PRIMARY KEY (
        developer_id
     )
);

CREATE TABLE Publishers (
    publisher_id int   NOT NULL,
    name varchar(300)   NOT NULL,
    CONSTRAINT pk_Publishers PRIMARY KEY (
        publisher_id
     )
);

CREATE TABLE Language (
    language_id int   NOT NULL,
    language varchar(20)   NOT NULL,
    CONSTRAINT pk_Language PRIMARY KEY (
        language_id
     )
);

CREATE TABLE Platforms (
    platform_id int   NOT NULL,
    name varchar   NOT NULL,
    CONSTRAINT pk_Platforms PRIMARY KEY (
        platform_id
     )
);

CREATE TABLE Categories (
    category_id int   NOT NULL,
    name varchar(150)   NOT NULL,
    CONSTRAINT pk_Categories PRIMARY KEY (
        category_id
     )
);

CREATE TABLE Genres (
    genre_id int   NOT NULL,
    name varchar(150)   NOT NULL,
    CONSTRAINT pk_Genres PRIMARY KEY (
        genre_id
     )
);

CREATE TABLE Tags (
    tag_id int   NOT NULL,
    name varchar(150)   NOT NULL,
    CONSTRAINT pk_Tags PRIMARY KEY (
        tag_id
     )
);

CREATE TABLE Owners (
    owners_id int   NOT NULL,
    range varchar(30)   NOT NULL,
    CONSTRAINT pk_Owners PRIMARY KEY (
        owners_id
     )
);

CREATE TABLE Game_Platform (
    app_id int   NOT NULL,
    platform_id int   NOT NULL,
    CONSTRAINT pk_Game_Platform PRIMARY KEY (
        app_id,platform_id
     )
);

CREATE TABLE Game_Categorie (
    app_id int   NOT NULL,
    categorie_id int   NOT NULL,
    CONSTRAINT pk_Game_Categorie PRIMARY KEY (
        app_id,categorie_id
     )
);

CREATE TABLE Game_Genre (
    app_id int   NOT NULL,
    genre_id int   NOT NULL,
    CONSTRAINT pk_Game_Genre PRIMARY KEY (
        app_id,genre_id
     )
);

CREATE TABLE Game_Tag (
    app_id int   NOT NULL,
    tag_id int   NOT NULL,
    CONSTRAINT pk_Game_Tag PRIMARY KEY (
        app_id,tag_id
     )
);

ALTER TABLE Games ADD CONSTRAINT fk_Games_language FOREIGN KEY(language)
REFERENCES Language (language_id);

ALTER TABLE Games ADD CONSTRAINT fk_Games_developer FOREIGN KEY(developer)
REFERENCES Developers (developer_id);

ALTER TABLE Games ADD CONSTRAINT fk_Games_publisher FOREIGN KEY(publisher)
REFERENCES Publishers (publisher_id);

ALTER TABLE Games ADD CONSTRAINT fk_Games_owners FOREIGN KEY(owners)
REFERENCES Owners (owners_id);

ALTER TABLE Game_Platform ADD CONSTRAINT fk_Game_Platform_app_id FOREIGN KEY(app_id)
REFERENCES Games (app_id);

ALTER TABLE Game_Platform ADD CONSTRAINT fk_Game_Platform_platform_id FOREIGN KEY(platform_id)
REFERENCES Platforms (platform_id);

ALTER TABLE Game_Categorie ADD CONSTRAINT fk_Game_Categorie_app_id FOREIGN KEY(app_id)
REFERENCES Games (app_id);

ALTER TABLE Game_Categorie ADD CONSTRAINT fk_Game_Categorie_categorie_id FOREIGN KEY(categorie_id)
REFERENCES Categories (category_id);

ALTER TABLE Game_Genre ADD CONSTRAINT fk_Game_Genre_app_id FOREIGN KEY(app_id)
REFERENCES Games (app_id);

ALTER TABLE Game_Genre ADD CONSTRAINT fk_Game_Genre_genre_id FOREIGN KEY(genre_id)
REFERENCES Genres (genre_id);

ALTER TABLE Game_Tag ADD CONSTRAINT fk_Game_Tag_app_id FOREIGN KEY(app_id)
REFERENCES Games (app_id);

ALTER TABLE Game_Tag ADD CONSTRAINT fk_Game_Tag_tag_id FOREIGN KEY(tag_id)
REFERENCES Tags (tag_id);


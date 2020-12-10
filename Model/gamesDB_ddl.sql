-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/ALbpIU
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE Games (
    app_id int   NOT NULL,
    name varchar(250)   NOT NULL,
    release_date date   NOT NULL,
    developer int   NOT NULL,
    publisher int   NOT NULL,
    platforms int   NOT NULL,
    required_age int   NOT NULL,
    categories int   NOT NULL,
    genres int   NOT NULL,
    steamspy_tags int   NOT NULL,
    achievements int   NOT NULL,
    positive_ratings decimal   NOT NULL,
    negative_ratings decimal   NOT NULL,
    average_playtime decimal   NOT NULL,
    median_playtime decimal   NOT NULL,
    owners int   NOT NULL,
    price decimal   NOT NULL,
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

CREATE TABLE Platforms (
    platform_id int   NOT NULL,
    name varchar(150)   NOT NULL,
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

ALTER TABLE Games ADD CONSTRAINT fk_Games_developer FOREIGN KEY(developer)
REFERENCES Developers (developer_id);

ALTER TABLE Games ADD CONSTRAINT fk_Games_publisher FOREIGN KEY(publisher)
REFERENCES Publishers (publisher_id);

ALTER TABLE Games ADD CONSTRAINT fk_Games_platforms FOREIGN KEY(platforms)
REFERENCES Platforms (platform_id);

ALTER TABLE Games ADD CONSTRAINT fk_Games_categories FOREIGN KEY(categories)
REFERENCES Categories (category_id);

ALTER TABLE Games ADD CONSTRAINT fk_Games_genres FOREIGN KEY(genres)
REFERENCES Genres (genre_id);

ALTER TABLE Games ADD CONSTRAINT fk_Games_steamspy_tags FOREIGN KEY(steamspy_tags)
REFERENCES Tags (tag_id);

ALTER TABLE Games ADD CONSTRAINT fk_Games_owners FOREIGN KEY(owners)
REFERENCES Owners (owners_id);


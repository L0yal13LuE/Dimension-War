
DROP DATABASE IF EXISTS dimensionWar;
CREATE DATABASE dimensionWar;

USE dimensionWar;

CREATE TABLE users (
    id CHAR(36) PRIMARY KEY,
    firstname VARCHAR(255),
    lastName VARCHAR(255),
    userName VARCHAR(255),
    createdAt DATETIME,
    createdBy DATETIME,
    updatedAt DATETIME,
    updatedBy DATETIME
);

CREATE TABLE cards (
    id CHAR(36) PRIMARY KEY,
    number VARCHAR(255),
    name VARCHAR(255),
    tagId CHAR(36),
    classId CHAR(36),
    hp INT,
    attack INT,
    defense INT,
    imageURL VARCHAR(255),
    createdAt DATETIME,
    createdBy DATETIME,
    updatedAt DATETIME,
    updatedBy DATETIME
);

CREATE TABLE characters (
    id CHAR(36) PRIMARY KEY,
    name VARCHAR(255),
    firstName VARCHAR(255),
    lastName VARCHAR(255),
    characterCode VARCHAR(255),
    imageURL VARCHAR(255),
    createdAt DATETIME,
    createdBy DATETIME,
    updatedAt DATETIME,
    updatedBy DATETIME
);

CREATE TABLE classes (
    id CHAR(36) PRIMARY KEY,
    name VARCHAR(255),
    createdAt DATETIME,
    createdBy DATETIME,
    updatedAt DATETIME,
    updatedBy DATETIME
);

CREATE TABLE tags (
    id CHAR(36) PRIMARY KEY,
    name VARCHAR(255),
    createdAt DATETIME,
    createdBy DATETIME,
    updatedAt DATETIME,
    updatedBy DATETIME
);

CREATE TABLE characterCards (
    id CHAR(36) PRIMARY KEY,
    cardId CHAR(36),
    characterId CHAR(36),
    tagId CHAR(36),
    createdAt DATETIME,
    createdBy DATETIME,
    updatedAt DATETIME,
    updatedBy DATETIME,
    FOREIGN KEY (cardId) REFERENCES cards(id),
    FOREIGN KEY (characterId) REFERENCES characters(id),
    FOREIGN KEY (tagId) REFERENCES tags(id)
);

CREATE TABLE userCards (
    id CHAR(36) PRIMARY KEY,
    userId CHAR(36),
    cardId CHAR(36),
    serialNumber BIGINT UNIQUE,
    createdAt DATETIME,
    createdBy DATETIME,
    updatedAt DATETIME,
    updatedBy DATETIME,
    FOREIGN KEY (userId) REFERENCES users(id),
    FOREIGN KEY (cardId) REFERENCES cards(id)
);

CREATE TABLE decks (
    id CHAR(36) PRIMARY KEY,
    name VARCHAR(255),
    createdAt DATETIME,
    createdBy DATETIME,
    updatedAt DATETIME,
    updatedBy DATETIME
);

CREATE TABLE deckCards (
    id CHAR(36) PRIMARY KEY,
    deckId CHAR(36),
    userCardId CHAR(36),
    createdAt DATETIME,
    createdBy DATETIME,
    updatedAt DATETIME,
    updatedBy DATETIME,
    FOREIGN KEY (deckId) REFERENCES decks(id),
    FOREIGN KEY (userCardId) REFERENCES userCards(id)
);

-- Insert into users
INSERT INTO users (id, firstname, lastName, userName, createdAt, createdBy, updatedAt, updatedBy)
VALUES
    (UUID(), 'John', 'Doe', 'johndoe', NOW(), NOW(), NOW(), NOW()),
    (UUID(), 'Jane', 'Smith', 'janesmith', NOW(), NOW(), NOW(), NOW()),
    (UUID(), 'Alice', 'Johnson', 'alicej', NOW(), NOW(), NOW(), NOW());

-- Insert into cards
INSERT INTO cards (id, number, name, tagId, classId, hp, attack, defense, imageURL, createdAt, createdBy, updatedAt, updatedBy)
VALUES
    (UUID(), 'C001', 'Fireball', (SELECT id FROM tags LIMIT 1), (SELECT id FROM classes LIMIT 1), 100, 50, 30, 'http://example.com/fireball.jpg', NOW(), NOW(), NOW(), NOW()),
    (UUID(), 'C002', 'Ice Shard', (SELECT id FROM tags LIMIT 1), (SELECT id FROM classes LIMIT 1), 80, 40, 50, 'http://example.com/iceshard.jpg', NOW(), NOW(), NOW(), NOW()),
    (UUID(), 'C003', 'Lightning Bolt', (SELECT id FROM tags LIMIT 1), (SELECT id FROM classes LIMIT 1), 120, 60, 20, 'http://example.com/lightningbolt.jpg', NOW(), NOW(), NOW(), NOW());

-- Insert into characters
INSERT INTO characters (id, name, firstName, lastName, characterCode, imageURL, createdAt, createdBy, updatedAt, updatedBy)
VALUES
    (UUID(), 'Hero1', 'Arthur', 'Pendragon', 'CH001', 'http://example.com/hero1.jpg', NOW(), NOW(), NOW(), NOW()),
    (UUID(), 'Hero2', 'Merlin', 'Wizard', 'CH002', 'http://example.com/hero2.jpg', NOW(), NOW(), NOW(), NOW()),
    (UUID(), 'Hero3', 'Lancelot', 'Knight', 'CH003', 'http://example.com/hero3.jpg', NOW(), NOW(), NOW(), NOW());

-- Insert into classes
INSERT INTO classes (id, name, createdAt, createdBy, updatedAt, updatedBy)
VALUES
    (UUID(), 'Mage', NOW(), NOW(), NOW(), NOW()),
    (UUID(), 'Warrior', NOW(), NOW(), NOW(), NOW()),
    (UUID(), 'Rogue', NOW(), NOW(), NOW(), NOW());

-- Insert into tags
INSERT INTO tags (id, name, createdAt, createdBy, updatedAt, updatedBy)
VALUES
    (UUID(), 'Spell', NOW(), NOW(), NOW(), NOW()),
    (UUID(), 'Weapon', NOW(), NOW(), NOW(), NOW()),
    (UUID(), 'Armor', NOW(), NOW(), NOW(), NOW());

-- Insert into characterCards
INSERT INTO characterCards (id, cardId, characterId, tagId, createdAt, createdBy, updatedAt, updatedBy)
VALUES
    (UUID(), (SELECT id FROM cards LIMIT 1), (SELECT id FROM characters LIMIT 1), (SELECT id FROM tags LIMIT 1), NOW(), NOW(), NOW(), NOW()),
    (UUID(), (SELECT id FROM cards LIMIT 1 OFFSET 1), (SELECT id FROM characters LIMIT 1 OFFSET 1), (SELECT id FROM tags LIMIT 1 OFFSET 1), NOW(), NOW(), NOW(), NOW()),
    (UUID(), (SELECT id FROM cards LIMIT 1 OFFSET 2), (SELECT id FROM characters LIMIT 1 OFFSET 2), (SELECT id FROM tags LIMIT 1 OFFSET 2), NOW(), NOW(), NOW(), NOW());

-- Insert into userCards
INSERT INTO userCards (id, userId, cardId, serialNumber, createdAt, createdBy, updatedAt, updatedBy)
VALUES
    (UUID(), (SELECT id FROM users LIMIT 1), (SELECT id FROM cards LIMIT 1), 123456789, NOW(), NOW(), NOW(), NOW()),
    (UUID(), (SELECT id FROM users LIMIT 1 OFFSET 1), (SELECT id FROM cards LIMIT 1 OFFSET 1), 987654321, NOW(), NOW(), NOW(), NOW()),
    (UUID(), (SELECT id FROM users LIMIT 1 OFFSET 2), (SELECT id FROM cards LIMIT 1 OFFSET 2), 456789123, NOW(), NOW(), NOW(), NOW());

-- Insert into decks
INSERT INTO decks (id, name, createdAt, createdBy, updatedAt, updatedBy)
VALUES
    (UUID(), 'Starter Deck', NOW(), NOW(), NOW(), NOW()),
    (UUID(), 'Advanced Deck', NOW(), NOW(), NOW(), NOW()),
    (UUID(), 'Expert Deck', NOW(), NOW(), NOW(), NOW());

-- Insert into deckCards
INSERT INTO deckCards (id, deckId, userCardId, createdAt, createdBy, updatedAt, updatedBy)
VALUES
    (UUID(), (SELECT id FROM decks LIMIT 1), (SELECT id FROM userCards LIMIT 1), NOW(), NOW(), NOW(), NOW()),
    (UUID(), (SELECT id FROM decks LIMIT 1 OFFSET 1), (SELECT id FROM userCards LIMIT 1 OFFSET 1), NOW(), NOW(), NOW(), NOW()),
    (UUID(), (SELECT id FROM decks LIMIT 1 OFFSET 2), (SELECT id FROM userCards LIMIT 1 OFFSET 2), NOW(), NOW(), NOW(), NOW());


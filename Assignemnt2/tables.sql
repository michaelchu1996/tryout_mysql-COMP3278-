USE hfmchu;

CREATE TABLE User(
    userID INT(12) PRIMARY KEY,
    username VARCHAR(64),
    accountBalance DOUBLE
);
CREATE TABLE Friend(
    User1_userID INT(12),
    User2_userID INT(12),
    date DATE,
    FOREIGN KEY (User1_userID) REFERENCES User(userID),
    FOREIGN KEY (User2_userID) REFERENCES User(userID),
    PRIMARY KEY(User1_userID, User2_userID)
);

CREATE TABLE Vgroup(
    groupID INT(12) PRIMARY KEY,
    groupName VARCHAR(64)
);

CREATE TABLE Member_in_group(
    userID INT(12),
    groupID INT(12),
    role ENUM('group_creater', 'administrator', 'member'),
    FOREIGN KEY (userID) REFERENCES User(userID),
    FOREIGN KEY (groupID) REFERENCES Vgroup(groupID),
    PRIMARY KEY(userID, groupID)
);
CREATE TABLE Merchant(
    merchantID INT(12) PRIMARY KEY,
    merchantName VARCHAR(64)
);
CREATE TABLE Mobilespot(
    merchantID INT(12),
    spotID INT(12),
    location TEXT,
    PRIMARY KEY(merchantID, spotID),
    FOREIGN KEY(merchantID) REFERENCES Merchant(merchantID)
);
CREATE TABLE Transaction(
    transactionID INT(12) PRIMARY KEY,
    date DATE,
    amount DOUBLE,
    make_userID INT(12),
    FOREIGN KEY (make_userID) REFERENCES User(userID)
);
CREATE TABLE P2Ptransfer(
    transactionID INT(12) PRIMARY KEY,
    transferTo_userID INT(12),
    FOREIGN KEY (transactionID) REFERENCES Transaction(transactionID),
    FOREIGN KEY (transferTo_userID) REFERENCES User(userID)
);
CREATE TABLE Payment(
    transactionID INT(12) PRIMARY KEY,
    merchantID INT(12),
    spotID INT(12),
    FOREIGN KEY (transactionID) REFERENCES Transaction(transactionID),
    FOREIGN KEY(merchantID,spotID) REFERENCES Mobilespot(merchantID,spotID)
);
INSERT INTO User VALUES
('1', 'tom', 200),
('2', 'ben', 300),
('3', 'henry', 100),
('4', 'jerry', 550),
('5', 'tim', 100),
('6', 'david', 1000),
('7', 'marry', 888);

INSERT INTO Friend VALUES
('1', '2', '2018-01-11'), ('1', '3', '2018-02-11'), ('1', '4', '2018-06-12'), ('2', '4', '2018-10-21'), ('2', '5', '2018-10-22'), ('2', '6', '2018-12-11'), ('3', '4', '2018-12-25'), ('3', '7', '2019-01-11'), ('6', '7', '2019-01-14');

INSERT INTO Vgroup VALUES
('1', 'cooking_group'),
('2', 'hiking_group'),
('3', 'study_group'),
('4', 'sport_group'),
('5', 'language_group');

INSERT INTO Member_in_group VALUES
('1', '1', 'group_creater'),
('1', '2', 'member'),
('1', '4', 'member'),
('2', '1', 'administrator'),
('2', '2', 'member'),
('2', '4', 'administrator'),
('2', '5', 'group_creater'),
('3', '1', 'member'),
('3', '2', 'member'),
('3', '3', 'group_creater'),
('3', '5', 'member'),
('4', '2', 'group_creater'),
('5', '2', 'member'),
('6', '2', 'member'),
('6', '4', 'group_creater'),
('6', '5', 'member');


INSERT INTO Merchant VALUES
('1', 'supermarket'),
('2', '711store'),
('3', 'asia-restaurant'),
('4', 'happy-store'),
('5', 'sport-store'),
('6', 'ocean-supermarket'),
('7', 'mix-restaurant');

INSERT INTO Mobilespot VALUES
('1', '1', 'hku'),
('1', '2', 'pokfulam'),
('2', '1', 'university street'),
('2', '2', 'Shek Tong Tsui Sports Centre'),
('2', '3', 'Elliott Treatment Works Building'),
('3', '1', 'poka building'),
('3', '2', 'hkust'),
('3', '3', 'cuhk'),
('4', '1', 'Sun Yat Sen Memorial Park'),
('4', '2', 'Sai Ying Pun'),
('5', '1', 'West End Park'),
('6', '1', 'Blue Lotus Gallery'),
('7', '1', 'cityU'),
('7', '2', 'PolyU');

INSERT INTO Transaction VALUES
('1', '2018-01-11', 17.4, '1'),
('2', '2018-01-15', 16.4, '1'),
('3', '2018-05-21', 117.4, '2'),
('4', '2018-09-24', 87.2, '3'),
('5', '2018-12-11', 267, '1'),
('6', '2019-01-11', 16.8, '1'),
('7', '2019-01-12', 32, '1'),
('8', '2019-01-14', 12, '6'),
('9', '2019-01-21', 44, '1'),
('10', '2019-01-25', 51.1, '4'),
('11', '2019-02-07', 17.0, '1'),
('12', '2019-02-07', 26.8, '2'),
('13', '2019-02-07', 32.9, '1'),
('14', '2019-02-11', 110, '5'),
('15', '2019-02-15', 22, '7'),
('16', '2019-02-16', 27.8, '1'),
('17', '2019-02-16', 13.2, '1'),
('18', '2019-02-16', 5.6, '1'),
('19', '2019-02-24', 4.1, '1'),
('20', '2019-02-24', 7.7, '3'),
('21', '2019-02-24', 4.67, '4'),
('22', '2019-02-24', 16.8, '5'),
('23', '2019-02-24', 21.9, '5'),
('24', '2019-02-24', 32.7, '4'),
('25', '2019-02-24', 41.1, '3');

INSERT INTO P2Ptransfer VALUES
('1', '3'),
('5', '4'),
('11', '7'),
('14', '2');

INSERT INTO Payment VALUES
('2', '1', '1'),
('3', '1', '2'),
('4', '2', '1'),
('6','3', '1'),
('7','3', '1'),
('8','3', '1'),
('9','1', '2'),
('10','1', '2'),
('12','4', '1'),
('13','5', '1'),
('15','3', '2'), 
('16','5', '1'),
('17','5', '1'),
('18','7', '1'),
('19','7', '2'),
('20','4', '1'),
('21','4', '2'),
('22','4', '1'),
('23','5', '1'),
('24','5', '1'),
('25','7', '2');
CREATE DATABASE SOCIAL_MEDIA;
USE SOCIAL_MEDIA;
CREATE TABLE Users (
    UserID INT PRIMARY KEY AUTO_INCREMENT,
    Username VARCHAR(50) UNIQUE NOT NULL,
    Email VARCHAR(100) UNIQUE NOT NULL,
    Gender VARCHAR(20),
    DOB DATE,
    JoinDate DATETIME DEFAULT CURRENT_TIMESTAMP
);
CREATE TABLE Posts (
    PostID INT PRIMARY KEY AUTO_INCREMENT,
    UserID INT NOT NULL,
    Content TEXT NOT NULL,
    Visibility ENUM('Public', 'Private') NOT NULL,
    PostDate DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (UserID) REFERENCES Users(UserID)
    );
CREATE TABLE Comments (
    CommentID INT PRIMARY KEY AUTO_INCREMENT,
    PostID INT NOT NULL,
    UserID INT NOT NULL,
    Content TEXT NOT NULL,
    CommentDate DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (PostID) REFERENCES Posts(PostID),
    FOREIGN KEY (UserID) REFERENCES Users(UserID)
);
CREATE TABLE Interactions (
    InteractionID INT PRIMARY KEY AUTO_INCREMENT,
    UserID INT NOT NULL,
    PostID INT,
    CommentID INT,
    Type ENUM('Like', 'Share', 'Comment') NOT NULL,
    InteractionDate DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (UserID) REFERENCES Users(UserID),
    FOREIGN KEY (PostID) REFERENCES Posts(PostID),
    FOREIGN KEY (CommentID) REFERENCES Comments(CommentID)
);
INSERT INTO Users (Username, Email, Gender, DOB) VALUES
('Prof', 'prof@hotmail.com', 'Male', '2005-04-4'),
('Roma', 'ra7ma@hotmail.com', 'Female', '2005-07-10');
INSERT INTO Posts (UserID, Content, Visibility) VALUES
(1, 'Hello world! My first public post.', 'Public'),
(2, 'Having a great day - private thoughts.', 'Private');
INSERT INTO Comments (PostID, UserID, Content) VALUES
(1, 2, 'Nice post, PROF!'),
(2, 1, 'LET''S DO IT, ROMA!');
INSERT INTO Interactions (UserID, PostID, Type) VALUES
(2, 1, 'Like'),
(1, 2, 'Share');

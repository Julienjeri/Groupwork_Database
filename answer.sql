CREATE TABLE book (
    bookId INT PRIMARY KEY,
    title VARCHAR(255) ,
    publisherId INT,
    languageId INT,
    publicationYear INT,
    price DECIMAL(10, 2),
    stockQuantity INT,
    FOREIGN KEY (publisherId) REFERENCES publisher(publisherId),
    FOREIGN KEY (languageId) REFERENCES bookLanguage(languageId)
);
CREATE TABLE author (
    authorId INT PRIMARY KEY,
    firstName VARCHAR(100),
    lastName VARCHAR(100)
)
CREATE TABLE bookAuthor (
    bookId INT,
    authorId INT,
    PRIMARY KEY (bookId, authorId),
    FOREIGN KEY (bookId) REFERENCES book(bookId),
    FOREIGN KEY (authorId) REFERENCES author(authorId)
)
CREATE TABLE bookLanguage (
    languageId INT PRIMARY KEY,
    languageName VARCHAR(100)
)
CREATE TABLE publisher (
    publisherId INT PRIMARY KEY,
    name VARCHAR(255),
    website VARCHAR(255)
)
CREATE TABLE customer (
    customerId INT PRIMARY KEY,
    firstName VARCHAR(100),
    lastName VARCHAR(100),
    email VARCHAR(255),
    phone VARCHAR(20)
)
CREATE TABLE address (
    addressId INT PRIMARY KEY,
    street VARCHAR(255),
    city VARCHAR(100),
    postalCode VARCHAR(20),
    countryId INT,
    FOREIGN KEY (countryId) REFERENCES country(countryId)
)
CREATE TABLE country (
    countryId INT PRIMARY KEY,
    countryName VARCHAR(100)
)
CREATE TABLE addressStatus (
    addressStatusId INT PRIMARY KEY,
    statusName VARCHAR(50) -- e.g., 'Current', 'Old'
)
CREATE TABLE customerAddress (
    customerId INT,
    addressId INT,
    addressStatusId INT,
    PRIMARY KEY (customerId, addressId),
    FOREIGN KEY (customerId) REFERENCES customer(customerId),
    FOREIGN KEY (addressId) REFERENCES address(addressId),
    FOREIGN KEY (addressStatusId) REFERENCES addressStatus(addressStatusId)
)
CREATE TABLE customerOrder (
    orderId INT PRIMARY KEY,
    customerId INT,
    orderDate DATE,
    shippingMethodId INT,
    orderStatusId INT,
    FOREIGN KEY (customerId) REFERENCES customer(customerId),
    FOREIGN KEY (shippingMethodId) REFERENCES shippingMethod(shippingMethodId),
    FOREIGN KEY (orderStatusId) REFERENCES orderStatus(orderStatusId)
)
CREATE TABLE orderLine (
    orderId INT,
    bookId INT,
    quantity INT,
    priceAtPurchase DECIMAL(10, 2),
    PRIMARY KEY (orderId, bookId),
    FOREIGN KEY (orderId) REFERENCES customerOrder(orderId),
    FOREIGN KEY (bookId) REFERENCES book(bookId)
)
CREATE TABLE shippingMethod (
    shippingMethodId INT PRIMARY KEY,
    methodName VARCHAR(100),
    cost DECIMAL(10, 2)
)
 CREATE TABLE orderStatus (
    orderStatusId INT PRIMARY KEY,
    statusName VARCHAR(50) -- e.g., 'Pending', 'Shipped', 'Delivered'
)
CREATE TABLE orderHistory (
    historyId INT PRIMARY KEY,
    orderId INT,
    statusId INT,
    statusDate DATETIME,
    FOREIGN KEY (orderId) REFERENCES customerOrder(orderId),
    FOREIGN KEY (statusId) REFERENCES orderStatus(orderStatusId)
)
create user juliah@localhost identified by "password2";
create user progress@localhost identified by "password2";
create user vision@localhost identified by "password2";
grant all privileges on bookstoredb.* to juliah@localhost;
grant all privileges on bookstoredb.* to vision@localhost;
grant all privileges on bookstoredb.* to progress@localhost;
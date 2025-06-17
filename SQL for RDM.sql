CREATE TABLE usersignup (
idUser BINARY(16) PRIMARY KEY DEFAULT (UUID_TO_BIN(UUID())), 
email_ID VARCHAR(255) NOT NULL UNIQUE,
user_password VARCHAR (225) NOT NULL, 
first_name VARCHAR (50) NOT NULL, 
last_name VARCHAR (60) NOT NULL, 
userID_createdat TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
userID_updatedat TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP, 
CONSTRAINT check_emailformat CHECK (email LIKE '%__@__%.__%'), 
CONSTRAINT check_fname_length CHECK (CHAR_LENGTH(first_name) BETWEEN 1 AND 50), 
CONSTRAINT check_Lname_length CHECK (CHAR_LENGTH(first_name) BETWEEN 1 AND 60), 
CONSTRAINT chk_username_no_spaces CHECK (username NOT LIKE '% %')
)ENGINE=InnoDB;

CREATE TABLE user_profile ( 
idUser BINARY(16) PRIMARY KEY, 
phone_no VARCHAR(20), 
address TEXT, 
age INT, 
gender VARCHAR(20), 
occupation VARCHAR(100), 
userID_createdat TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
userID_updatedat TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP, 
 FOREIGN KEY (user_id) REFERENCES users(user_id), 
 CONSTRAINT check_age CHECK (age IS NULL OR (age BETWEEN 18 AND 120)), 
 CONSTRAINT check_gender CHECK (gender IS NULL OR (age IN ('male', 'female', 'Prefer not to say'))),
 CONSTRAINT check_phoneno CHECK (phone_no LIKE '%0__%') 
 )ENGINE=InnoDB;
 
 



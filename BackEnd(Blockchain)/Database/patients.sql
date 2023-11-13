CREATE TABLE patients (
    id INT PRIMARY KEY,
    ethereum_address VARCHAR(42) UNIQUE NOT NULL,
    name VARCHAR(255) NOT NULL,
    date_of_birth DATE,
    UNIQUE KEY (name)
);

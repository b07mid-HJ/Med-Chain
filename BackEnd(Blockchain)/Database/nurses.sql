CREATE TABLE nurses (
    id INT PRIMARY KEY,
    ethereum_address VARCHAR(42) UNIQUE NOT NULL,
    name VARCHAR(255) NOT NULL,
    department VARCHAR(255),
    UNIQUE KEY (name)
);

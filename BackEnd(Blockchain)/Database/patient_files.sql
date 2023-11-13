CREATE TABLE patient_files (
    id INT PRIMARY KEY,
    token_id INT,
    file_text TEXT,
    timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (token_id) REFERENCES healthcare_tokens(id)
);

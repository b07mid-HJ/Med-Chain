CREATE TABLE edit_logs (
    id INT PRIMARY KEY,
    token_id INT,
    log_text TEXT,
    timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (token_id) REFERENCES healthcare_tokens(id)
);

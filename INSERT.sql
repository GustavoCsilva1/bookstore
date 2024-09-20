-- Inserir autores
INSERT INTO authors (name, birth_date, nationality) VALUES
('J.K. Rowling', '1965-07-31', 'British'),
('George R.R. Martin', '1948-09-20', 'American'),
('J.R.R. Tolkien', '1892-01-03', 'British'),
('Agatha Christie', '1890-09-15', 'British');

-- Inserir categorias
INSERT INTO categories (name) VALUES
('Fantasy'),
('Science Fiction'),
('Mystery'),
('Thriller'),
('Romance');

-- Inserir livros
INSERT INTO books (title, category_id, publication_date, price, stock, isbn) VALUES
('Harry Potter and the Sorcerer Stone', 1, '1997-06-26', 19.99, 100, '978-0439708180'),
('A Game of Thrones', 1, '1996-08-06', 29.99, 50, '978-0553103540'),
('The Hobbit', 1, '1937-09-21', 15.99, 75, '978-0618968633'),
('Murder on the Orient Express', 3, '1934-01-01', 12.99, 60, '978-0062073501');

-- Inserir clientes
INSERT INTO customers (first_name, last_name, email, phone, address) VALUES
('John', 'Doe', 'john.doe@example.com', '555-1234', '123 Elm St'),
('Jane', 'Smith', 'jane.smith@example.com', '555-5678', '456 Oak St'),
('Emily', 'Jones', 'emily.jones@example.com', '555-8765', '789 Pine St');

-- Inserir empréstimos
INSERT INTO loans (id_customer, loan_date, return_due_date, returned) VALUES
(1, '2024-09-01', '2024-09-15', 0),
(2, '2024-09-05', '2024-09-20', 0);

-- Inserir relação de livros emprestados
INSERT INTO loan_books (id_loan, id_book) VALUES
(1, 1),
(1, 2),
(2, 3);

-- Inserir devoluções
INSERT INTO return (id_loan, return_date, fine) VALUES
(1, '2024-09-15', 0),
(2, '2024-09-10', 5.00);

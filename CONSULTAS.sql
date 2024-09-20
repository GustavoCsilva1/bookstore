-- consultas básicas basicos

SELECT * FROM books
SELECT * FROM authors
SELECT * FROM categories
SELECT * FROM return


-- Listar todos os empréstimos e os livros emprestados
SELECT loans.id AS loan_id, customers.first_name || ' ' || customers.last_name AS customer_name, books.title AS book_title, loans.loan_date, loans.return_due_date
FROM loans
JOIN customers ON loans.id_customer = customers.id
JOIN loan_books ON loans.id = loan_books.id_loan
JOIN books ON loan_books.id_book = books.id;

-- Listar todos os clientes e o número total de empréstimos
SELECT customers.first_name || ' ' || customers.last_name AS customer_name, COUNT(loans.id) AS total_loans
FROM customers
LEFT JOIN loans ON customers.id = loans.id_customer
GROUP BY customers.id;

-- Listar todos os livros disponíveis (em estoque)
SELECT title, stock
FROM books
WHERE stock > 0;

-- Verificar quais livros estão atrasados
SELECT books.title AS book_title, loans.return_due_date, loans.loan_date
FROM loans
JOIN loan_books ON loans.id = loan_books.id_loan
JOIN books ON loan_books.id_book = books.id
WHERE loans.return_due_date < DATE('now') AND loans.returned = 0;

-- Listar devoluções e as multas associadas
SELECT books.title AS book_title, return.return_date, return.fine
FROM return
JOIN loans ON return.id_loan = loans.id
JOIN loan_books ON loans.id = loan_books.id_loan
JOIN books ON loan_books.id_book = books.id;

-- Consultar empréstimos retornados com atraso
SELECT customers.first_name || ' ' || customers.last_name AS customer_name, loans.loan_date, loans.return_due_date, return.return_date
FROM loans
JOIN customers ON loans.id_customer = customers.id
JOIN return ON loans.id = return.id_loan
WHERE return.return_date > loans.return_due_date;

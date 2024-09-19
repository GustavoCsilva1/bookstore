-- Listar todos os empréstimos e os livros emprestados

SELECT l.id AS loan_id, c.first_name || ' ' || c.last_name AS customer_name, b.title AS book_title, l.loan_date, l.return_due_date
FROM loans l
JOIN customers c ON l.id_customer = c.id
JOIN loan_books lb ON l.id = lb.id_loan
JOIN books b ON lb.id_book = b.id;

-- Listar todos os clientes e o número total de empréstimos
SELECT c.first_name || ' ' || c.last_name AS customer_name, COUNT(l.id) AS total_loans
FROM customers c
LEFT JOIN loans l ON c.id = l.id_customer
GROUP BY c.id;

-- Listar todos os livros disponiveis (em estoque)
SELECT title, stock
FROM books
WHERE stock > 0;

-- Verificar quais livros estão atrasados
SELECT b.title AS book_title, l.return_due_date, l.loan_date
FROM loans l
JOIN loan_books lb ON l.id = lb.id_loan
JOIN books b ON lb.id_book = b.id
WHERE l.return_due_date < DATE('now') AND l.returned = 0;

-- Listar devoluções e as multas associadas
SELECT b.title AS book_title, r.return_date, r.fine
FROM returns r
JOIN loans l ON r.id_loan = l.id
JOIN loan_books lb ON l.id = lb.id_loan
JOIN books b ON lb.id_book = b.id;

-- Consultar empréstimos retornados com atraso
SELECT c.first_name || ' ' || c.last_name AS customer_name, l.loan_date, l.return_due_date
FROM loans l
JOIN customers c ON l.id_customer = c.id
WHERE l.returned = 0;

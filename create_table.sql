-- CREATE DATABASE biblioteca

-- Tabela de categorias de livros
CREATE TABLE categories (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL
);

-- Tabela de autores
CREATE TABLE authors (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL,
    birth_date DATE
);

-- Tabela de livros
CREATE TABLE books (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    title TEXT NOT NULL,
    id_category INTEGER,
    publication_year INTEGER,
    isbn TEXT UNIQUE,
    price DECIMAL(10, 2),
    stock INTEGER,
    FOREIGN KEY (id_category) REFERENCES categories(id)
);

-- Tabela de relação entre livros e autores (um livro pode ter vários autores)
CREATE TABLE book_authors (
    id_book INTEGER,
    id_author INTEGER,
    PRIMARY KEY (id_book, id_author),
    FOREIGN KEY (id_book) REFERENCES books(id),
    FOREIGN KEY (id_author) REFERENCES authors(id)
);

-- Tabela de clientes
CREATE TABLE customers (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL,
    email TEXT NOT NULL UNIQUE,
    phone TEXT
);

-- Tabela de empréstimos
CREATE TABLE loans (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    id_customer INTEGER,
    loan_date DATE NOT NULL,
    return_due_date DATE NOT NULL,
    returned BOOLEAN DEFAULT 0,
    FOREIGN KEY (id_customer) REFERENCES customers(id)
);

-- Tabela de devoluções
CREATE TABLE returns (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    id_loan INTEGER,
    return_date DATE NOT NULL,
    fine DECIMAL(10, 2),
    FOREIGN KEY (id_loan) REFERENCES loans(id)
);

-- Tabela de relação entre empréstimos e livros (um empréstimo pode ter vários livros)
CREATE TABLE loan_books (
    id_loan INTEGER,
    id_book INTEGER,
    PRIMARY KEY (id_loan, id_book),
    FOREIGN KEY (id_loan) REFERENCES loans(id),
    FOREIGN KEY (id_book) REFERENCES books(id)
);

ALTER TABLE authors ADD COLUMN nationality TEXT;

ALTER TABLE books ADD COLUMN author_id INTEGER;

ALTER TABLE books ADD COLUMN category_id INTEGER;

ALTER TABLE books ADD COLUMN publication_date DATE;

ALTER TABLE customers ADD COLUMN address TEXT;

ALTER TABLE loans ADD COLUMN customer_id INTEGER;

ALTER TABLE loans ADD COLUMN return_date TEXT;






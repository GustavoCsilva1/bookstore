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
    birth_date DATE,
    nationality TEXT
);

-- Tabela de livros
-- ISBN é um identificador único para livros
CREATE TABLE books (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    title TEXT NOT NULL,
    category_id INTEGER,
    publication_date DATE,
    price DECIMAL(10, 2),
    stock INTEGER,
    isbn TEXT UNIQUE,  
    FOREIGN KEY (category_id) REFERENCES categories(id)
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
    phone TEXT,
    address TEXT
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
CREATE TABLE return (
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

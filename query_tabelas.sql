DROP TABLE Restaurantes;
DROP TABLE Fornecedores;
DROP TABLE Encomendas;
DROP TABLE Produtos;
DROP TABLE Empregados;
DROP TABLE Cliente;
DROP TABLE Pedido;
DROP TABLE Pagamento;
DROP TABLE Cardapio;
DROP TABLE Emprega;

CREATE TABLE Restaurantes (
	IDRest INTEGER PRIMARY KEY,
    NIF INT(9) NOT NULL,
    Nome VARCHAR(50) NOT NULL,
    Email VARCHAR(80) NOT NULL,
    Morada VARCHAR(100) NOT NULL,
    Contacto INT(9) NOT NULL
) ENGINE=InnoDB;

CREATE TABLE Fornecedores (
	NIFForn INT(9) PRIMARY KEY,
    Nome VARCHAR(50) NOT NULL,
    Email VARCHAR(80) NOT NULL,
    Morada VARCHAR(100) NOT NULL,
	Contacto INT(9) NOT NULL,
    FormaPagamento VARCHAR(30) NOT NULL,
    PrazoPagamento DATE
) ENGINE=InnoDB;

CREATE TABLE Encomendas (
	IDEnc INTEGER PRIMARY KEY,
    Valor DOUBLE NOT NULL,
    DataEnc DATE NOT NULL,
    Hora TIME NOT NULL,
    IDRest INTEGER NOT NULL,
    NIFForn INT(9) NOT NULL,
    FOREIGN KEY (IDRest) REFERENCES Restaurantes(IDRest),
    FOREIGN KEY (NIFForn) REFERENCES Fornecedores(NIFForn)
) ENGINE=InnoDB;

CREATE TABLE Produtos (
	IDProd INTEGER PRIMARY KEY,
	Designacao VARCHAR(50) NOT NULL,
    Tipo VARCHAR(50) NOT NULL
) ENGINE=InnoDB;

CREATE TABLE Empregados (
	IDEmp INTEGER PRIMARY KEY,
    Nome VARCHAR(50) NOT NULL,
    NIF INT(9) NOT NULL,
    Email VARCHAR(80) NOT NULL,
	Cargo VARCHAR(50) NOT NULL,
    Posto VARCHAR(50) NOT NULL,
    Morada VARCHAR(100) NOT NULL,
    Idade INTEGER NOT NULL,
    Sexo CHAR(1) NOT NULL,
    Contacto INT(9) NOT NULL
) ENGINE=InnoDB;

CREATE TABLE Cliente (
	NIFCliente INT(9) PRIMARY KEY,
    Nome VARCHAR(50) NOT NULL,
    Email VARCHAR(80) NOT NULL,
    Morada VARCHAR(100) NOT NULL,
    Contacto INT(9) NOT NULL
) ENGINE=InnoDB;

CREATE TABLE Pedido (
	IDPedido INTEGER PRIMARY KEY,
    Mesa INTEGER NOT NULL,
    DataPedido DATE NOT NULL,
    Hora TIME NOT NULL,
	IDRest INTEGER NOT NULL,
    NIFCliente INT(9) NOT NULL,
    IDEmp INTEGER NOT NULL,
    FOREIGN KEY (IDRest) REFERENCES Restaurantes(IDRest),
    FOREIGN KEY (NIFCliente) REFERENCES Cliente(NIFCliente),
    FOREIGN KEY (IDEmp) REFERENCES Empregados(IDEmp)
) ENGINE=InnoDB;

CREATE TABLE Pagamento (
	Referencia INTEGER PRIMARY KEY,
    Valor DOUBLE NOT NULL,
    DataPag DATE NOT NULL,
    Hora TIME NOT NULL,
	NIFCliente INT(9) NOT NULL,
    IDPedido INTEGER NOT NULL,
    FOREIGN KEY (NIFCliente) REFERENCES Cliente(NIFCliente),
    FOREIGN KEY (IDPedido) REFERENCES Pedido(IDPedido)
) ENGINE=InnoDB;

CREATE TABLE Cardapio (
	IDCard INTEGER PRIMARY KEY,
    Item VARCHAR(30) NOT NULL,
	Preco DOUBLE NOT NULL,
    Descrição VARCHAR(50) NOT NULL
) ENGINE=InnoDB;

CREATE TABLE Emprega (
	IDRest INTEGER NOT NULL,
    IDEmp INTEGER NOT NULL,
    FOREIGN KEY (IDRest) REFERENCES Restaurantes(IDRest),
	FOREIGN KEY (IDEmp) REFERENCES Empregados(IDEmp)
) ENGINE=InnoDB;

CREATE TABLE Contem (
	IDEnc INTEGER NOT NULL,
    IDProd INTEGER NOT NULL,
    Quantidade INTEGER NOT NULL,
    FOREIGN KEY (IDEnc) REFERENCES Encomendas(IDEnc),
	FOREIGN KEY (IDProd) REFERENCES Produtos(IDProd)
) ENGINE=InnoDB;

CREATE TABLE Tem (
	IDProd INTEGER NOT NULL,
    NIFForn INTEGER NOT NULL,
    FOREIGN KEY (IDProd) REFERENCES Produtos(IDProd),
	FOREIGN KEY (NIFForn) REFERENCES Fornecedores(NIFForn)
) ENGINE=InnoDB;

CREATE TABLE Pediu (
	IDPedido INTEGER NOT NULL,
    IDCard INTEGER NOT NULL,
    Quantidade INTEGER NOT NULL,
    FOREIGN KEY (IDPedido) REFERENCES Pedido(IDPedido),
	FOREIGN KEY (IDCard) REFERENCES Cardapio(IDCard)
) ENGINE=InnoDB;
create table pedidos (
    id int AUTO_INCREMENT PRIMARY KEY,
    cliente_id integer references clientes(id),
    observacao text,
    created datetime default now(),
    modified datetime default now()
);

create table produtos_pedidos (
    id serial primary key,
    pedido_id integer references pedidos(id),
    vl_unitario numeric(10,2),
    qt_produto integer,
    produto_id integer references produtos(id),
    unidade varchar(10),
    observacao text,
    created datetime default now(),
    modified datetime default now()
);

create table produtos (
    id serial primary key,
    nome varchar(100),
    descricao text
);

create table clientes (
    id serial primary key,
    nome varchar(100),
    cpf varchar(14),
    cnpj varchar(18),
    email varchar(100),
    telefone varchar(20),
    endereco text,
    created datetime default now(),
    modified datetime default now()
);

create table contatosadicionais (
    id serial primary key,
    cliente_id integer references clientes(id),
    nome varchar(100),
    email varchar(100),
    telefone varchar(20),
    created datetime default now(),
    modified datetime default now()
);

create table enderecosadicionais (
    id serial primary key,
    cliente_id integer references clientes(id),
    cep varchar(9),
    logradouro varchar(100),
    numero varchar(10),
    complemento varchar(100),
    bairro varchar(100),
    cidade varchar(100),
    estado varchar(2),
    created datetime default now(),
    modified datetime default now()
);


-- Default values
-- Produtos
insert into produtos (nome, descricao) values ('Faca', 'Sem cerra');
insert into produtos (nome, descricao) values ('Garfo', 'De sobremesa');
insert into produtos (nome, descricao) values ('Colher', 'Para crianças');
insert into produtos (nome, descricao) values ('Panela', 'Antiaderente');
insert into produtos (nome, descricao) values ('Esponja', 'Esponja Mágica');


-- Clientes
insert into clientes (nome, cpf, cnpj, email, telefone, endereco) values ('Maria', '111.111.111-11', '11.111.111/1111-11', 'maria@gmail.com', '1111-1111', 'Rua Voluntaŕios da Pátria 105');
insert into clientes (nome, cpf, cnpj, email, telefone, endereco) values ('José', '222.222.222-22', '22.222.222/2222-22', 'jose@gmail.com', '2222-2222', 'Rua Braz Leme 27');



-- Pedidos
insert into pedidos (cliente_id, observacao) values (1, 'Cuidado produto frágil');
insert into pedidos (cliente_id, observacao) values (2, 'Cuidado produto frágil');
insert into pedidos (cliente_id, observacao) values (1, 'Cuidado produto frágil');
insert into pedidos (cliente_id, observacao) values (2, 'Cuidado produto frágil');
insert into pedidos (cliente_id, observacao) values (3, 'Cuidado produto frágil');
insert into pedidos (cliente_id, observacao) values (4, 'Cuidado produto frágil');


-- Produtos Pedidos
insert into produtos_pedidos (pedido_id, vl_unitario, qt_produto, produto_id, unidade, observacao) values 
(1, 10.00, 1, 1, 'UN', 'Observação do produto 1'),
(1, 20.00, 2, 2, 'UN', 'Observação do produto 2'),
(1, 30.00, 3, 10, 'UN', 'Observação do produto 3'),
(1, 40.00, 4, 9, 'UN', 'Observação do produto 4');

insert into produtos_pedidos (pedido_id, vl_unitario, qt_produto, produto_id, unidade, observacao) values 
(2, 30.00, 3, 3, 'UN', 'Observação do produto 3'),
(2, 40.00, 4, 4, 'UN', 'Observação do produto 4');
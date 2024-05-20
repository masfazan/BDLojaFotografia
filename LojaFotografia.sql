use BDLojaFotografia
--Tabela Endereço 
create table Endereco (
CodEnd int not null,
Logradouro varchar(100) not null,
Bairro varchar(50)not null,
Cidade varchar(50)not null,
Estado varchar(50)not null,
CEP varchar(8)not null,
constraint pkCodEnd primary key (CodEnd)
);
--Tabela Pessoa Física
create table ClientePessoaFisica (
CodClientePF int not null,
NomePF varchar (100) not null,
CodEndPF int not null,
NumEnd int not null,
Complemento varchar (10),
TelefoneRes varchar (13),
TelefoneCel varchar (13) not null,
TelefoneCom varchar (13),
RG varchar(9)not null,
CPF varchar(11) not null,
DataNascimento date not null,
Sexo char (1)not null,
constraint pkClientePF primary key (CodClientePF),
foreign key fkEndClientePF (CodEndPF) references Endereco(CodEnd) 
);
--Tabela Pessoa Jurídica
create table ClientePessoaJuridica (
CodClientePJ int not null,
NomePJ varchar (100) not null,
CodEndPJ int not null,
NumEnd int not null,
Complemento varchar (10),
TelefoneRes varchar (13),
TelefoneCel varchar (13),
TelefoneCom varchar (13) not null,
CNPJ varchar(14) not null,
InscricaoEstadual varchar(15) not null,
NomeResponsavel varchar(100) not null,
constraint pkClientePJ primary key (CodClientePJ),
foreign key fkEndClientePJ (CodEndPJ) references Endereco(CodEnd) 
);
--Tabela Funcionário
create table Funcionario (
CodFunc int not null,
NomeFunc varchar (100) not null,
CodEndFunc int not null,
Numero int not null,
Complemento varchar (10)null,
Telefone varchar (13) not null,
Contato varchar (15) not null,
Funcao varchar (20) not null,
Departamento varchar (20) not null,
constraint pkCodFunc primary key (CodFunc),
foreign key fkEndFunc (CodEndFunc) references Endereco(CodEnd) 
);
--Tabela Produto
create table Produto (
CodProd int not null,
Descricao varchar (100) not null,
PrecoCusto float not null,
PrecoVenda float not null,
QtdEstoque float,
QtdMinima float,
Tipo varchar (20) not null,
constraint pkCodProd primary key (CodProd)
);
--Tabela Venda
create table Venda (
NumVenda int not null,
DataVenda date not null,
ValorVenda float not null,
CondPagamento varchar (10) not null,
CodVFunc int not null,
CodVClientePF int,
CodVClientePJ int,
constraint pkNumVenda primary key (NumVenda),
foreign key fkVFunc (CodVFunc) references Funcionario(CodFunc),
foreign key fkVClientePF (CodVClientePF) references ClientePessoaFisica(CodClientePF),
foreign key fkVClientePJ (CodVClientePJ) references ClientePessoaJuridica(CodVClientePJ)
);
--Tabela Item Venda
create table ItemVenda (
NumItemVenda int not null,
CodProdIV int not null,
Quantidade float not null,
TotalItem float not null,
constraint pkNumItemVenda primary key (NumItemVenda, CodProdIV),
foreign key fkNumItemVenda (NumItemVenda) references Venda(NumVenda),
foreign key fkCodProdIV (CodProdIV) references Produto(CodProd)
);
insert into Endereco(CodEnd,Logradouro,Bairro,Cidade,Estado,CEP)
values(1,'Rua 1','Centro','Araraquara','São Paulo','14800001');
insert into ClientePessoaFisica (CodClientePF, NomePF, CodEndPF, NumEnd, Complemento,TelefoneRes,TelefoneCel,TelefoneCom, RG, CPF, DataNascimento,Sexo)
values (1, 'Clotilde', 1, 71, null,null,'16999993333',null, '123456789','12345678910', '1950-01-01','F');
insert into Endereco(CodEnd,Logradouro,Bairro,Cidade,Estado,CEP)
values(2,'Rua 2','São José','Campinas','São Paulo','14800002');
insert into ClientePessoaJuridica(CodClientePJ, NomePJ, CodEndPJ, NumEnd, Complemento, TelefoneRes, TelefoneCel, TelefoneCom, CNPJ, InscricaoEstadual,NomeResponsavel)
values(1, 'Atacadao', 2, 700, 'barracão', null, null, '16888883333', '12345678912345', '123456789123456', 'Joaquim');
insert into Endereco(CodEnd,Logradouro,Bairro,Cidade,Estado,CEP)
values(3,'Rua 3','Centro','Salvador','Bahia','14800003');
insert into Funcionario(CodFunc,NomeFunc,CodEndFunc, Numero, Complemento, Telefone, Contato, Funcao, Departamento)
values(1,'Maiara', 3, 350, null, '16033337777', 'Carlos', 'Estagiaria', 'TI');
insert into Produto(CodProd, Descricao, PrecoCusto, PrecoVenda, QtdEstoque, QtdMinima, Tipo)
values (1, 'Batom', 3.50, 11.50, 10, 1, 'Maquiagem');
insert into Venda (NumVenda, DataVenda,ValorVenda,CondPagamento,CodVFunc, CodVClientePF,CodVClientePJ)
values(1,'2024-02-02', 11.50, 'A vista', 1,1, null);
insert into ItemVenda (NumItemVenda, CodProdIV, Quantidade, TotalItem)
values (1, 1, 1, 11.50);
insert into Venda (NumVenda, DataVenda,ValorVenda,CondPagamento,CodVFunc, CodVClientePF,CodVClientePJ)
values (2,'2024-03-03', 23.00, 'A vista', 1,null,2);
insert into ItemVenda (NumItemVenda, CodProdIV, Quantidade, TotalItem)
values (2, 1, 2, 23.00);

SELECT * FROM Endereco;
SELECT * FROM ClientePessoaFisica;
SELECT * FROM ClientePessoaJuridica;
SELECT * FROM Funcionario;
SELECT * FROM Produto;
SELECT * FROM Venda;
SELECT * FROM ItemVenda;

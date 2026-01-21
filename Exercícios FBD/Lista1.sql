-- criacao de tabelas
create table empregado 
(
codEmp integer,
nome varchar(50) not null,
salario float,
primary key (codEmp)
);

create table projeto
(
codProj integer,
descricao varchar(50) not null,
orcamento float,
primary key (codProj)
);

create table alocacao
(
codEmp integer,
codProj integer,
dataInicioAlocacao date,
foreign key (codEmp) references empregado,
foreign key (codProj) references projeto
);

-- insercao de dados
insert into empregado values
(1, 'Carlos', 2000)

insert into empregado values
(2, 'Maria', 3400)

insert into empregado values
(3, 'Gabriel', 1700)

insert into projeto values
(1, 'Manutenção de sistema', 25000)

insert into projeto values
(2, 'Desenvolvimento de sistema', 100000)

insert into projeto values
(3, 'Manutenção de sistema', 10000)

insert into alocacao values
(1, 2, '2023-02-03')

insert into alocacao values
(2, 3, '2026-01-01')

insert into alocacao values
(3, 1, '2025-08-04')

-- removendo dados do projeto de codigo 1
-- alterando para null o alocacoes no projeto de codigo 1
update alocacao
set codProj = NULL
where codProj = 1

delete from projeto
where codProj = 1

select * from projeto

-- alterando o salario do empregado 'Carlos' para 3000
update empregado
set salario = 3000
where nome = 'Carlos'

select * from empregado

-- adicionando coluna 'cargo' na tabela empregado
alter table empregado add cargo varchar(50)

-- atualizando o cargo de todos os empregados para 'programador'
update empregado
set cargo = 'programador'

--inserindo registros que violem:
-- chave primária: inserindo empregado com código que já existe
insert into empregado values
(1, 'Felipe')
-- integridade referencial: alocar empregado em projeto que não existe
insert into alocacao values
(5, 2)
-- restricao de vazio: inserir empregado sem nome
insert into empregado
(codEmp, salario)
values (4, 2400)

-- restricao de dominio: alocar empregado com código do tipo char
insert into alocacao values
('P2', 2, '2024-01-02')
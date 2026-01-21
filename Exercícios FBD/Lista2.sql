-- criacao de tabelas e insercao de dados
create table Depto
(codDepto char(5),
nomeDepto varchar(20),
primary key (codDepto));

insert into Depto
values ('INF01', 'Informática');
insert into Depto
values ('MAT01', 'Matemática');
insert into Depto
values ('ELE01', 'Eletrônica');

create table Disciplina
(codDepto char(5),
numDisc char(5),
nomeDisc varchar(20),
creditosDisc integer,
primary key (codDepto, numDisc),
foreign key (codDepto) references Depto);

insert into Disciplina
values ('INF01', 'DIS01', 'Ling Formais', 4);
insert into Disciplina
values ('INF01', 'DIS02', 'Teoria da Comp', 4);
insert into Disciplina
values ('INF01', 'DIS03', 'Programacao I', 8);
insert into Disciplina
values ('MAT01', 'DIS04', 'Cálculo 1', 4);
insert into Disciplina
values ('MAT01', 'DIS01', 'Cálculo 2', 6);

create table PreReq
(codDepto char(5),
numDisc char(5),
codDeptoPreReq char(5),
numDiscPreReq char(5),
primary key (codDepto, numDisc, codDeptoPreReq,
numDiscPreReq),
foreign key (codDepto, numDisc) references disciplina,
foreign key (codDeptoPreReq, numDiscPreReq) references
disciplina);

insert into PreReq
values ('INF01', 'DIS02', 'INF01', 'DIS01');
insert into PreReq
values ('MAT01', 'DIS04', 'MAT01', 'DIS01');
insert into PreReq
values ('INF01', 'DIS03', 'INF01', 'DIS02');

create table Turma
(anoSem integer,
codDepto char(5),
numDisc char(5),
siglaTur char(5),
capacTur integer,
primary key (anoSem, codDepto, numDisc, siglaTur),
foreign key (codDepto, numDisc) references Disciplina);

insert into turma
values (20251, 'INF01', 'DIS01', 'TUR01', 30);
insert into turma
values (20252, 'INF01', 'DIS01', 'TUR01', 30);
insert into turma
values (20251, 'INF01', 'DIS02', 'TUR02', 30);
insert into turma
values (20252, 'INF01', 'DIS03', 'TUR01', 200);
insert into turma
values (20251, 'INF01', 'DIS03', 'TUR02', 30);
insert into turma
values (20251, 'MAT01', 'DIS01', 'TUR01', 15);
insert into turma
values (20252, 'INF01', 'DIS03', 'TUR02', 25);

create table Predio
(codPred integer,
nomePred varchar(30),
primary key (codPred));

insert into predio
values (43423, 'Informática-Aulas');
insert into predio
values (43421, 'Administração');
insert into predio
values (43424, 'Laboratórios');

create table Sala
(codPred integer,
numSala integer,
capacSala integer,
primary key (codPred, numSala),
foreign key(codPred)references Predio);

insert into sala
values (43423, 101, 30);
insert into sala
values (43421, 102, 50);
insert into sala
values (43424, 215, 40);

create table Horario
(anoSem integer,
codDepto char(5),
numDisc char(5),
siglaTur char(5),
diaSem integer,
horaInicio char(5),
numHoras integer,
codPredio integer,
numSala integer,
primary key (anoSem, codDepto, numDisc, siglaTur,
diaSem,
horaInicio),
foreign key (anoSem, codDepto, numDisc, siglaTur)
references turma,
foreign key (codPredio, numSala) references sala);

insert into horario
values (20251, 'INF01', 'DIS01', 'TUR01', 2, '10:30',
60, 43423, 101);
insert into horario
values (20251, 'INF01', 'DIS02', 'TUR02', 3, '10:30',
60, 43423, 101);
insert into horario
values (20252, 'INF01', 'DIS03', 'TUR02', 4, '08:30',
45, 43424, 215);
insert into horario
values (20251, 'INF01', 'DIS01', 'TUR01', 4, '13:30',
60, 43423, 101);

create table Titulacao
(codTit integer,
nomeTit varchar(20),
primary key (codTit));

insert into Titulacao
values (1, 'Doutor');
insert into Titulacao
values (2, 'Mestre');
insert into Titulacao
values (3, 'Especialista');
insert into Titulacao
values (4, 'Graduado');

create table Professor
(codProf char(5),
nomeProf varchar(50),
codTit integer,
codDepto char(5),
primary key (codProf),
foreign key (codTit) references Titulacao,
foreign key (codDepto) references Depto);

insert into Professor
values ('Pro01', 'Antunes', 1, 'INF01');
insert into Professor
values ('Pro02', 'Maria dos Santos', 2, 'INF01');
insert into Professor
values ('Pro03', 'Paulo', 3, 'MAT01');
insert into Professor
values ('Pro04', 'Gabriel', 2, 'MAT01');

create table ProfTurma
(anoSem integer,
codDepto char(5),
numDisc char(5),
siglaTur char(5),
codProf char(5),
primary key (anoSem, codDepto, numDisc, siglaTur,
codProf),
foreign key (anoSem, codDepto, numDisc, siglaTur)
references Turma,
foreign key (codProf) references Professor);

insert into ProfTurma
values (20251, 'INF01', 'DIS01', 'TUR01', 'Pro01');
insert into ProfTurma
values (20252, 'INF01', 'DIS01', 'TUR01', 'Pro01');
insert into ProfTurma
values (20251, 'INF01', 'DIS02', 'TUR02', 'Pro02');
insert into ProfTurma
values (20251, 'MAT01', 'DIS01', 'TUR01', 'Pro03');
insert into ProfTurma
values (20251, 'MAT01', 'DIS01', 'TUR01', 'Pro02');

-- 1. Obter todos os dados dos professores
select * from professor

-- 2. Obter o código e o nome dos professores
select codprof, nomeprof from professor

-- 3. Obter a capacidade das turmas
select capactur from turma

-- 4. Obter os diferentes valores de capacidades de turmas
select distinct capactur from turma

-- 5. Obter o nome das disciplinas do depto INF01, desde que tenham mais de 5 créditos
select nomedisc 
from disciplina
where coddepto = 'INFO1' and creditosdisc > 5

-- 6. Obter o código do prédio chamado Laboratórios
select codpred from predio
where nomepred = 'Laboratórios'

-- 7. Obter o código da sala e o código do prédio, desde que a sala tenha capacidade superior a 35 lugares
select numsala, codpred from sala
where capacsala > 35

-- 8. Obter o nome dos professores que têm titulação 1 e que trabalham no depto INF01
select nomeprof from professor
where codtit = 1 and coddepto = 'INF01'

-- 9. Obter o nome dos professores que têm titulação 2 ou que trabalham no depto INF01
select nomeprof from professor
where codtit = 2 or coddepto = 'INF01'

-- 10. Retorne o código e o nome dos professores que possuem o sobrenome Santos
select codprof, nomeprof from professor
where nomeprof like '%Santos'

-- 11. Sabendo que cada crédito de disciplina corresponde a 15hs-aula, retorne o nome da disciplina e o seu número de horas-aula
select nomedisc, creditosdisc*15 from disciplina
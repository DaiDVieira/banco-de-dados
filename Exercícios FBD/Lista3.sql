-- 1. Obtenha os nomes das disciplinas seguidas do nome de seu departamento
select nomedisc, nomedepto 
from disciplina natural join depto

-- 2. Obtenha os nomes dos professores que possuem titulação de 'Dr'
select nomeprof
from professor, titulacao
where professor.codtit = titulacao.codtit and nometit = 'Doutor'

-- 3. Obtenha os nomes dos professores que ministraram aulas em 2025/2
select nomeprof
from professor natural join profturma
where anosem = 20252

-- 4. Obtenha os números das salas do prédio de nome 'Laboratórios' cuja capacidade seja maior que 30
select numsala 
from sala natural join predio
where nomepred = 'Laboratórios' and capacsala > 30

-- 5. Obtenha os nomes das disciplinas que foram oferecidas em 2025/1
select nomedisc
from disciplina natural join turma
where anosem = 20251

-- 6. Obtenha os números das salas do prédio 'Laboratórios'
select numsala
from sala natural join predio
where nomepred = 'Laboratórios'

-- 7. Obtenha os nomes dos professores seguidos do nome de seu departamento
select nomeprof, nomedepto
from professor natural join depto

-- 8. Obtenha os códigos dos professores que não possuem turma em 2025/2
select codprof
from professor
except
(select codprof
from profturma
where anosem = 20252)

-- 9. Nomes dos departamentos que possuem disciplinas que não apresentam pré-requisito
select nomedepto
from depto, disciplina
where depto.coddepto = disciplina.coddepto and (depto.coddepto, numdisc)
not in
(select coddepto, numdisc -- retorna todas com prereq
from prereq)

-- 10. Obtenha os códigos dos professores que ministraram aulas em 2025/2 e 2025/1
select codprof
from profturma
where anosem = 20251 and codprof in
(select codprof
from profturma
where anosem = 20252)

-- 11. Obtenha os nomes dos departamentos em que há pelo menos uma disciplina com mais que três créditos
select distinct nomedepto
from depto natural join disciplina
where disciplina.creditosdisc > 3
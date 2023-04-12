/*1.	Selecionar o nome e o RA de todos os acadêmicos do curso Sistemas de Informação.

2.	Selecionar o nome do professor, o dia em que dá aula e o nome da disciplina. 

3.	Selecionar o dia, o número da aula (NR_DIA e NR_AULA) e o nome de todas as disciplinas que comecem com o texto Di. 

Selecionar o nome do acadêmico, o nome da disciplina e as notas do acadêmico na respectiva disciplina. Retornar, inclusive, os acadêmicos que não tem avaliações. Ordenar pelo nome da disciplina e pelo nome do acadêmico. 

4.	O campo NR_DIA da tabela HORARIO representa o dia da semana. Este campo tem valor variando de zero (representando domingo) até seis (representando sábado). Selecionar o nome de todos os professores que tem aulas na segunda-feira e na terça-feira. 

5.	Selecionar o nome de todas as disciplinas com aula na segunda-feira. 

6.	Selecionar o nome do acadêmico e o nome da disciplina cuja nota foi menor do que 5. 

NOME DA BASE DE DADOS: FACULDADE
*/
CREATE TABLE CURSO ( 
       CD_CURSO             INTEGER NOT NULL, 
       NM_CURSO             VARCHAR(60) NOT NULL, 
       ST_REGIME            VARCHAR(1) NOT NULL ); 

ALTER TABLE CURSO 
       ADD CONSTRAINT XPKCURSO PRIMARY KEY (CD_CURSO); 

CREATE TABLE DISCIPLINA ( 
       CD_DISC       INTEGER NOT NULL, 
       NM_DISC        VARCHAR(60) NOT NULL, 
       NR_CARGA    INTEGER NOT NULL); 

ALTER TABLE DISCIPLINA 
       ADD CONSTRAINT XPKDISCIPLINA PRIMARY KEY (CD_DISC); 

CREATE TABLE ACADEMICO ( 
       RA                          VARCHAR(20) NOT NULL, 
       CD_CURSO           INTEGER NOT NULL, 
       NM_ACADEMICO  VARCHAR(60) NOT NULL); 

ALTER TABLE ACADEMICO 
       ADD CONSTRAINT XPKACADEMICO PRIMARY KEY (RA); 

CREATE TABLE AVALIACAO ( 
       RA                        VARCHAR(20) NOT NULL, 
       CD_DISC             INTEGER NOT NULL, 
       CD_AVALIACAO INTEGER NOT NULL, 
       NR_NOTA           FLOAT NOT NULL); 

ALTER TABLE AVALIACAO 
       ADD CONSTRAINT XPKAVALIACAO PRIMARY KEY (RA, CD_DISC,  
              CD_AVALIACAO);

CREATE TABLE PROFESSOR ( 
       CD_PROFESSOR  INTEGER NOT NULL, 
       NM_PROFESSOR   VARCHAR(60) NOT NULL); 

ALTER TABLE PROFESSOR ADD CONSTRAINT XPKPROFESSOR PRIMARY KEY (CD_PROFESSOR); 

CREATE TABLE HORARIO ( 
       NR_DIA                   INTEGER NOT NULL, 
       NR_AULA                INTEGER NOT NULL, 
       CD_CURSO             INTEGER NOT NULL, 
       CD_DISC                 INTEGER NOT NULL, 
       CD_PROFESSOR   INTEGER); 

ALTER TABLE HORARIO ADD CONSTRAINT XPKHORARIO 
  PRIMARY KEY (NR_DIA, NR_AULA, CD_CURSO, CD_DISC); 

ALTER TABLE ACADEMICO ADD CONSTRAINT FK_CURSO_ACADEMICO 
              FOREIGN KEY (CD_CURSO)  REFERENCES CURSO; 

ALTER TABLE AVALIACAO ADD CONSTRAINT FK_DISCIPLINA_AVALIACAO 
              FOREIGN KEY (CD_DISC) REFERENCES DISCIPLINA; 

ALTER TABLE AVALIACAO ADD CONSTRAINT FK_ACADEMICO_AVALIACAO 
              FOREIGN KEY (RA) REFERENCES ACADEMICO; 

ALTER TABLE HORARIO ADD CONSTRAINT FK_PROFESSOR_HORARIO 
              FOREIGN KEY (CD_PROFESSOR) REFERENCES PROFESSOR;

ALTER TABLE HORARIO ADD CONSTRAINT FK_DISCIPLINA_HORARIO 
              FOREIGN KEY (CD_DISC) REFERENCES DISCIPLINA; 

ALTER TABLE HORARIO ADD CONSTRAINT FK_CURSO_HORARIO
            FOREIGN KEY (CD_CURSO) REFERENCES CURSO;

INSERT   INTO   CURSO   (CD_CURSO,   NM_CURSO,   ST_REGIME)  
 VALUES   (1,  'Sistemas de Informação', 'S'); 
INSERT   INTO   CURSO   (CD_CURSO,   NM_CURSO,   ST_REGIME)   
VALUES   (2,  'Direito', 'A'); 
INSERT   INTO   CURSO   (CD_CURSO,   NM_CURSO,   ST_REGIME)   
VALUES   (3,  'Administração', 'A'); 
INSERT   INTO   CURSO   (CD_CURSO,   NM_CURSO,   ST_REGIME)   
VALUES   (4,  'Sistemas para Internet', 'S'); 

INSERT  INTO  PROFESSOR  (CD_PROFESSOR,  NM_PROFESSOR)  
VALUES  (1,  'Francisco Ruiz'); 
INSERT  INTO  PROFESSOR  (CD_PROFESSOR,  NM_PROFESSOR)  
VALUES  (2,  'Horacio Leone'); 
INSERT  INTO  PROFESSOR  (CD_PROFESSOR,  NM_PROFESSOR)  
VALUES  (3,  'Renata Vieira'); 
INSERT  INTO  PROFESSOR  (CD_PROFESSOR,  NM_PROFESSOR)  
VALUES  (4,  'Rosario Girardi'); 
INSERT  INTO  PROFESSOR  (CD_PROFESSOR,  NM_PROFESSOR)  
VALUES  (5,  'Ana Paula Ambrosio'); 
INSERT  INTO  PROFESSOR  (CD_PROFESSOR,  NM_PROFESSOR)  
VALUES  (6,  'Giancarlo Guizzardi'); 

INSERT  INTO  ACADEMICO  (RA,   CD_CURSO,  NM_ACADEMICO)  
VALUES  ('SI-15536',  1, 'Aluísio Lima'); 
INSERT  INTO  ACADEMICO  (RA,   CD_CURSO,  NM_ACADEMICO)  
VALUES  ('SI-15537',  1, 'Bruno Rodrigues'); 
INSERT  INTO  ACADEMICO  (RA,   CD_CURSO,  NM_ACADEMICO)  
VALUES  ('SI-15538',  1, 'Manuella Carvalho Silva'); 
INSERT  INTO  ACADEMICO  (RA,   CD_CURSO,  NM_ACADEMICO)  
VALUES  ('DI-2112', 2, 'Roberta Marques Gouveia');
INSERT  INTO  ACADEMICO  (RA,   CD_CURSO,  NM_ACADEMICO)  
VALUES  ('DI-2113', 2, 'Vitor Sousa Baptista'); 
INSERT  INTO  ACADEMICO  (RA,   CD_CURSO,  NM_ACADEMICO)  
VALUES  ('DI-2114', 2, 'Mateus Novaes'); 

INSERT   INTO   DISCIPLINA   (CD_DISC,   NM_DISC,   NR_CARGA)  
 VALUES   (1, 'Modelagem de Ontologias', 6); 
INSERT   INTO   DISCIPLINA   (CD_DISC,   NM_DISC,   NR_CARGA)   
VALUES   (2, 'Bancos de Dados não convencionais', 4); 
INSERT  INTO  DISCIPLINA (CD_DISC,  NM_DISC,  NR_CARGA)
 VALUES (3, 'OQL',  4); 
INSERT  INTO DISCIPLINA (CD_DISC, NM_DISC, NR_CARGA) 
VALUES (4, 'Direito Penal I', 6); 
INSERT  INTO DISCIPLINA (CD_DISC, NM_DISC, NR_CARGA) 
VALUES (5, 'Direito Processual  I', 4); 
INSERT  INTO DISCIPLINA (CD_DISC, NM_DISC, NR_CARGA) 
VALUES (6, 'Direito Civil I', 4); 

INSERT      INTO     HORARIO     (NR_DIA,     NR_AULA,     CD_CURSO,    CD_DISC,  
CD_PROFESSOR) VALUES (1,  1,  1,  1,  1); 
INSERT      INTO     HORARIO     (NR_DIA,     NR_AULA,     CD_CURSO,    CD_DISC,  
CD_PROFESSOR) VALUES (1, 2,  1,  1,  1); 
INSERT      INTO     HORARIO     (NR_DIA,     NR_AULA,     CD_CURSO,    CD_DISC,  
CD_PROFESSOR) VALUES (1, 3,  1, 2, 2); 
INSERT      INTO     HORARIO     (NR_DIA,     NR_AULA,     CD_CURSO,    CD_DISC,  
CD_PROFESSOR) VALUES (1, 4,  1, 2, 2); 
INSERT      INTO     HORARIO     (NR_DIA,     NR_AULA,     CD_CURSO,    CD_DISC,  
CD_PROFESSOR) VALUES (2,  1,  1, 3, 3); 
INSERT      INTO     HORARIO     (NR_DIA,     NR_AULA,     CD_CURSO,    CD_DISC,  
CD_PROFESSOR) VALUES (2, 2,  1, 3, 3); 
INSERT      INTO     HORARIO     (NR_DIA,     NR_AULA,     CD_CURSO,    CD_DISC,  
CD_PROFESSOR) VALUES (2, 3,  1,  1,  1); 
INSERT      INTO     HORARIO     (NR_DIA,     NR_AULA,     CD_CURSO,    CD_DISC,  
CD_PROFESSOR) VALUES (2, 4,  1,  1,  1); 
INSERT      INTO     HORARIO     (NR_DIA,     NR_AULA,     CD_CURSO,    CD_DISC,  
CD_PROFESSOR) VALUES (1,  1, 2, 4, 4); 
INSERT      INTO     HORARIO     (NR_DIA,     NR_AULA,     CD_CURSO,    CD_DISC,  
CD_PROFESSOR) VALUES (1, 2, 2, 4, 4); 
INSERT      INTO     HORARIO     (NR_DIA,     NR_AULA,     CD_CURSO,    CD_DISC,  
CD_PROFESSOR) VALUES (1, 3, 2, 5, 6); 
INSERT      INTO     HORARIO     (NR_DIA,     NR_AULA,     CD_CURSO,    CD_DISC,  
CD_PROFESSOR) VALUES (1, 4, 2, 5, 6); 
INSERT      INTO     HORARIO     (NR_DIA,     NR_AULA,     CD_CURSO,    CD_DISC,  
CD_PROFESSOR) VALUES (2,  1, 2, 6, 5);
INSERT       INTO     HORARIO     (NR_DIA,     NR_AULA,     CD_CURSO,    CD_DISC,  
CD_PROFESSOR) VALUES (2, 2, 2, 6, 5); 
INSERT       INTO     HORARIO     (NR_DIA,     NR_AULA,     CD_CURSO,    CD_DISC,  
CD_PROFESSOR) VALUES (2, 3, 2, 5, 6); 
INSERT       INTO     HORARIO     (NR_DIA,     NR_AULA,     CD_CURSO,    CD_DISC,  
CD_PROFESSOR) VALUES (2, 4, 2, 5, 6); 


INSERT  INTO AVALIACAO (RA, CD_DISC, CD_AVALIACAO,  NR_NOTA) VALUES  
('SI-15536',  1,  1, 5.5); 
INSERT  INTO AVALIACAO (RA, CD_DISC, CD_AVALIACAO,  NR_NOTA) VALUES  
('SI-15536',  1, 2, 3.5); 
INSERT  INTO AVALIACAO (RA, CD_DISC, CD_AVALIACAO,  NR_NOTA) VALUES  
('SI-15537',  1,  1, 7); 
INSERT  INTO AVALIACAO (RA, CD_DISC, CD_AVALIACAO,  NR_NOTA) VALUES  
('SI-15537',  1, 2, 5); 
INSERT  INTO AVALIACAO (RA, CD_DISC, CD_AVALIACAO,  NR_NOTA) VALUES  
('SI-15538',  1,  1, 6); 
INSERT  INTO AVALIACAO (RA, CD_DISC, CD_AVALIACAO,  NR_NOTA) VALUES  
('SI-15538',  1, 2, 3.8); 
INSERT  INTO AVALIACAO (RA, CD_DISC, CD_AVALIACAO,  NR_NOTA) VALUES  
('SI-15536', 2,  1, 7); 
INSERT  INTO AVALIACAO (RA, CD_DISC, CD_AVALIACAO,  NR_NOTA) VALUES  
('SI-15537', 2,  1, 6.5); 
INSERT  INTO AVALIACAO (RA, CD_DISC, CD_AVALIACAO,  NR_NOTA) VALUES  
('SI-15538', 2,  1, 5.5); 
INSERT  INTO AVALIACAO (RA, CD_DISC, CD_AVALIACAO,  NR_NOTA) VALUES  
('DI-2112', 5,  1, 3.5); 
INSERT  INTO AVALIACAO (RA, CD_DISC, CD_AVALIACAO,  NR_NOTA) VALUES  
('DI-2112', 5, 2, 4.7); 
INSERT  INTO AVALIACAO (RA, CD_DISC, CD_AVALIACAO,  NR_NOTA) VALUES  
('DI-2113', 5,  1, 2.3); 
INSERT  INTO AVALIACAO (RA, CD_DISC, CD_AVALIACAO,  NR_NOTA) VALUES  
('DI-2113', 5, 2, 5.4); 
INSERT  INTO AVALIACAO (RA, CD_DISC, CD_AVALIACAO,  NR_NOTA) VALUES  
('DI-2114', 5,  1,  1.8); 
INSERT  INTO AVALIACAO (RA, CD_DISC, CD_AVALIACAO,  NR_NOTA) VALUES  
('DI-2114', 5, 2, 3.6); 



/*

1--
select academico.ra ,nm_academico from curso join academico on (academico.cd_curso = curso.cd_curso)
where curso.cd_curso=1

-- Selecionar o Acadêmico e seu RA do seu curso, onde Código do curso da tabela Academico é equivalente a código do
-- curso da tabela curso, apenas onde o CURSO for igual a 1 (sistema de informação)
2--
select professor.nm_professor, horario.nr_dia, disciplina.nm_disc  from professor 
inner join horario ON horario.cd_professor = professor.cd_professor
inner join disciplina ON disciplina.cd_disc = horario.cd_disc
-- Selecionar o nome do professor, número do dia da tabela horário e a disciplina
3--
select horario.nr_dia, horario.nr_aula, disciplina.nm_disc 
from horario 
inner join disciplina ON disciplina.cd_disc = horario.cd_disc
where disciplina.nm_disc like 'Di%';
select academico.nm_academico, avaliacao.nr_nota, disciplina.nm_disc
from academico
left join avaliacao ON avaliacao.ra = academico.ra
inner join disciplina ON disciplina.cd_disc = avaliacao.cd_disc
order by disciplina.nm_disc, academico.nm_academico;

4--
select professor.nm_professor from professor
inner join horario ON horario.cd_professor = professor.cd_professor
where horario.nr_dia in (1,2)
5--
select disciplina.nm_disc from disciplina
inner join horario ON horario.cd_disc = disciplina.cd_disc
where horario.nr_dia = 1
6--
select academico.nm_academico, disciplina.nm_disc
from academico
inner join avaliacao ON avaliacao.ra = academico.ra
inner join disciplina ON disciplina.cd_disc = avaliacao.cd_disc
where avaliacao.nr_nota < 5

*/
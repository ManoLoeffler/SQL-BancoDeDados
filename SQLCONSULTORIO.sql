Create table CIDADE(
  CD_CIDADE Integer NOT NULL,
  NM_CIDADE Varchar(60) NOT NULL,
  UF Varchar(2) NOT NULL,
 primary key (CD_CIDADE));

Create table CONSULTA(
  DATA Date NOT NULL,
  SEQUENCIA Integer NOT NULL,
  CRM Varchar(15) NOT NULL,
  CD_PACIENTE Integer NOT NULL,
  PRESCRICAO Varchar(200),
 primary key (DATA,SEQUENCIA));

Create table ESPECIALIDADE(
  CD_ESPECIALIDADE Integer NOT NULL,
  DS_ESPECIALIDADE Varchar(20) NOT NULL,
 primary key (CD_ESPECIALIDADE));

Create table ESPEC_MEDICO (
  CRM Varchar(15) NOT NULL,
  CD_ESPECIALIDADE Integer NOT NULL,
 primary key (CRM,CD_ESPECIALIDADE));

Create table MEDICO (
  CRM Varchar(15) NOT NULL,
  NM_MEDICO Varchar(40) NOT NULL,
  CD_CIDADE Integer,
  DS_ENDERECO Varchar(60),
  NR_CEP Varchar(10),
 primary key (CRM));

Create table PACIENTE (
  CD_PACIENTE Integer NOT NULL,
  NM_PACIENTE Varchar(60) NOT NULL,
  CD_CIDADE Integer,
  DS_ENDERECO Varchar(60),
  NR_CEP Varchar(10),
 primary key (CD_PACIENTE));

Alter table PACIENTE add  foreign key (CD_CIDADE) references CIDADE (CD_CIDADE);
Alter table MEDICO add  foreign key (CD_CIDADE) references CIDADE (CD_CIDADE);
Alter table ESPEC_MEDICO add  foreign key (CD_ESPECIALIDADE) references ESPECIALIDADE (CD_ESPECIALIDADE);
Alter table CONSULTA add  foreign key (CRM) references MEDICO (CRM);
Alter table ESPEC_MEDICO add  foreign key (CRM) references MEDICO (CRM);
Alter table CONSULTA add  foreign key (CD_PACIENTE) references PACIENTE (CD_PACIENTE);




RESPOSTAS:

-- QUESTÃO 1
INSERT INTO ESPECIALIDADE (CD_ESPECIALIDADE, DS_ESPECIALIDADE)
VALUES (36, 'Traumatologia'),(2, 'Ortopedia'),(15, 'Nefrologia'),(4, 'Pediatria');

--QUESTÃO2
INSERT INTO MEDICO (CRM, NM_MEDICO)
VALUES ('152/PR', 'Juvenal Cardoso'),('287/SC', 'Marilda Pereira'),('1590/SP', 'Osvaldo Martins'),('4099/RJ', 'Altair Moreira');

--Questão3
INSERT INTO CIDADE (CD_CIDADE, NM_CIDADE, UF)
VALUES (1, 'Palmas', 'PR'),(45, 'Vitorino', 'PR'),(21, 'Clevelândia', 'PR'),(5, 'Xanxerê', 'SC');

--Questão4
INSERT INTO PACIENTE (CD_PACIENTE, NM_PACIENTE, CD_CIDADE)
VALUES (9, 'Osmar Xavier', 21),(87, 'Marcos Ubaldo', 45),(99, 'Dilma Silva', NULL),(56, 'Antônio Miranda', 21);

--Questão5
INSERT INTO CONSULTA (DATA, SEQUENCIA, CRM, CD_PACIENTE)
VALUES ('11/06/03', 1, '152/PR', 87),('11/06/03', 2, '152/PR', 9),('11/06/03', 3, '152/PR', 56),('05/07/03', 1, '1590/SP', 56),('26/08/03', 1, '4099/RJ', 99);

--Questão6

DELETE FROM CIDADE WHERE (NM_CIDADE = 'Palmas')
--Foi deletada normalmente
DELETE FROM CIDADE WHERE (NM_CIDADE = 'Vitorino')
--Não pode ser deletada pois há vinculo de FK com a tabela paciente

--Questão7
UPDATE PACIENTE SET CD_CIDADE = 5
WHERE CD_PACIENTE = 99;

--Questão8
SELECT NM_PACIENTE FROM PACIENTE
WHERE CD_CIDADE = 21;

--Questão9

SELECT NM_MEDICO FROM MEDICO
WHERE NM_MEDICO LIKE '%Ma%';

--Questão10

SELECT DATA, SEQUENCIA FROM CONSULTA;

--Questão11
SELECT NM_PACIENTE, CD_PACIENTE FROM PACIENTE;

--Questão12
SELECT CD_PACIENTE, NM_PACIENTE FROM PACIENTE;

--Questão13
SELECT NM_CIDADE, UF FROM CIDADE WHERE UF = 'RS';

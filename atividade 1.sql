-- CRIAR TABELAS -- 

-- PAÍS
create table TB_PAIS (  
  id_pais number not null,
  nm_pais varchar2 (50) not null,  
  nr_populacao number,
  constraint pk_pais primary key (id_pais)  
);

-- EQUIPE - relacionamento com PAÍS
create table TB_EQUIPE (  
 id_equipe number not null primary key,
 nm_equipe varchar2 (50) not null,  
 id_pais number not null, 
 constraint fk_equipe_pais foreign key (id_pais) references TB_PAIS (id_pais) 
);

-- PILOTO - relacionamento com PAÍS e EQUIPE

create table TB_PILOTO (
 id_piloto number PRIMARY KEY,
 nm_piloto VARCHAR2(50),
 dt_nascimento DATE,
 id_pais number not null, 
 id_equipe number not null,
 constraint fk_piloto_pais foreign key (id_pais) references TB_PAIS (id_pais),
 constraint fk_piloto_equipe foreign key (id_equipe) references TB_EQUIPE (id_equipe)
);

-- CIRCUITO - relacionamento com PAÍSES

create table TB_CIRCUITO (  
  id_circuito number not null PRIMARY KEY,
  nm_circuito varchar2 (50) not null,  
  nr_extensão number,
  id_pais number not null,
  constraint fk_circuito_pais foreign key (id_pais) references TB_PAIS (id_pais) 
);

-- PROVA - relacionamento com CIRCUITO

create table TB_PROVA (  
  id_prova number not null PRIMARY KEY,
  nm_prova varchar2 (50) not null,
  dt_prova date,
  nm_situação varchar2 (50) not null,  
  id_circuito number not null,
  constraint fk_prova_circuito foreign key (id_circuito) references TB_CIRCUITO (id_circuito) 
);

-- RESULTADO
create table TB_RESULTADO (
  id_prova number not null,
  id_piloto number not null,
  nr_tempo_prova varchar2(11),
  nr_coloc_final number, --p
  nr_posicao_grid number, --grade
  nr_melhor_volta number, --lap,
  constraint fk_resultado_prova foreign key (id_prova) references TB_PROVA (id_prova),
  constraint fk_resultado_piloto foreign key (id_piloto) references TB_PILOTO (id_piloto)
);

-- POPULAR TABELAS --

-- PAÍS
insert into TB_PAIS (id_pais, nm_pais, nr_populacao) values (101, 'Italia', 60000000);
insert into TB_PAIS (id_pais, nm_pais, nr_populacao) values (102, 'Alemanha',83000000);
insert into TB_PAIS (id_pais, nm_pais, nr_populacao) values (103, 'Estados Unidos', 32800000);
insert into TB_PAIS (id_pais, nm_pais, nr_populacao) values (104, 'Brasil', 212000000);
insert into TB_PAIS (id_pais, nm_pais, nr_populacao) values (105, 'Reino Unido', 67000000);
insert into TB_PAIS (id_pais, nm_pais, nr_populacao) values (106, 'Inglaterra', 68000000);
insert into TB_PAIS (id_pais, nm_pais, nr_populacao) values (107, 'Áustria', 9000000);
insert into TB_PAIS (id_pais, nm_pais, nr_populacao) values (108, 'França', 67000000);
insert into TB_PAIS (id_pais, nm_pais, nr_populacao) values (109, 'Austrália', 26000000);
insert into TB_PAIS (id_pais, nm_pais, nr_populacao) values (110, 'Finlândia', 212000000);

-- EQUIPE
insert into TB_EQUIPE values (501, 'Ferrari', 101);
insert into TB_EQUIPE values (502, 'Alfa Romeo', 101);
insert into TB_EQUIPE values (503, 'Mercedes-Benz', 102);
insert into TB_EQUIPE values (504, 'Haas F1 Team', 102);
insert into TB_EQUIPE values (505, 'McLaren', 103);
insert into TB_EQUIPE values (506, 'Alpine', 103);
insert into TB_EQUIPE values (507, 'Williams', 104);
insert into TB_EQUIPE values (508, 'AlphaTauri', 104);
insert into TB_EQUIPE values (509, 'Red Bull', 105);
insert into TB_EQUIPE values (510, 'Aston Martin', 105);
insert into TB_EQUIPE values (511, 'Aston Martin', 106);
insert into TB_EQUIPE values (512, 'Red Bull', 106);
insert into TB_EQUIPE values (513, 'AlphaTauri', 107);
insert into TB_EQUIPE values (514, 'Williams', 107);
insert into TB_EQUIPE values (515, 'Alpine', 108);
insert into TB_EQUIPE values (516, 'McLaren', 108);
insert into TB_EQUIPE values (517, 'Haas F1 Team', 109);
insert into TB_EQUIPE values (518, 'Mercedes-Benz', 109);
insert into TB_EQUIPE values (519, 'Alfa Romeo', 110);
insert into TB_EQUIPE values (520, 'Ferrari', 110);

 -- PILOTO
insert into TB_PILOTO (id_piloto,nm_piloto,dt_nascimento,id_pais,id_equipe) 
            values (1, 'Giada Daniele', TO_DATE('13/08/1990', 'DD/MM/YYYY'), 101, 501);
insert into TB_PILOTO (id_piloto,nm_piloto,dt_nascimento,id_pais,id_equipe) 
            values (2, 'Marianne Bird', TO_DATE('15/04/1986', 'DD/MM/YYYY'), 102, 502);
insert into TB_PILOTO (id_piloto,nm_piloto,dt_nascimento,id_pais,id_equipe) 
            values (3, 'Darragh Price', TO_DATE('01/02/1990', 'DD/MM/YYYY'), 103, 503);
insert into TB_PILOTO (id_piloto,nm_piloto,dt_nascimento,id_pais,id_equipe) 
            values (4, 'Lewis Hamilton', TO_DATE('07/01/1985', 'DD/MM/YYYY'), 104, 504);
insert into TB_PILOTO (id_piloto,nm_piloto,dt_nascimento,id_pais,id_equipe) 
            values (5, 'George Russell', TO_DATE('15/02/1998', 'DD/MM/YYYY'), 105, 505);
insert into TB_PILOTO (id_piloto,nm_piloto,dt_nascimento,id_pais,id_equipe) 
            values (6, 'Max Verstappen', TO_DATE('30/09/1997', 'DD/MM/YYYY'), 105, 506);
insert into TB_PILOTO (id_piloto,nm_piloto,dt_nascimento,id_pais,id_equipe) 
            values (7, 'Sergio Perez', TO_DATE('26/01/1990', 'DD/MM/YYYY'), 104, 507);
insert into TB_PILOTO (id_piloto,nm_piloto,dt_nascimento,id_pais,id_equipe) 
            values (8, 'Claire Naoise', TO_DATE('12/12/1989', 'DD/MM/YYYY'), 103, 508);
insert into TB_PILOTO (id_piloto,nm_piloto,dt_nascimento,id_pais,id_equipe) 
            values (9, 'Charles Leclerc', TO_DATE('16/10/1997', 'DD/MM/YYYY'), 102, 509);
insert into TB_PILOTO (id_piloto,nm_piloto,dt_nascimento,id_pais,id_equipe) 
            values (10, 'Carlos Sainz', TO_DATE('01/09/1994', 'DD/MM/YYYY'), 101, 510);
insert into TB_PILOTO (id_piloto,nm_piloto,dt_nascimento,id_pais,id_equipe) 
            values (11, 'Lando Norris', TO_DATE('13/11/1999', 'DD/MM/YYYY'), 106, 511);
insert into TB_PILOTO (id_piloto,nm_piloto,dt_nascimento,id_pais,id_equipe) 
            values (12, 'Daniel Ricciardo', TO_DATE('1/07/1989', 'DD/MM/YYYY'), 106, 512);
insert into TB_PILOTO (id_piloto,nm_piloto,dt_nascimento,id_pais,id_equipe) 
            values (13, 'Esteban Ocon', TO_DATE('17/09/1996', 'DD/MM/YYYY'), 107, 513);
insert into TB_PILOTO (id_piloto,nm_piloto,dt_nascimento,id_pais,id_equipe) 
            values (14, 'Fernando Alonso', TO_DATE('29/07/1981', 'DD/MM/YYYY'), 107, 514);
insert into TB_PILOTO (id_piloto,nm_piloto,dt_nascimento,id_pais,id_equipe) 
            values (15, 'Pierre Gasly', TO_DATE('07/02/1996', 'DD/MM/YYYY'), 108, 515);
insert into TB_PILOTO (id_piloto,nm_piloto,dt_nascimento,id_pais,id_equipe) 
            values (16, 'Yuki Tsunoda', TO_DATE('11/05/2000', 'DD/MM/YYYY'), 108, 516);
insert into TB_PILOTO (id_piloto,nm_piloto,dt_nascimento,id_pais,id_equipe) 
            values (17, 'Lance Stroll', TO_DATE('29/10/1998', 'DD/MM/YYYY'), 109, 517);
insert into TB_PILOTO (id_piloto,nm_piloto,dt_nascimento,id_pais,id_equipe) 
            values (18, 'Sebastian Vettel', TO_DATE('03/07/1987', 'DD/MM/YYYY'), 109, 518);
insert into TB_PILOTO (id_piloto,nm_piloto,dt_nascimento,id_pais,id_equipe) 
            values (19, 'Alexander Albon', TO_DATE('23/03/1996', 'DD/MM/YYYY'), 110, 519);
insert into TB_PILOTO (id_piloto,nm_piloto,dt_nascimento,id_pais,id_equipe) 
            values (20, 'Mick Schumacher', TO_DATE('22/03/1999', 'DD/MM/YYYY'), 110, 520);

-- CIRCUITO
insert into TB_CIRCUITO (id_circuito,nm_circuito,nr_extensão,id_pais) 
            values (201, 'Circuito de Albert Park', 5303, 109);
insert into TB_CIRCUITO (id_circuito,nm_circuito,nr_extensão,id_pais) 
            values (202, 'Autódromo Enzo e Dino Ferrari', 4909, 101);
insert into TB_CIRCUITO (id_circuito,nm_circuito,nr_extensão,id_pais) 
            values (203, 'Miami Grand Prix', 5410, 103);
insert into TB_CIRCUITO (id_circuito,nm_circuito,nr_extensão,id_pais) 
            values (204, 'Circuito de Silverstone', 5891, 106);

-- PROVA
insert into TB_PROVA (id_prova, nm_prova, dt_prova, nm_situação,id_circuito) 
            values (301, '2022 Australiano F1 GP', TO_DATE('10/04/2022', 'DD/MM/YYYY'), 'Molhado', 201);
insert into TB_PROVA (id_prova,nm_prova, dt_prova, nm_situação,id_circuito) 
            values (302, '2022 Emilia Romagna F1 GP', TO_DATE('27/03/2022', 'DD/MM/YYYY'), 'Seco', 202);
insert into TB_PROVA (id_prova,nm_prova, dt_prova, nm_situação,id_circuito) 
            values (303, '2022 Miami F1 GP', TO_DATE('10/03/2022', 'DD/MM/YYYY'), 'Seco', 203);
insert into TB_PROVA (id_prova,nm_prova, dt_prova, nm_situação,id_circuito) 
            values (304, '2022 British F1 GP', TO_DATE('23/02/2022', 'DD/MM/YYYY'), 'Molhado', 204);

-- RESULTADO

insert into TB_RESULTADO (id_prova,id_piloto, nr_tempo_prova,nr_coloc_final,nr_posicao_grid,nr_melhor_volta) 
            values (301, 1, '01: 27: 46', 1, 1, 58);
insert into TB_RESULTADO (id_prova,id_piloto, nr_tempo_prova,nr_coloc_final,nr_posicao_grid,nr_melhor_volta) 
            values (302, 2, '01: 28: 07', 1, 7, 58);      
insert into TB_RESULTADO (id_prova,id_piloto, nr_tempo_prova,nr_coloc_final,nr_posicao_grid,nr_melhor_volta) 
            values (303, 3, '01: 28: 12', 1, 8, 58);     
insert into TB_RESULTADO (id_prova,id_piloto, nr_tempo_prova,nr_coloc_final,nr_posicao_grid,nr_melhor_volta) 
            values (304, 4, '01: 28: 15', 1,12, 58);
insert into TB_RESULTADO (id_prova,id_piloto, nr_tempo_prova,nr_coloc_final,nr_posicao_grid,nr_melhor_volta) 
            values (301, 5, '01: 28: 39', 2, 3, 58);
insert into TB_RESULTADO (id_prova,id_piloto, nr_tempo_prova,nr_coloc_final,nr_posicao_grid,nr_melhor_volta) 
            values (302, 6, '01: 28: 40', 2,11, 58);
insert into TB_RESULTADO (id_prova,id_piloto, nr_tempo_prova,nr_coloc_final,nr_posicao_grid,nr_melhor_volta) 
            values (303, 7, '01: 28: 48', 2,20, 58);
insert into TB_RESULTADO (id_prova,id_piloto, nr_tempo_prova,nr_coloc_final,nr_posicao_grid,nr_melhor_volta) 
            values (304, 8, '01: 28: 54', 2,14, 57);
insert into TB_RESULTADO (id_prova,id_piloto, nr_tempo_prova,nr_coloc_final,nr_posicao_grid,nr_melhor_volta) 
            values (301, 9, '01: 29: 02', 3, 6, 57);
insert into TB_RESULTADO (id_prova,id_piloto, nr_tempo_prova,nr_coloc_final,nr_posicao_grid,nr_melhor_volta) 
            values (302,10, '01: 29: 05', 3,19, 57);
insert into TB_RESULTADO (id_prova,id_piloto, nr_tempo_prova,nr_coloc_final,nr_posicao_grid,nr_melhor_volta) 
            values (303,11, '01: 29: 08', 3,15, 57);
insert into TB_RESULTADO (id_prova,id_piloto, nr_tempo_prova,nr_coloc_final,nr_posicao_grid,nr_melhor_volta) 
            values (304,12, '01: 29: 15', 3,16, 57);
insert into TB_RESULTADO (id_prova,id_piloto, nr_tempo_prova,nr_coloc_final,nr_posicao_grid,nr_melhor_volta) 
            values (301,13, '01: 28: 15', 4, 5, 38);
insert into TB_RESULTADO (id_prova,id_piloto, nr_tempo_prova,nr_coloc_final,nr_posicao_grid,nr_melhor_volta) 
            values (302,14, '01: 27: 48', 4,13,  1);
insert into TB_RESULTADO (id_prova,id_piloto, nr_tempo_prova,nr_coloc_final,nr_posicao_grid,nr_melhor_volta) 
            values (303,15, '01: 27: 50', 4,18, 58);
insert into TB_RESULTADO (id_prova,id_piloto, nr_tempo_prova,nr_coloc_final,nr_posicao_grid,nr_melhor_volta) 
            values (304,16, '01: 27: 52', 4,10, 58);
insert into TB_RESULTADO (id_prova,id_piloto, nr_tempo_prova,nr_coloc_final,nr_posicao_grid,nr_melhor_volta) 
            values (301,17, '01: 27: 57', 5, 4, 22);
insert into TB_RESULTADO (id_prova,id_piloto, nr_tempo_prova,nr_coloc_final,nr_posicao_grid,nr_melhor_volta) 
            values (302,18, '01: 28: 17', 5, 2, 58);
insert into TB_RESULTADO (id_prova,id_piloto, nr_tempo_prova,nr_coloc_final,nr_posicao_grid,nr_melhor_volta) 
            values (303,19, '01: 27: 39', 5,17, 58);
insert into TB_RESULTADO (id_prova,id_piloto, nr_tempo_prova,nr_coloc_final,nr_posicao_grid,nr_melhor_volta) 
            values (304,20, '01: 27: 15', 5, 9, 58)
--  CONSULTA DE DADOS --
select * from TB_PROVA;
select * from TB_CIRCUITO;
select * from TB_PILOTO;
select * from TB_EQUIPE;
select * from TB_PAIS;
select * from TB_RESULTADO;

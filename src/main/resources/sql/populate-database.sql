INSERT INTO TB_CULTURA VALUES(CULTURA_SEQ.NEXTVAL, 'Arroz',	'Grãos');
INSERT INTO TB_CULTURA VALUES(CULTURA_SEQ.NEXTVAL, 'Milho',	'Grãos');
INSERT INTO TB_CULTURA VALUES(CULTURA_SEQ.NEXTVAL, 'Trigo',	'Grãos');
INSERT INTO TB_CULTURA VALUES(CULTURA_SEQ.NEXTVAL, 'Batata',	'Tubérculos');
INSERT INTO TB_CULTURA VALUES(CULTURA_SEQ.NEXTVAL, 'Banana',	'Frutas');
INSERT INTO TB_CULTURA VALUES(CULTURA_SEQ.NEXTVAL, 'Tomate',	'Legumes');
INSERT INTO TB_CULTURA VALUES(CULTURA_SEQ.NEXTVAL, 'Café',	'Bebidas');
INSERT INTO TB_CULTURA VALUES(CULTURA_SEQ.NEXTVAL, 'Soja',	'Grãos');
INSERT INTO TB_CULTURA VALUES(CULTURA_SEQ.NEXTVAL, 'Laranja',	'Frutas');
INSERT INTO TB_CULTURA VALUES(CULTURA_SEQ.NEXTVAL, 'Cebola',	'Legumes');
INSERT INTO TB_CULTURA VALUES(CULTURA_SEQ.NEXTVAL, 'Algodão',	'Fibras');
INSERT INTO TB_CULTURA VALUES(CULTURA_SEQ.NEXTVAL, 'Maçã',	'Frutas');

INSERT INTO TB_PRODUCAO (ID_PRODUCAO, ANO, QUANTIDADE, ID_CULTURA) values (PRODUCAO_SEQ.NEXTVAL, 2021,	10000,	1);
INSERT INTO TB_PRODUCAO (ID_PRODUCAO, ANO, QUANTIDADE, ID_CULTURA) values (PRODUCAO_SEQ.NEXTVAL, 2021,	15000,	2);
INSERT INTO TB_PRODUCAO (ID_PRODUCAO, ANO, QUANTIDADE, ID_CULTURA) values (PRODUCAO_SEQ.NEXTVAL, 2021,	8000,	4);
INSERT INTO TB_PRODUCAO (ID_PRODUCAO, ANO, QUANTIDADE, ID_CULTURA) values (PRODUCAO_SEQ.NEXTVAL, 2021,	10000,	5);

INSERT INTO TB_CONSUMO (ID_CONSUMO, ANO, QUANTIDADE, ID_CULTURA) values(CONSUMO_SEQ.NEXTVAL, 2021,	8000,	1);
INSERT INTO TB_CONSUMO (ID_CONSUMO, ANO, QUANTIDADE, ID_CULTURA) values(CONSUMO_SEQ.NEXTVAL, 2021,	10000,	2);
INSERT INTO TB_CONSUMO (ID_CONSUMO, ANO, QUANTIDADE, ID_CULTURA) values(CONSUMO_SEQ.NEXTVAL, 2021,	6000,	4);
INSERT INTO TB_CONSUMO (ID_CONSUMO, ANO, QUANTIDADE, ID_CULTURA) values(CONSUMO_SEQ.NEXTVAL, 2021,	8000,	5);
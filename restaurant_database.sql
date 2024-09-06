CREATE SCHEMA avas;

--Criação da tabela .RESTAURANTES.
CREATE TABLE avas.RESTAURANTES(
id_r BIGINT PRIMARY KEY,
nome VARCHAR(50),
local_ VARCHAR(50),
preco INTEGER
);

--Inserção dos dados da tabela .RESTAURANTES.
INSERT INTO avas.RESTAURANTES (id_r, nome, local_, preco) VALUES (1,'McDonalds','Salvador',3);
INSERT INTO avas.RESTAURANTES (id_r, nome, local_, preco) VALUES (2,'Outback','Salvador',5);
INSERT INTO avas.RESTAURANTES (id_r, nome, local_, preco) VALUES (3,'McDonalds','Ilhéus',3);
INSERT INTO avas.RESTAURANTES (id_r, nome, local_, preco) VALUES (4,'LosPampas','Ilhéus',4);
INSERT INTO avas.RESTAURANTES (id_r, nome, local_, preco) VALUES (5,'BurguerKing','Salvador',3);

--Criação da tabela .AVALIACOES.
CREATE TABLE avas.AVALIACOES(
id_a BIGINT PRIMARY KEY,
id_r BIGINT,
nome VARCHAR(50),
avaliacao TEXT,
estrelas INTEGER,
 CONSTRAINT fk_restaurante FOREIGN KEY (id_r) REFERENCES avas.RESTAURANTES(id_r)
);

--Inserção dos dados da tabela .AVALIACOES.
INSERT INTO avas.AVALIACOES (id_a, id_r, nome, avaliacao, estrelas) VALUES (1,4,'Jotas','Melhor churrascariam porém um pouco cara!',5);
INSERT INTO avas.AVALIACOES (id_a, id_r, nome, avaliacao, estrelas) VALUES (2,2,'Beatriz','Melhor costela que já comi na vida! Recomendo!',5);
INSERT INTO avas.AVALIACOES (id_a, id_r, nome, avaliacao, estrelas) VALUES (3,4,'Marco','Não gosto muito do churrasco, mas por ter sushi eu adorei!',3);
INSERT INTO avas.AVALIACOES (id_a, id_r, nome, avaliacao, estrelas) VALUES (4,1,'Jonhatan','É como qualquer outro Mc que ja fui',3);
INSERT INTO avas.AVALIACOES (id_a, id_r, nome, avaliacao, estrelas) VALUES (5,3,'Luisa','Primeiro Mc de ilhéus, valeu apena esperar!',4);

--Criação de uma função
CREATE OR REPLACE FUNCTION atualizar_id_avaliacoes() RETURNS TRIGGER AS $$
DECLARE
  cur_row RECORD;  --Foi declarado como RECORD que armazenará cada linha da tabela .AVALIACOES.
  novo_id BIGINT := 1; 
BEGIN
  FOR cur_row IN SELECT * FROM avas.AVALIACOES ORDER BY id_a LOOP
    UPDATE avas.AVALIACOES SET id_a = novo_id WHERE id_a = cur_row.id_a; --Atualiza a coluna "id_a" da linha atual para o "novo_id".
    novo_id := novo_id + 1;  --Incrementa ou desenvolve o "novo_id" para o próximo valor sequêncial.
  END LOOP; --Vai continuar o loop até passar por todas as linhas, pra garantir que cada linha tenha o novo valor "id_a" ordenado de maneira sequêncial.
  RETURN NULL;
END;
$$ LANGUAGE plpgsql;

--Ciração de uma gatilho
CREATE TRIGGER trigger_atualizar_id_avaliacoes 
AFTER DELETE ON avas.AVALIACOES --Especificação que define que o gatilho só deve ser executado após a execução do comando DELETE.
FOR EACH STATEMENT
EXECUTE FUNCTION atualizar_id_avaliacoes();
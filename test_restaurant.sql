--Consulta de TODAS as colunas da tabela .RESTAURANTES em ordem crescente da variavel "id_r"
SELECT * FROM avas.RESTAURANTES ORDER BY id_r;

--Consulta de TODAS as colunas da tabela .AVALIACOES em ordem crescente da variavel "id_a"
SELECT * FROM avas.AVALIACOES ORDER BY id_a;

--Atualiza a tabela .RESTAURANTES, definindo o valor da coluna "preco" para 5 em TODOS os registros onde o valor da coluna "id_r" é igual a 4
UPDATE avas.RESTAURANTES SET preco = 5 WHERE id_r = 4

--Atualiza a tabela .AVALIACOES, definindo o valor da coluna "estrelas" para 2 em TODOS os registros onde o valor da coluna "id_a" é igual a 4
UPDATE avas.AVALIACOES SET estrelas = 2 WHERE id_a = 4

--Deleta a linha da tabela .AVALIACOES sob a condição de ter o "id_a" igual a 3.
DELETE FROM avas.AVALIACOES WHERE id_a = 3;
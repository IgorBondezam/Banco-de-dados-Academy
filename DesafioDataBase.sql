-- Exercicio 1 . Exiba os dados da compra (item_ordem_compra) de todos os materiais cujo a quantidade seja maior que 10;

SELECT * FROM item_ordem_compra as ioc 
WHERE ioc.quantidade > 10;



-- Exercicio 2 . Exiba os dados da compra (item_ordem_compra) de todos os materiais cujo o valor seja menor que 50;

SELECT * FROM item_ordem_compra as ioc 
WHERE ioc.valor < 50.00;



-- Exercicio 3 . Exibir os dados da compra de todos os materias cuja quantidade seja maior que 100 e o valor seja menor que 50, contendo o nome do material e o nome do fornecedor.  

SELECT ioc.*, m.nome, f.nome
FROM item_ordem_compra as ioc, material as m, ordem_compra as oc, fornecedor as f
WHERE ioc.quantidade > 100 AND valor < 50 AND ioc.idMaterial = m.id AND ioc.idOrdemCompra = oc.id AND oc.idFornecedor = f.id
ORDER BY ioc.idOrdemCompra;



-- Exercicio 4 . Exiba o sub total de cada material vendido, o nome do material e o nome do fornecedor, para cada item_ordem_compra.

SELECT ioc.idOrdemCompra, ioc.quantidade*valor as Subtotal, m.nome, f.nome 
FROM item_ordem_compra as ioc, material as m, fornecedor as f, ordem_compra as oc WHERE ioc.idMaterial = m.id AND ioc.idOrdemCompra = oc.id AND oc.idFornecedor = f.id ORDER BY ioc.idOrdemCompra;



-- Exercicio 5 . O nome do fornecedor da ordem de compra, a ordem de compra e o total pago pela ordem de compra.

SELECT oc.id, f.nome, SUM(quantidade * valor) as totalCompra
FROM ordem_compra as oc, fornecedor as f, item_ordem_compra as ioc
WHERE ioc.idOrdemCompra = oc.id AND oc.idFornecedor = f.id
GROUP BY oc.id;



-- Exercicio 6 . O nome do fornecedor da ordem de compra, a data da ordem de compra e o total pago pela ordem de compra, num determinado intervalo.

SELECT oc.id, f.nome, oc.data, SUM(quantidade * valor) as total
FROM fornecedor as f, ordem_compra as oc, item_ordem_compra as ioc
WHERE oc.idFornecedor = f.id AND ioc.idOrdemCompra = oc.id AND oc.data BETWEEN '2022-05-15' AND '2022-05-20'
GROUP BY oc.id;

-- Listar nome de cada material e o valor medio desse material

SELECT m.id, m.nome, AVG(valor) as media
FROM item_ordem_compra as ioc, material as m
WHERE ioc.idMaterial = m.id 
GROUP BY m.nome
ORDER BY m.id

-- Listar o nome de cada material e o valor medio desses materiais entre os dias 10/05/2022 e 13/05/2022

SELECT m.id, m.nome, AVG(valor) as media
FROM item_ordem_compra as ioc, material as m, ordem_compra
WHERE ioc.idMaterial = m.id AND ordem_compra.id = ioc.idOrdemCompra AND ordem_compra.data BETWEEN '2022-05-10' AND '2022-05-13'
GROUP BY m.nome
ORDER BY m.id


-- Qual o prontudo mais aparece nas compras

SELECT m.nome, COUNT(ioc.idMaterial) as Vezes
FROM item_ordem_compra as ioc, material as m
WHERE ioc.idMaterial = m.id
GROUP BY ioc.idMaterial
ORDER BY vezes DESC;

-- Comandos CRUD (Insert, Select, Update, Delete) 

-- Update - UPDATE material SET nome = 'Prego' WHERE id = 2

-- Delete - DELETE FROM item_ordem_compra WHERE item_ordem_compra.idOrdemCompra = 5 AND item_ordem_compra.idMaterial = 11
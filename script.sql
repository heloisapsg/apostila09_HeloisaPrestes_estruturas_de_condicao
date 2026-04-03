-- Don´t forget: Para cada exercício, produza duas soluções: uma que utilize apenas IF e suas
-- variações e outra que use apenas CASE e suas variações.

-- 1.1 Faça um programa que exibe se um número inteiro é múltiplo de 3.
-- jeito 1 : IF
DO $$
DECLARE
    numro INT := valor_aleatorio_entre(0, 100);
BEGIN
    IF numro % 3 = 0 THEN
        RAISE NOTICE '% é multiplo de 3', numro;
    ELSE
        RAISE NOTICE '% NÃO é multiplo de 3', numro;
    END IF;
END;
$$

-- jeito 2 : CASE
DO $$
DECLARE
    numro INT := valor_aleatorio_entre(0, 100);
BEGIN
    CASE numro % 3 
        WHEN 0 THEN
            RAISE NOTICE '% é multiplo de 3', numro;
        ELSE
            RAISE NOTICE '% NÃO é multiplo de 3', numro;
    END CASE;
END;
$$

-- 1.2 Faça um programa que exibe se um número inteiro é múltiplo de 3 ou de 5.
--jeito 1: IF
DO $$
DECLARE
    numzinho INT := valor_aleatorio_entre(0, 100);
BEGIN
    IF numzinho % 3 = 0 AND numzinho % 5 = 0 THEN
        RAISE NOTICE '% é múltiplo de 3 e de 5', numzinho;

    ELSEIF numzinho % 3 = 0 AND numzinho % 5 <> 0 THEN
        RAISE NOTICE '% é múltiplo de 3 e NÃO de 5', numzinho;

    ELSEIF numzinho % 3 <> 0 AND numzinho % 5 = 0 THEN
        RAISE NOTICE '% NÃO é múltiplo de 3, mas é múltiplo de 5', numzinho;

    ELSE --Não é múltiplo nem ne 3 nem de 5
        RAISE NOTICE '% não é múltiplo nem de 3 nem de 5', numzinho;

    END IF;
END;
$$

--jeito 2: CASE
DO $$

DECLARE
    numzinho INT := valor_aleatorio_entre(0, 100);    
BEGIN
    CASE TRUE
        WHEN numzinho % 3 = 0 AND numzinho % 5 = 0 THEN
            RAISE NOTICE '% é múltiplo de 3 e de 5', numzinho;
        WHEN numzinho % 3 = 0 AND numzinho % 5 <> 0 THEN
            RAISE NOTICE '% é múltiplo de 3 e NÃO de 5', numzinho;
        WHEN numzinho % 3 <> 0 AND numzinho % 5 = 0 THEN
            RAISE NOTICE '% NÃO é múltiplo de 3, mas é múltiplo de 5', numzinho;
        ELSE 
            RAISE NOTICE 'nopnop, % não é multiplo nem de 3 nem de 5', numzinho;
    END CASE;
END;
$$

-- 1.3 Faça um programa que opera de acordo com o seguinte menu
-- Opções:
--1 - Soma
--2 - Subtração
--3 - Multiplicação
--4 - Divisão
--Cada operação envolve dois números inteiros. O resultado deve ser exibido no formato
--Exemplo:
--op1 op op2 = res
--2 + 3 = 5

DO $$
DECLARE
    op1 INT := valor_aleatorio_entre(0, 20);
    op2 INT := valor_aleatorio_entre(0, 20);
    qual INT := valor_aleatorio_entre(0,3);
    op VARCHAR;
    res INT;
BEGIN
    IF qual = 0 THEN -- Soma
        op := '+';
        res = op1 + op2;
        RAISE NOTICE '% % % = %', op1, op, op2, res;

    ELSEIF qual = 1 THEN -- Subtração
        op:= '-';
        res = op1 - op2;
        RAISE NOTICE '% % % = %', op1, op, op2, res;

    ELSEIF qual = 2 THEN -- Multiplicação
        op := 'x';
        res = op1 * op2;
        RAISE NOTICE '% % % = %', op1, op, op2, res;

    ELSE -- Divisão quando qual = 3
        op := '/';
        res = op1 / op2;
        RAISE NOTICE '% % % = %', op1, op, op2, res;
    END IF;
END;
$$


-- 1.4 Um comerciante comprou um produto e quer vendê-lo com um lucro de 45% se o valor
-- da compra for menor que R$20. Caso contrário, ele deseja lucro de 30%. Faça um
-- programa que, dado o valor do produto, calcula o valor de venda.

-- 1.5 Resolva o problema disponível no link a seguir https://www.beecrowd.com.br/judge/en/problems/view/1048

CREATE OR REPLACE FUNCTION valor_aleatorio_entre (lim_inferior INT, lim_superior
INT) RETURNS INT AS
$$
BEGIN
RETURN FLOOR(RANDOM() * (lim_superior - lim_inferior + 1) + lim_inferior)::INT;
END;
$$ LANGUAGE plpgsql;
/*Criar uma query apresentanto os pilotos por equipe*/
select TB_EQUIPE.nm_equipe,nm_piloto from TB_PILOTO 
join TB_EQUIPE on TB_EQUIPE.id_equipe = TB_PILOTO.id_equipe
order by nm_equipe


/*Criar uma query que exibe a quantidade de pilotos por ano de nascimento, 
ordenando-os por este aspecto de forma ascendente – do ano mais antigo ao mais recente*/

select extract(year from dt_nascimento) as "Ano de Nascimento", count(nm_piloto) as "Qtd de Pilotos" from TB_PILOTO
group by extract(year from dt_nascimento)
order by "Ano de Nascimento"

   

/*Criar uma query que exibe o nome do piloto, o país de nascimento, nome da equipe, 
país da equipe, colocação final, nome do circuito e a data da realização da prova*/

select 
   nm_piloto, PAIS_PILOTO.nm_pais as pais_piloto, nm_equipe, PAIS_EQUIPE.nm_pais as pais_equipe, nr_coloc_final, nm_circuito,dt_prova 
from TB_PILOTO
    left join TB_PAIS PAIS_PILOTO
        on TB_PILOTO.id_pais = PAIS_PILOTO.id_pais
    join TB_EQUIPE 
        on TB_PILOTO.id_equipe = TB_EQUIPE.id_equipe
    left join TB_PAIS PAIS_EQUIPE
        on TB_EQUIPE.id_pais = PAIS_EQUIPE.id_pais
    join TB_RESULTADO
        on TB_PILOTO.id_piloto = TB_RESULTADO.id_piloto
    join TB_CIRCUITO
        on PAIS_EQUIPE.id_pais = TB_CIRCUITO.id_pais
    join TB_PROVA
        on TB_CIRCUITO.id_circuito = TB_PROVA.id_circuito
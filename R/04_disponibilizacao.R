# Criar conexão com banco de dados SQL
sql_tratados <- conectar_sql(local = 'dados2/dados_tratados.db')

# Transforma conexão com objeto tibble com fonte externa
tbl_tratatos <- dplyr::tbl(src = sql_tratados, from = 'tbl_tratados')

# Salvar tabela como csv
readr::write_csv(
    x = dplyr::collect(tbl_tratatos),
    file = 'aplicacao/dados_disponibilizados.csv'
)

# Encerrar conexao
DBI::dbDisconnect(conn = sql_tratados)

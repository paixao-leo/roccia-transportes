-- RESET COMPLETO DO BANCO
-- Use apenas se precisar limpar tudo

DROP TABLE IF EXISTS saldos CASCADE;
DROP TABLE IF EXISTS cargas CASCADE;
DROP TABLE IF EXISTS motoristas CASCADE;
DROP TABLE IF EXISTS clientes CASCADE;

SELECT 'Banco limpo com sucesso!' as status;

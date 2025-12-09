-- DESABILITAR ROW LEVEL SECURITY
-- Execute se estiver com problemas de permissão "Offline"

ALTER TABLE clientes DISABLE ROW LEVEL SECURITY;
ALTER TABLE cargas DISABLE ROW LEVEL SECURITY;
ALTER TABLE saldos DISABLE ROW LEVEL SECURITY;
ALTER TABLE motoristas DISABLE ROW LEVEL SECURITY;

SELECT 'RLS desabilitado com sucesso!' as status;

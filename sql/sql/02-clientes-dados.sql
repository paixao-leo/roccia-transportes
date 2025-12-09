-- DADOS DOS 16 CLIENTES
-- Execute após criar as tabelas

DELETE FROM clientes;

INSERT INTO clientes (nome, codigo, cnpj, telefone, email, contato_responsavel, endereco, ativo, observacoes) VALUES
('ALTAG', 'ALT001', '11.111.111/0001-11', '(11) 1111-1111', 'contato@altag.com.br', 'João Silva', 'Rua Industrial, 100, São Paulo, SP', true, 'Cliente ativo - Setor industrial'),
('BAUMINAS', 'BAU001', '22.222.222/0001-22', '(31) 2222-2222', 'logistica@bauminas.com.br', 'Maria Santos', 'Av. das Minas, 200, Belo Horizonte, MG', true, 'Cliente de Minas Gerais - Mineração'),
('BIOPLANTA', 'BIO001', '33.333.333/0001-33', '(47) 3333-3333', 'comercial@bioplanta.com.br', 'Pedro Oliveira', 'Rod. SC-401, Km 10, Florianópolis, SC', true, 'Especializada em produtos biológicos'),
('FAIRFEED', 'FAI001', '44.444.444/0001-44', '(51) 4444-4444', 'vendas@fairfeed.com.br', 'Ana Costa', 'Distrito Industrial, 300, Porto Alegre, RS', true, 'Nutrição animal'),
('HARVEST WIRST', 'HAR001', '55.555.555/0001-55', '(19) 5555-5555', 'harvest@wirst.com.br', 'Carlos Mendes', 'Via Anhanguera, 400, Campinas, SP', true, 'Processamento de grãos'),
('IMBRA', 'IMB001', '66.666.666/0001-66', '(21) 6666-6666', 'contato@imbra.com.br', 'Roberto Silva', 'Av. Brasil, 500, Rio de Janeiro, RJ', true, 'Indústria brasileira'),
('KIMBERLIT', 'KIM001', '77.777.777/0001-77', '(67) 7777-7777', 'kimberlit@empresa.com.br', 'Fernanda Lima', 'Rod. MS-040, Km 15, Campo Grande, MS', true, 'Mineração e beneficiamento'),
('MELACOS', 'MEL001', '88.888.888/0001-88', '(16) 8888-8888', 'vendas@melacos.com.br', 'Lucas Pereira', 'Usina São João, s/n, Ribeirão Preto, SP', true, 'Produção de melaço'),
('ODS', 'ODS001', '99.999.999/0001-99', '(85) 9999-9999', 'ods@contato.com.br', 'Marina Souza', 'Complexo Portuário, 600, Fortaleza, CE', true, 'Operações portuárias'),
('ORGUEL', 'ORG001', '10.101.010/0001-10', '(62) 1010-1010', 'orguel@comercial.com.br', 'Rafael Santos', 'Setor Industrial, 700, Goiânia, GO', true, 'Produtos orgânicos'),
('SILVA TEAM', 'SIL001', '11.222.333/0001-44', '(11) 1122-3344', 'silvateam@contato.com.br', 'Silvana Silva', 'Av. Paulista, 800, São Paulo, SP', true, 'Equipe especializada'),
('TDM', 'TDM001', '12.345.678/0001-90', '(19) 1234-5678', 'tdm@empresa.com.br', 'Marcos Oliveira', 'Distrito Industrial TDM, Sumaré, SP', true, 'Tecnologia e desenvolvimento'),
('TROUW NUTRITION', 'TRO001', '13.579.246/0001-35', '(11) 1357-9246', 'trouw@nutrition.com.br', 'Dr. Anderson Lima', 'Complexo Nutricional, 900, Campinas, SP', true, 'Nutrição animal de alta qualidade'),
('TUBESTEEL', 'TUB001', '14.682.579/0001-46', '(41) 1468-2579', 'tubesteel@aco.com.br', 'Eng. Paulo Ferro', 'Zona Industrial, 1000, Curitiba, PR', true, 'Tubos e estruturas de aço'),
('TUBOS OLIVEIRA', 'TUO001', '15.793.684/0001-57', '(31) 1579-3684', 'tubos@oliveira.com.br', 'José Oliveira', 'Rod. BR-381, Km 25, Betim, MG', true, 'Fabricação de tubos especiais'),
('WIRSTCHAT', 'WIR001', '16.248.135/0001-62', '(51) 1624-8135', 'wirstchat@digital.com.br', 'Tech Support', 'Centro Empresarial, 1100, Porto Alegre, RS', true, 'Soluções digitais e comunicação');

SELECT COUNT(*) as total_clientes FROM clientes;

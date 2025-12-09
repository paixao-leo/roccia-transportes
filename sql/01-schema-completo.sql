-- SCHEMA COMPLETO - ROCCIA TRANSPORTES
-- Execute este SQL no Supabase SQL Editor

-- =====================
-- TABELA CLIENTES
-- =====================
CREATE TABLE IF NOT EXISTS clientes (
    id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
    nome TEXT NOT NULL,
    codigo TEXT UNIQUE,
    cnpj TEXT,
    telefone TEXT,
    email TEXT,
    contato_responsavel TEXT,
    endereco TEXT,
    ativo BOOLEAN DEFAULT true,
    observacoes TEXT,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- =====================
-- TABELA MOTORISTAS  
-- =====================
CREATE TABLE IF NOT EXISTS motoristas (
    id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
    nome TEXT NOT NULL,
    cpf TEXT UNIQUE,
    rg TEXT,
    telefone TEXT,
    email TEXT,
    endereco TEXT,
    cep TEXT,
    cidade TEXT,
    estado TEXT,
    cnh TEXT,
    categoria_cnh TEXT,
    vencimento_cnh DATE,
    banco TEXT,
    agencia TEXT,
    conta TEXT,
    pix TEXT,
    observacoes TEXT,
    ativo BOOLEAN DEFAULT true,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- =====================
-- TABELA CARGAS
-- =====================
CREATE TABLE IF NOT EXISTS cargas (
    id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
    num_carga INTEGER NOT NULL UNIQUE,
    data_carga DATE NOT NULL,
    origem TEXT NOT NULL,
    destino TEXT NOT NULL,
    cliente_id UUID REFERENCES clientes(id),
    motorista_id UUID REFERENCES motoristas(id),
    motorista_nome TEXT NOT NULL,
    mercadoria TEXT,
    peso DECIMAL(10,2),
    unidade_peso TEXT DEFAULT 'TON',
    valor_frete DECIMAL(10,2) NOT NULL,
    valor_motorista DECIMAL(10,2),
    percentual_adiantamento DECIMAL(5,2) DEFAULT 80.00,
    status TEXT DEFAULT 'em-aberto' CHECK (status IN ('em-aberto', 'em-transito', 'entregue', 'cancelado')),
    data_entrega DATE,
    data_saida DATE,
    km_total INTEGER,
    pedagio DECIMAL(8,2),
    combustivel DECIMAL(8,2),
    observacoes TEXT,
    manifesto TEXT,
    nota_fiscal TEXT,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- =====================
-- TABELA SALDOS
-- =====================
CREATE TABLE IF NOT EXISTS saldos (
    id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
    carga_id UUID REFERENCES cargas(id) ON DELETE CASCADE,
    motorista_id UUID REFERENCES motoristas(id),
    num_carga INTEGER,
    motorista_nome TEXT NOT NULL,
    tipo TEXT DEFAULT 'adiantamento' CHECK (tipo IN ('adiantamento', 'saldo_final', 'bonus', 'desconto')),
    valor DECIMAL(10,2) NOT NULL,
    percentual DECIMAL(5,2),
    status TEXT DEFAULT 'pendente' CHECK (status IN ('pendente', 'pago', 'cancelado')),
    data_vencimento DATE,
    data_pagamento DATE,
    forma_pagamento TEXT,
    comprovante TEXT,
    observacoes TEXT,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- =====================
-- ÍNDICES PARA PERFORMANCE
-- =====================
CREATE INDEX IF NOT EXISTS idx_cargas_data_carga ON cargas(data_carga DESC);
CREATE INDEX IF NOT EXISTS idx_cargas_status ON cargas(status);
CREATE INDEX IF NOT EXISTS idx_cargas_motorista ON cargas(motorista_id);
CREATE INDEX IF NOT EXISTS idx_cargas_cliente ON cargas(cliente_id);
CREATE INDEX IF NOT EXISTS idx_saldos_status ON saldos(status);
CREATE INDEX IF NOT EXISTS idx_saldos_motorista ON saldos(motorista_id);
CREATE INDEX IF NOT EXISTS idx_saldos_data_pagamento ON saldos(data_pagamento);

-- =====================
-- TRIGGERS PARA AUTO-UPDATE
-- =====================
CREATE OR REPLACE FUNCTION update_updated_at_column()
RETURNS TRIGGER AS $$
BEGIN
    NEW.updated_at = NOW();
    RETURN NEW;
END;
$$ language 'plpgsql';

CREATE TRIGGER update_clientes_updated_at BEFORE UPDATE ON clientes
    FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();

CREATE TRIGGER update_motoristas_updated_at BEFORE UPDATE ON motoristas
    FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();

CREATE TRIGGER update_cargas_updated_at BEFORE UPDATE ON cargas
    FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();

CREATE TRIGGER update_saldos_updated_at BEFORE UPDATE ON saldos
    FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();

SELECT 'Schema criado com sucesso!' as status;

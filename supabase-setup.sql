-- ============================================================
-- Sistema de Atendimento Hospitalar — Setup Supabase
-- Execute este script no SQL Editor do seu projeto Supabase
-- ============================================================

-- TABELA: fila de atendimento
CREATE TABLE IF NOT EXISTS fila (
  id          TEXT PRIMARY KEY,
  num         TEXT NOT NULL,
  nome        TEXT NOT NULL,
  nasc        TEXT DEFAULT '',
  tel         TEXT DEFAULT '',
  esp         TEXT NOT NULL,
  med         TEXT NOT NULL,
  med_id      INTEGER,
  consul_num  INTEGER,
  hora        TEXT NOT NULL,
  status      TEXT NOT NULL DEFAULT 'aguardando',
  obs         TEXT DEFAULT '',
  duracao     TEXT,
  fim         TEXT,
  created_at  TIMESTAMPTZ DEFAULT NOW()
);

-- TABELA: médicos
CREATE TABLE IF NOT EXISTS medicos (
  id     SERIAL PRIMARY KEY,
  nome   TEXT NOT NULL,
  esp    TEXT NOT NULL,
  consul INTEGER NOT NULL,
  ativo  BOOLEAN DEFAULT TRUE
);

-- TABELA: especialidades
CREATE TABLE IF NOT EXISTS especialidades (
  id   SERIAL PRIMARY KEY,
  nome TEXT NOT NULL UNIQUE
);

-- TABELA: configurações (senhas)
CREATE TABLE IF NOT EXISTS configuracoes (
  chave TEXT PRIMARY KEY,
  valor TEXT NOT NULL
);

-- ── DADOS INICIAIS ───────────────────────────────────────

INSERT INTO medicos (nome, esp, consul, ativo) VALUES
  ('Dr. Carlos Mendes', 'Cardiologia',   1, TRUE),
  ('Dra. Ana Lima',     'Pediatria',     2, TRUE),
  ('Dr. Roberto Souza', 'Clínica geral', 3, TRUE)
ON CONFLICT DO NOTHING;

INSERT INTO especialidades (nome) VALUES
  ('Clínica geral'), ('Cardiologia'), ('Ortopedia'),
  ('Pediatria'), ('Ginecologia'), ('Dermatologia')
ON CONFLICT DO NOTHING;

INSERT INTO configuracoes (chave, valor) VALUES
  ('senha_recepcao', '1234'),
  ('senha_medico',   '5678'),
  ('senha_admin',    '9999')
ON CONFLICT DO NOTHING;

-- ── DESABILITAR RLS (para testes) ────────────────────────
-- Para produção, troque por políticas de acesso adequadas

ALTER TABLE fila          DISABLE ROW LEVEL SECURITY;
ALTER TABLE medicos       DISABLE ROW LEVEL SECURITY;
ALTER TABLE especialidades DISABLE ROW LEVEL SECURITY;
ALTER TABLE configuracoes  DISABLE ROW LEVEL SECURITY;

-- ── HABILITAR REALTIME ───────────────────────────────────
ALTER PUBLICATION supabase_realtime ADD TABLE fila;
ALTER PUBLICATION supabase_realtime ADD TABLE medicos;
ALTER PUBLICATION supabase_realtime ADD TABLE especialidades;

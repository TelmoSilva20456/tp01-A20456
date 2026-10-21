DROP TABLE IF EXISTS fact_alerta;
DROP TABLE IF EXISTS fact_partida;
DROP TABLE IF EXISTS resumo_jogador;
DROP TABLE IF EXISTS dim_jogador;
DROP TABLE IF EXISTS dim_torneio;

CREATE TABLE dim_jogador (
    jogador_id INTEGER PRIMARY KEY,
    nome VARCHAR(80) NOT NULL,
    pais CHAR(3) NOT NULL,
    mao CHAR(1)
);

CREATE TABLE dim_torneio (
    torneio_id VARCHAR(20) PRIMARY KEY,
    nome VARCHAR(80) NOT NULL,
    superficie VARCHAR(20),
    nivel VARCHAR(20),
    cidade VARCHAR(40),
    pais VARCHAR(40),
    data_inicio DATE
);

CREATE TABLE fact_partida (
    partida_id INTEGER PRIMARY KEY,
    torneio_id VARCHAR(20),
    torneio_nome VARCHAR(80),
    data_partida DATE,
    ronda VARCHAR(8),
    vencedor_id INTEGER,
    vencedor_nome VARCHAR(80),
    pais_vencedor CHAR(3),
    vencido_id INTEGER,
    vencido_nome VARCHAR(80),
    pais_vencido CHAR(3),
    resultado VARCHAR(40),
    ranking_vencedor INTEGER,
    ranking_vencido INTEGER,
    upset INTEGER,
    titulo INTEGER
);

CREATE TABLE fact_alerta (
    partida_id INTEGER PRIMARY KEY,
    torneio_nome VARCHAR(80),
    ronda VARCHAR(8),
    vencedor_nome VARCHAR(80),
    pais_vencedor CHAR(3),
    vencido_nome VARCHAR(80),
    resultado VARCHAR(40),
    motivo VARCHAR(40)
);

CREATE TABLE resumo_jogador (
    jogador_id INTEGER PRIMARY KEY,
    nome VARCHAR(80),
    pais CHAR(3),
    vitorias INTEGER,
    titulos INTEGER
);

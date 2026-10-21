# TP1 ISI 2026/27 — A20456

Autor: Telmo Silva, número A20456, email a20456@alunos.ipca.pt.  
Trabalho individual.  
Unidade curricular: Integração de Sistemas de Informação.  
Curso: Licenciatura em Engenharia de Sistemas Informáticos, IPCA.  
Tema: integração de resultados de torneios de ténis.

Ferramentas: Pentaho Data Integration (Spoon) 10.2 e PostgreSQL 17.  
Base de dados: `tenis_tp1`, no servidor local, porta 5432, utilizador `postgres`.

Repositório: https://github.com/TelmoSilva20456/tp01-A20456  
Vídeo da demonstração: https://drive.google.com/file/d/11P3w5oj8wkNbekdjGI4sQjn4z8YICFPO/view

## Ficheiros

- `doc/A20456_doc.pdf` — relatório.
- `dataintegration/Fase_1` — job e transformações da recolha.
- `dataintegration/Fase_2` — cópia da Fase 1 mais a transformação.
- `dataintegration/Fase_3` — cópia da Fase 2 mais a carga, a exportação, o email e o script `sql/001_schema.sql`.
- `data/input` — CSV das partidas, JSON dos torneios, XML dos jogadores e YAML das regras.
- `data/output` — exemplos já gerados: staging, ficheiros transformados e `export/alertas.csv`.
- `src` — não há aplicação à parte. O processo está nos ficheiros do Spoon.

Os dados são de demonstração. Não são o calendário oficial da ATP.

## Como executar

1. Instalar o Pentaho Data Integration 10.2 e usar Java 17 de 64 bits.
2. No PostgreSQL, criar a base `tenis_tp1` e correr `dataintegration/Fase_3/sql/001_schema.sql`.
3. Abrir o Spoon.
4. A ligação usada nas transformações chama-se **Tenis local**. Se a password local do PostgreSQL for diferente, alterar essa ligação no Spoon antes de correr.
5. O passo **Mail** envia para `a20456@alunos.ipca.pt` por `smtp.office365.com`, porta 587, TLS. A password não vai neste repositório. No separador Server desse passo, colocar a password de aplicação da conta da escola.

A Fase 1 corre com `dataintegration/Fase_1/job_fase1_recolha.kjb`. Lê as quatro fontes e grava as cópias em staging.  
A Fase 2 corre com `dataintegration/Fase_2/job_fase2_transformacao.kjb`. Chama a recolha, limpa os nomes e transforma as partidas.  
A Fase 3 corre com `dataintegration/Fase_3/job_fase3_carga.kjb`. Chama a Fase 2, grava as cinco tabelas em `tenis_tp1`, exporta `alertas.csv` e envia o email.

Resultado esperado da carga: 12 jogadores, 5 torneios, 18 partidas, 9 alertas e 5 resumos.

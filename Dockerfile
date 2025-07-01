# Usa imagem oficial do n8n
FROM n8nio/n8n:1.45.0

# Troca para root para instalar dependências
USER root

# Instala o FFmpeg e dependências
RUN apt-get update && \
    apt-get install -y ffmpeg python3 build-essential && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Volta para o usuário padrão do n8n
USER node

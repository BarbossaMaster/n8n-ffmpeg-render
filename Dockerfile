# Usa imagem Debian com Node.js
FROM node:20-bullseye

# Instala dependências do sistema e FFmpeg
RUN apt-get update && \
    apt-get install -y ffmpeg python3 build-essential && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Instala o n8n e os nós extras (incluindo OpenAI oficial)
RUN npm install -g n8n "@n8n/nodes-openai"

# Define porta padrão do n8n
EXPOSE 5678

# Cria volume para dados persistentes
VOLUME ["/home/node/.n8n"]

# Inicia o n8n
CMD ["n8n"]

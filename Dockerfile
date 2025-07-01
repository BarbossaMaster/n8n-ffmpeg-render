# Usa imagem Debian com Node.js
FROM node:20-bullseye

# Instala dependências do sistema
RUN apt-get update && \
    apt-get install -y ffmpeg python3 build-essential && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Instala n8n e o nó OpenAI correto
RUN npm install -g n8n @n8n/nodes-openai

# Define porta
EXPOSE 5678

# Cria volume para persistência de dados
VOLUME ["/home/node/.n8n"]

# Roda o n8n
CMD ["n8n"]

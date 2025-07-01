# Usa a imagem oficial do n8n
FROM n8nio/n8n

# Atualiza pacotes e instala FFmpeg
USER root
RUN apt-get update && \
    apt-get install -y ffmpeg && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Retorna para o usuário n8n
USER node

# Instala o nó oficial do OpenAI atualizado
RUN npm install -g @n8n/nodes-openai

# Inicia o n8n
CMD ["n8n"]

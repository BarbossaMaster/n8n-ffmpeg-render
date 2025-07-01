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

# Instala os nós personalizados do OpenAI (última versão)
RUN npm install n8n-nodes-openai@latest

# Inicia o n8n
CMD ["n8n"]

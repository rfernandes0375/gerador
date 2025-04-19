FROM python:3.9-slim

# Instalar LibreOffice e outras dependências do sistema
RUN apt-get update && apt-get install -y \
    libreoffice \
    --no-install-recommends \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

# Copiar os arquivos do projeto
COPY . .

# Instalar dependências Python
RUN pip install --no-cache-dir -r requirements.txt

# Expor a porta que o Streamlit usa
EXPOSE 8501

# Definir variável de ambiente para o Streamlit
ENV PORT=8501

# Comando para iniciar o aplicativo
CMD streamlit run app.py --server.port $PORT --server.address 0.0.0.0
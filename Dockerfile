
From python:3.9-slim

WORKDIR /app_data

RUN apt-get update \
    && apt-get install -y gcc default-libmysqlclient-dev pkg-config \
    && rm -rf /var/lib/apt/lists/*

COPY . .

COPY requirements.txt .

RUN pip install mysqlclient
RUN pip install --no-cache-dir -r requirements.txt

CMD ["python", "app.py"]

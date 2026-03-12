FROM python:3.11-slim-bookworm

WORKDIR /app

RUN useradd --create-home --shell /bin/bash appuser

COPY requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt

COPY . .

USER appuser

EXPOSE 5000

ENV FLASK_ENV=production
ENV REDIS_HOST=localhost
ENV REDIS_PORT=6379

CMD ["gunicorn","-b", "0.0.0.0:5000", "app:app"]


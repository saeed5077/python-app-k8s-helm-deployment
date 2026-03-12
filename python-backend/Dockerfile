FROM python:3.13-slim AS builder

WORKDIR /app

RUN apt-get update && apt-get install -y --no-install-recommends \
    gcc \
    python3-dev \
    && rm -rf /var/lib/apt/lists/*

COPY pyproject.toml .

RUN pip install --upgrade pip && \
    pip install --prefix=/install . asyncpg

FROM python:3.13-slim

WORKDIR /app

RUN groupadd -g 999 python && \
    useradd -r -u 999 -g python python

COPY --from=builder /install /usr/local
COPY . .

RUN chown -R python:python /app
USER python

EXPOSE 8000

CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]
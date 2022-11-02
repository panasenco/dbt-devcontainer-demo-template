# [Choice] Python version (use -bullseye variants on local arm64/Apple Silicon): 3, 3.10, 3.9, 3.8, 3.7, 3.6, 3-bullseye, 3.10-bullseye, 3.9-bullseye, 3.8-bullseye, 3.7-bullseye, 3.6-bullseye, 3-buster, 3.10-buster, 3.9-buster, 3.8-buster, 3.7-buster, 3.6-buster
FROM mcr.microsoft.com/vscode/devcontainers/python:3.9-bullseye

ENV PYTHONUNBUFFERED 1

RUN pip install --upgrade pip

RUN pip install meltano

USER vscode
WORKDIR /workspace
RUN meltano init demo
WORKDIR /workspace/demo
RUN meltano add loader target-postgres \
    && meltano config target-postgres set host warehouse \
    && meltano config target-postgres set user postgres \
    && meltano config target-postgres set password postgres \
    && meltano config target-postgres set dbname postgres \
    && meltano add transformer dbt-postgres \
    && meltano config dbt-postgres set host warehouse \
    && meltano config dbt-postgres set port 5432 \
    && meltano config dbt-postgres set user postgres \
    && meltano config dbt-postgres set password postgres \
    && meltano config dbt-postgres set dbname postgres \
    && meltano config dbt-postgres set schema analytics \
    && meltano invoke dbt-postgres:docs-generate

WORKDIR /workspace
RUN mv /workspace/demo /tmp

ENTRYPOINT ["python", "-m", "http.server", "--directory", "/workspace/demo/.meltano/transformers/dbt/target", "8081"]
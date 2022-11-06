# [Choice] Python version (use -bullseye variants on local arm64/Apple Silicon): 3, 3.10, 3.9, 3.8, 3.7, 3.6, 3-bullseye, 3.10-bullseye, 3.9-bullseye, 3.8-bullseye, 3.7-bullseye, 3.6-bullseye, 3-buster, 3.10-buster, 3.9-buster, 3.8-buster, 3.7-buster, 3.6-buster
FROM mcr.microsoft.com/vscode/devcontainers/python:3.9-bullseye

RUN pip install --upgrade pip
RUN pip install dbt-postgres

USER vscode
WORKDIR /workspace

RUN mkdir -p /home/vscode/.dbt
COPY profiles.yml /home/vscode/.dbt

ENTRYPOINT ["python", "-m", "http.server", "--directory", "/workspace/target", "8081"]
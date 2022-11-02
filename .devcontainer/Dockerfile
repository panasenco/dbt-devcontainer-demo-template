# [Choice] Python version (use -bullseye variants on local arm64/Apple Silicon): 3, 3.10, 3.9, 3.8, 3.7, 3.6, 3-bullseye, 3.10-bullseye, 3.9-bullseye, 3.8-bullseye, 3.7-bullseye, 3.6-bullseye, 3-buster, 3.10-buster, 3.9-buster, 3.8-buster, 3.7-buster, 3.6-buster
FROM mcr.microsoft.com/vscode/devcontainers/python:3.9-bullseye

ENV PYTHONUNBUFFERED 1

RUN pip install --upgrade pip

RUN pip install meltano

RUN mkdir -p /workspace/demo/.meltano/transformers/dbt/target

# [Optional] Uncomment this section to install additional OS packages.
# RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
#     && apt-get -y install --no-install-recommends <your-package-list-here>

ENTRYPOINT ["python", "-m", "http.server", "--directory", "/workspace/demo/.meltano/transformers/dbt/target", "8081"]
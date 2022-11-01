# meltano-dbt-demo-template
Template to create self-contained demos of loading data with Meltano and transforming with dbt. Useful for interviews.

Based on Microsoft's [python3-postgres](https://github.com/microsoft/vscode-dev-containers/tree/main/containers/python-3-postgres) example.

## Setup

1.  [Install Docker](https://docs.docker.com/engine/install/).
2.  [Install VS Code](https://code.visualstudio.com/Download) and [install Dev Containers](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers).
3.  [Open this folder in a container](https://code.visualstudio.com/docs/devcontainers/containers#_quick-start-open-an-existing-folder-in-a-container) in VS Code. A folder named "demo" containing your Meltano project should be automatically created.
4.  Open http://localhost:8080 to access Postgres administration and querying. Choose "PostgreSQL" as the system, and enter "postgres" as the username and password.
5.  Open http://localhost:8081 to see dbt docs.

## Usage
1.  `cd demo`
2.  [Set up your loader](https://docs.meltano.com/getting-started/part1). For example, for CSV data:
    ```
    meltano add extractor tap-csv
    meltano config tap-csv set files '[{"entity":"test", "path": "../csv-data/test.csv", "keys": ["Name","Email","Phone Number","Address"]}]'
    ```

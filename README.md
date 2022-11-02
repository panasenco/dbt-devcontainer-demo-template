# meltano-dbt-demo-template
Template to create self-contained [dev container](https://containers.dev) demos of loading data with Meltano and transforming with dbt. Useful for interviews.

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
    meltano config tap-csv set files '[{"entity":"test", "path": "../csv-data", "keys": ["Email"]}]'
    ```
    Note that `target-postgres` requires at least one unique key to be defined. It's easy to verify whether a column is unique in a CSV file in Bash:
    ```
    cut -d, -f1 csv-data/test.csv | sort | uniq -d
    ```
    This will print duplicate rows in the first column of a CSV file.
3.  The loader [target-postgres](https://hub.meltano.com/loaders/target-postgres/) should already be pre-configured for you. Test it out with your loader (for example, `tap-csv`):
    ```
    meltano run tap-csv target-postgres
    ```
    Then log into Adminer at http://localhost:8080 and go to database `postgres`. You should now see a new schema `tap_csv` with your table in it.
4.  You can now declare your sources in your dbt project in `demo/transform`. To update docs, run `meltano invoke dbt-postgres:docs-generate`. The updated documentation will be available at http://localhost:8081. To run the transformations, run `meltano invoke dbt-postgres:run`. To run your tests, run `meltano invoke dbt-postgres:test`. Query your table data in Adminer at http://localhost:8080.
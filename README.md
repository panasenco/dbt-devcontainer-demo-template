# dbt-devcontainer-demo-template
Template to create self-contained [dev container](https://containers.dev) demos of transforming data with dbt. Useful for interviews.

Based on Microsoft's [python3-postgres](https://github.com/microsoft/vscode-dev-containers/tree/main/containers/python-3-postgres) example.


## Setup

1.  [Install Docker](https://docs.docker.com/engine/install/).
2.  [Install VS Code](https://code.visualstudio.com/Download) and [install the Dev Containers extension](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers).
3.  [Open this folder in a container](https://code.visualstudio.com/docs/devcontainers/containers#_quick-start-open-an-existing-folder-in-a-container) in VS Code. A folder named "demo" containing your dbt project should be automatically created.
4.  Open http://localhost:8080 to access Postgres administration and querying. Choose "PostgreSQL" as the system, and enter "postgres" as both the username and password.
5.  Open http://localhost:8081 to see dbt docs.


## Usage

1.  `cd demo`
2.  Copy your CSV file into `demo/seeds` to use it as a [dbt seed](https://docs.getdbt.com/docs/build/seeds).
3.  Run `dbt seed`
4.  Generate dbt schema for your seed using the following command (be sure to replace "test" with the basename of your CSV file):
    ```
    dbt run-operation generate_model_yaml --args '{"model_name": "test"}'`
    ```
    Copy and paste the output to a new file `seeds/schema.yml`.
    Re-generate the docs with `dbt docs generate` and you should now be able to see your source declaration when you refresh http://localhost:8081
5.  Code your transformations as usual. To update docs, run `dbt docs generate`. The updated documentation will be available on refresh at http://localhost:8081. Run the transformations with `dbt run` and tests with `dbt test` as usual. Query your table data in Adminer at http://localhost:8080.
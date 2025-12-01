--!jinja

-- See https://docs.snowflake.com/en/LIMITEDACCESS/execute-immediate-from-template

-- Create the Notebooks
--USE SCHEMA {{env}}_SCHEMA;

CREATE OR REPLACE NOTEBOOK IDENTIFIER('"DEMO_DB"."{{env}}_SCHEMA"."{{env}}_load_excel_files"')
    FROM '@"DEMO_DB"."INTEGRATIONS"."DEMO_GIT_REPO"/branches/"{{branch}}"/notebooks/load_excel_files/'
    QUERY_WAREHOUSE = 'DEMO_WH'
    MAIN_FILE = 'load_excel_files.ipynb';

ALTER NOTEBOOK "DEMO_DB"."{{env}}_SCHEMA"."{{env}}_load_excel_files" ADD LIVE VERSION FROM LAST;

CREATE OR REPLACE NOTEBOOK IDENTIFIER('"DEMO_DB"."{{env}}_SCHEMA"."{{env}}_load_daily_transactions_and_summaries"')
    FROM '@"DEMO_DB"."INTEGRATIONS"."DEMO_GIT_REPO"/branches/"{{branch}}"/notebooks/load_daily_transactions_and_summaries/'
    QUERY_WAREHOUSE = 'DEMO_WH'
    MAIN_FILE = 'load_daily_transactions_and_summaries.ipynb';

ALTER NOTEBOOK "DEMO_DB"."{{env}}_SCHEMA"."{{env}}_load_daily_transactions_and_summaries" ADD LIVE VERSION FROM LAST;

# Contributing
For general guidelines, check out a general contributing guidelines for `ex-aws` projects over at [`ex-aws/ex_aws`](https://github.com/ex-aws/ex_aws/blob/master/CONTRIBUTING.md).

## Getting Setup
The project provides a docker-compose file to use for setting up a development environment. There are 3 services defined

- test, a container for running automated test suites
- credo, a container for running a static analysis tool, `credo`
- docs, a container for generating documentation through `ex_docs`

Make sure you have docker installed on your machine then you can easily get started with the project using docker-compose. Otherwise, you can install Elixir directly on your machine to get started.

## Submitting Pull Requests
Before making a PR, please make sure appropriate test cases and documentations are provided or updated. Also ensure that it passes `credo` check.

FROM elixir:1.5-alpine

ADD ./ ex_aws_redshift/
WORKDIR /ex_aws_redshift

RUN mix local.hex --force
RUN mix local.rebar --force
RUN mix deps.get

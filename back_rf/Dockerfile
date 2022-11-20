FROM elixir:1.12.3

RUN apt-get update \
 && DEBIAN_FRONTEND=noninteractive \
    apt-get install --no-install-recommends --assume-yes \
      postgresql-client

WORKDIR /serv
RUN mix local.hex --force && \
    mix local.rebar --force
COPY mix.exs mix.lock ./
RUN mix deps.get && \
    mix deps.compile
COPY . .
RUN chmod +x /serv/dbdeploy.sh
EXPOSE 7777

ENTRYPOINT ["/serv/dbdeploy.sh"]
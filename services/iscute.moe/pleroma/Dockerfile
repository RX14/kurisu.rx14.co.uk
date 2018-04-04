FROM elixir:1.6.4-alpine

RUN apk add --no-cache git build-base \
 && adduser -S pleroma \
 && mkdir /pleroma \
 && chown -R pleroma /pleroma

USER pleroma

ENV MIX_ENV prod

ARG pleroma_version
RUN git clone https://git.pleroma.social/pleroma/pleroma.git /pleroma \
 && cd /pleroma \
 && git checkout ${pleroma_version}

ADD config.exs /pleroma/config/prod.exs
ADD config.secret.exs /pleroma/config/prod.secret.exs

WORKDIR /pleroma

RUN mix local.hex --force \
 && mix local.rebar --force \
 && mix deps.get --force \
 && mix compile

CMD mkdir -p /tmp/elixir_tzdata_data \
 && mix ecto.migrate \
 && exec mix phx.server

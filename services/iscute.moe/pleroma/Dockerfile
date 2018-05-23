FROM elixir:1.6.5-alpine

RUN apk add --no-cache git build-base \
 && adduser -S -u 5439 pleroma \
 && mkdir /pleroma \
 && chown -R pleroma /pleroma

USER pleroma

ENV MIX_ENV prod

ARG pleroma_version
RUN git clone https://git.pleroma.social/pleroma/pleroma.git /pleroma \
 && cd /pleroma \
 && git checkout ${pleroma_version}

ADD favicon.png /pleroma/priv/static/favicon.png
ADD instance-thumbnail.jpg /pleroma/priv/static/instance/thumbnail.jpeg
ADD emoji/ /pleroma/priv/static/emoji/
ADD emoji.txt /pleroma/config/emoji.txt
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

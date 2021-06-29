FROM bitwalker/alpine-elixir:latest AS release_stage

COPY mix.exs .
COPY mix.lock .
RUN mix deps.get
RUN mix deps.compile

COPY config ./config
COPY lib ./lib
COPY test ./test

ENV MIX_ENV=prod
RUN mix phx.digest
RUN mix release

FROM bitwalker/alpine-elixir:latest AS run_stage

COPY --from=release_stage $HOME/_build .
RUN chown -R default: ./prod
USER default
CMD ["./prod/rel/release_for_mikoszcz/bin/release_for_mikoszcz", "start"]
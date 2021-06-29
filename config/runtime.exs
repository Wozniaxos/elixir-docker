import Config

miko_env = System.fetch_env!("MIKO_ENV")

config :release_for_mikoszcz, ReleaseForMikoszczWeb.Endpoint,
  http: [:inet6, port: 4000],
  # This is to make usage easier for passing only one env
  secret_key_base: "S9dG/fEJwsFKQZSz4rlWTxGqhqT2H8HFFq8Q6Nmi0Z4icq3XWNpCoixDX/hLqaJ9"

config :release_for_mikoszcz,
  miko_env: miko_env

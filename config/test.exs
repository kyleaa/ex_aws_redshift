use Mix.Config

config :ex_aws,
  access_key_id: [{:system, "AWS_ACCESS_KEY_ID"}, :instance_role],
  secret_access_key: [{:system, "AWS_SECRET_ACCESS_KEY"}, :instance_role],
  region: "us-west-2",
  redshift: [
    scheme: "https://",
    host: "redshift.us-west-2.amazonaws.com",
    region: "us-west-2"
  ]

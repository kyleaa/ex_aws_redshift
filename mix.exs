defmodule ExAws.RedShift.Mixfile do
  use Mix.Project

  def project do
    [
      app: :ex_aws_redshift,
      version: "0.1.0",
      elixir: "~> 1.5",
      start_permanent: Mix.env == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
     {:credo, "~> 0.8", only: [:dev, :test], runtime: false},
     {:ex_aws, "~> 1.1"}
    ]
  end
end
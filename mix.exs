defmodule ExAws.RedShift.Mixfile do
  use Mix.Project

  def project do
    [
      app: :ex_aws_redshift,
      version: "0.1.0",
      elixir: "~> 1.4",
      start_permanent: Mix.env == :prod,
      deps: deps(),
      # Hex
      description: "A RedShift service package for ex_aws.",
      package: [
        maintainers: ["May Pongpitpitak"],
        licenses: ["MIT"],
        links: %{"Github" => "https://github.com/mayppong/ex_aws_redshift"}
      ],
      # docs
      name: "ExAws.RedShift",
      source_url: "https://github.com/mayppong/ex_aws_redshift",
      docs: [main: "ExAws.RedShift", extras: ["README.md"]]
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
     {:ex_aws, "~> 2.0"},
     {:ex_doc, "~> 0.18", only: :dev, runtime: false},
     {:hackney, "~> 1.9"},
     {:poison, " ~> 3.1"}
    ]
  end
end

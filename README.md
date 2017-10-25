# ExAws.Redshift

A RedShift service package to `ex_aws`. The package provides one-to-one mapping function calls to RedShift APIs. Though, it currently only supports create, describe, modify, and delete cluster APIs.
Other convenient functions maybe provided in the future, once all the APIs are implemented.

While all the param meter options from AWS's own documentation are available, they have been renamed to better follow Elixir coding style, or shorten like `tag_keys` taking a list instead of needing to specify `Tag_Keys.Tag_Key.N`. Please checkout the documentation and examples for the key lists.

For details on each of Amazon's APIs functionalities, please consult their [official docs](http://docs.aws.amazon.com/redshift/latest/APIReference/API_Operations.html).

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `ex_aws_redshift` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:ex_aws_redshift, "~> 0.1.0"}
  ]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at [https://hexdocs.pm/ex_aws_redshift](https://hexdocs.pm/ex_aws_redshift).

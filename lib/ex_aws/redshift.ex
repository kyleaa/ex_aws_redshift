defmodule ExAws.RedShift do
  @moduledoc """
  Operations on AWS RedShift.
  """


  @doc """
  Describe the properties of the given cluster ID. If no cluster ID is given,
  a list of properties for all clusters is returned.

  Amazon docs: http://docs.aws.amazon.com/redshift/latest/APIReference/API_DescribeClusters.html

  ## Examples

    iex> ExAws.RedShift.describe_clusters([ClusterIdentifier: "2B"])
    %ExAws.Operation.Query{action: "DescribeClusters",
      params: %{"ClusterIdentifier" => "2B"},
      parser: &ExAws.Utils.identity/2, path: "/", service: "redshift"}
    iex> ExAws.RedShift.describe_clusters([ClusterIdentifier: "2B", some_wrong_key: "Eve"])
    %ExAws.Operation.Query{action: "DescribeClusters",
      params: %{"ClusterIdentifier" => "2B"},
      parser: &ExAws.Utils.identity/2, path: "/", service: "redshift"}
    iex> ExAws.RedShift.describe_clusters("A2", [])
    %ExAws.Operation.Query{action: "DescribeClusters",
      params: %{"ClusterIdentifier" => "A2"},
      parser: &ExAws.Utils.identity/2, path: "/", service: "redshift"}
    iex> ExAws.RedShift.describe_clusters("9S", [ClusterIdentifier: "21O"])
    %ExAws.Operation.Query{action: "DescribeClusters",
      params: %{"ClusterIdentifier" => "9S"},
      parser: &ExAws.Utils.identity/2, path: "/", service: "redshift"}
  """
  @describe_clusters_opts [:ClusterIdentifier, :Marker, :MaxRecords, :"TagKeys.TagKey.N", :"TagValues.TagValue.N"]
  @spec describe_clusters(String.t, Keyword.t) :: ExAws.Operation.Query.t
  @spec describe_clusters(Keyword.t) :: ExAws.Operation.Query.t
  def describe_clusters(id, opts) when is_bitstring(id) do
    opts
    |> Keyword.update(:ClusterIdentifier, id, fn(_) -> id end)
    |> describe_clusters()
  end
  def describe_clusters(opts \\ []) when is_list(opts) do
    opts
    |> build_params(@describe_clusters_opts)
    |> build_request("DescribeClusters")
  end

  # This function is used creating a param list that's compliance with
  # `ExAws.Operation.Query`'s struct.
  # It cleans a keyword list, keeping only keys appropriate for the request,
  # then convert everything to a map with string key instead of atom.
  @spec build_params(Keyword.t, Keyword.t) :: Map.t
  defp build_params(opts, keys) do
    opts
    |> Enum.filter(fn({k, _}) ->
      Enum.member?(keys, k)
    end)
    |> Enum.reduce(%{}, fn({k, v}, acc) ->
      acc |> Map.put(to_string(k), v)
    end)
  end

  # This function is used for building a request object that ExAws could use
  # to make the API call to AWS.
  @spec build_request(Map.t, String.t) :: %ExAws.Operation.Query{}
  defp build_request(params, action) do
    %ExAws.Operation.Query{
      service: "redshift",
      action: action,
      params: params
    }
  end
end

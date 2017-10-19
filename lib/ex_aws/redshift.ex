defmodule ExAws.RedShift do
  @moduledoc """
  Operations on AWS RedShift.
  """

  import ExAws.Utils, only: [camelize_key: 1]

  @type node_type :: [:ds1_xlarge | :ds1_8xlarge | :ds2_xlarge | :ds2_8xlarge |
                       :dc1_large | :dc1_8xlarge]

  @doc """
  Create a new cluster with the given cluster id.

  Required keys are cluster_identifier, master_username, master_user_password, and node_type.

  Amazon docs: http://docs.aws.amazon.com/redshift/latest/APIReference/API_CreateCluster.html

  ## Examples

      iex> ExAws.RedShift.create_cluster("A2", [master_username: "Nier", master_user_password: "Automata", node_type: "dc1_large"])
      %ExAws.Operation.Query{action: "CreateCluster",
        params: %{"Action" => "CreateCluster", "ClusterIdentifier" => "A2", "MasterUsername" => "Nier", "MasterUserPassword" => "Automata", "NodeType" => "dc1_large"},
        parser: &ExAws.Utils.identity/2, path: "/", service: "redshift"}

      iex> ExAws.RedShift.create_cluster("A2", [cluster_identifier: "21O", master_username: "Nier", master_user_password: "Automata", node_type: "dc1_large"])
      %ExAws.Operation.Query{action: "CreateCluster",
        params: %{"Action" => "CreateCluster", "ClusterIdentifier" => "A2", "MasterUsername" => "Nier", "MasterUserPassword" => "Automata", "NodeType" => "dc1_large"},
        parser: &ExAws.Utils.identity/2, path: "/", service: "redshift"}

      iex> ExAws.RedShift.create_cluster([cluster_identifier: "2B", master_username: "Nier", master_user_password: "Automata", node_type: "dc1_large"])
      %ExAws.Operation.Query{action: "CreateCluster",
        params: %{"Action" => "CreateCluster", "ClusterIdentifier" => "2B", "MasterUsername" => "Nier", "MasterUserPassword" => "Automata", "NodeType" => "dc1_large"},
        parser: &ExAws.Utils.identity/2, path: "/", service: "redshift"}
  """
  @create_cluster_opts [:cluster_identifier, :master_username, :master_user_password,
    :node_type, :allow_version_upgrade, :automated_snapshot_retention_period, :availability_zone,
    :cluster_parameter_group_name, :cluster_subnet_group_name, :cluster_type, :cluster_version,
    :db_name, :elastic_ip, :encrypted, :hsm_client_certificate_identifier, :hsm_configuration_identifier,
    :"iam_roles/_iam_role_arn"]
  @spec create_cluster(Keyword.t) :: ExAws.Operation.Query.t
  @spec create_cluster(String.t, Keyword.t) :: ExAws.Operation.Query.t
  def create_cluster(opts) when is_list(opts) do
    opts
    |> build_params(@create_cluster_opts)
    |> build_request("CreateCluster")
  end
  def create_cluster(id, opts) when is_bitstring(id) do
    opts
    |> set(:cluster_identifier, id)
    |> create_cluster()
  end


  @doc """
  Delete a RedShift cluster with the a given identifier.

  Required key is cluster_identifier.

  Amazon docs: http://docs.aws.amazon.com/redshift/latest/APIReference/API_DeleteCluster.html

  ## Examples

      iex> ExAws.RedShift.delete_cluster("2B", [])
      %ExAws.Operation.Query{action: "DeleteCluster",
        params: %{"Action" => "DeleteCluster", "ClusterIdentifier" => "2B"},
        parser: &ExAws.Utils.identity/2, path: "/", service: "redshift"}
  """
  @type delete_cluster_opts :: []
  @delete_cluster_opts [:cluster_identifier, :final_cluster_snapshot_identifier, :skip_final_cluster_snapshot]
  @spec delete_cluster(Keyword.t) :: ExAws.Operation.Query.t
  @spec delete_cluster(String.t, Keyword.t) :: ExAws.Operation.Query.t
  def delete_cluster(opts) when is_list(opts) do
    opts
    |> build_params(@delete_cluster_opts)
    |> build_request("DeleteCluster")
  end
  def delete_cluster(id, opts \\ []) when is_bitstring(id) do
    opts
    |> set(:cluster_identifier, id)
    |> delete_cluster()
  end


  @doc """
  Describe the properties of the given cluster ID. If no cluster ID is given,
  a list of properties for all clusters is returned.

  Amazon docs: http://docs.aws.amazon.com/redshift/latest/APIReference/API_DescribeClusters.html

  ## Examples

      iex> ExAws.RedShift.describe_clusters([cluster_identifier: "2B"])
      %ExAws.Operation.Query{action: "DescribeClusters",
        params: %{"Action" => "DescribeClusters", "ClusterIdentifier" => "2B"},
        parser: &ExAws.Utils.identity/2, path: "/", service: "redshift"}

      iex> ExAws.RedShift.describe_clusters([cluster_identifier: "2B", some_wrong_key: "Eve"])
      %ExAws.Operation.Query{action: "DescribeClusters",
        params: %{"Action" => "DescribeClusters", "ClusterIdentifier" => "2B"},
        parser: &ExAws.Utils.identity/2, path: "/", service: "redshift"}

      iex> ExAws.RedShift.describe_clusters("A2", [])
      %ExAws.Operation.Query{action: "DescribeClusters",
        params: %{"Action" => "DescribeClusters", "ClusterIdentifier" => "A2"},
        parser: &ExAws.Utils.identity/2, path: "/", service: "redshift"}

      iex> ExAws.RedShift.describe_clusters("9S", [cluster_identifier: "21O"])
      %ExAws.Operation.Query{action: "DescribeClusters",
        params: %{"Action" => "DescribeClusters", "ClusterIdentifier" => "9S"},
        parser: &ExAws.Utils.identity/2, path: "/", service: "redshift"}
  """
  @describe_clusters_opts [:cluster_identifier, :marker, :max_records, :"tag_keys/_tag_key",
    :"tag_values/_tag_value"]
  @spec describe_clusters(Keyword.t) :: ExAws.Operation.Query.t
  @spec describe_clusters(String.t, Keyword.t) :: ExAws.Operation.Query.t
  def describe_clusters(opts \\ []) when is_list(opts) do
    opts
    |> build_params(@describe_clusters_opts)
    |> build_request("DescribeClusters")
  end
  def describe_clusters(id, opts) when is_bitstring(id) do
    opts
    |> set(:cluster_identifier, id)
    |> describe_clusters()
  end


  @doc """
  Modify a cluster with a given ClusterIdentifier.

  Required key is cluster_identifier.

  Amazon docs: http://docs.aws.amazon.com/redshift/latest/APIReference/API_ModifyCluster.html

  ## Examples

      iex> ExAws.RedShift.modify_cluster("Adam", [])
      %ExAws.Operation.Query{action: "ModifyCluster",
        params: %{"Action" => "ModifyCluster", "ClusterIdentifier" => "Adam"},
        parser: &ExAws.Utils.identity/2, path: "/", service: "redshift"}

      iex> ExAws.RedShift.modify_cluster("Adam", [new_cluster_identifier: "Eve"])
      %ExAws.Operation.Query{action: "ModifyCluster",
        params: %{"Action" => "ModifyCluster", "ClusterIdentifier" => "Adam", "NewClusterIdentifier" => "Eve"},
        parser: &ExAws.Utils.identity/2, path: "/", service: "redshift"}

      iex> ExAws.RedShift.modify_cluster("Adam", [cluster_identifier: "Eve", "cluster_security_groups/_cluster_security_group_name": ["test", "tast"]])
      %ExAws.Operation.Query{action: "ModifyCluster",
        params: %{"Action" => "ModifyCluster", "ClusterIdentifier" => "Adam", "ClusterSecurityGroups.ClusterSecurityGroupName.1" => "test", "ClusterSecurityGroups.ClusterSecurityGroupName.2" => "tast"},
        parser: &ExAws.Utils.identity/2, path: "/", service: "redshift"}
  """
  @modify_cluster_opts [:cluster_identifier, :additional_info, :allow_version_upgrade,
    :automated_snapshot_retention_period, :cluster_parameter_group_name, :"cluster_security_groups/_cluster_security_group_name",
    :cluster_type, :cluster_version, :elastic_ip, :enhanced_vpc_routing, :hsm_client_certificate_identifier,
    :hsm_onfiguration_identifier, :master_user_password, :new_cluster_identifier,
    :node_type, :number_of_nodes, :preferred_maintenance_window, :publicly_accessible,
    :"vpc_security_group_ids/_vpc_security_group_id"]
  @spec modify_cluster(Keyword.t) :: ExAws.Operation.Query.t
  @spec modify_cluster(String.t, Keyword.t) :: ExAws.Operation.Query.t
  def modify_cluster(opts) when is_list(opts) do
    opts
    |> build_params(@modify_cluster_opts)
    |> build_request("ModifyCluster")
  end
  def modify_cluster(id, opts \\ []) when is_bitstring(id) do
    opts
    |> set(:cluster_identifier, id)
    |> modify_cluster()
  end


  @doc """
  A function for expanding a list of values for enumerable keys.

  Some AWS keys support multiple values like roles, security groups, or tags.
  The key usually follows the format `Names.Name.<index>`, for example,
  `IamRoles.IamRoleArn.1` as seen in the examples below. The function takes
  the key and a list of values, then append numerical index to the key using
  the given separator and pair it with each value.

  ## Examples

      iex> ExAws.RedShift.expand_params({"iam_roles/_iam_role_arn", ["Operator", "Scanner"]})
      [{"iam_roles/_iam_role_arn/1", "Operator"}, {"iam_roles/_iam_role_arn/2", "Scanner"}]

      iex> ExAws.RedShift.expand_params({"IamRoles.IamRoleArn", ["Operator", "Scanner"]}, ".")
      [{"IamRoles.IamRoleArn.1", "Operator"}, {"IamRoles.IamRoleArn.2", "Scanner"}]

      iex> ExAws.RedShift.expand_params({"iam_roles/_iam_role_arn", []})
      []
  """
  def expand_params(item, separator \\ "/")
  def expand_params({k, v}, separator) when is_list(v) do
    {params, _} = v
    |> Enum.reduce({[], 1}, fn(item, {acc, index}) ->
      {[{"#{k}#{separator}#{index}", item} | acc], index + 1}
    end)
    params
    |> Enum.reverse
  end
  def expand_params(item, _), do: [item]

  # This function is used for setting the key value pair into the option list.
  # It inherits the functionality of `Keyword.update/4` meaning if there's any
  # duplicate keys, it removes all instances of the key and replace it with
  # only what's given to the function.
  @spec set(Keyword.t, Atom.t, Any.t) :: Keyword.t
  defp set(opts, key, value) do
    opts
    |> Keyword.update(key, value, fn(_) -> value end)
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
    |> Enum.reduce([], fn({k, v}, acc) ->
      params = {k, v}
      |> expand_params

      Enum.concat(acc, params)
    end)
    |> Enum.reduce(%{}, fn({k, v}, acc) ->
      param = k |> to_string() |> camelize_key()
      acc |> Map.put(param, v)
    end)
  end

  # This function is used for building a request object that ExAws could use
  # to make the API call to AWS.
  @spec build_request(Map.t, String.t) :: %ExAws.Operation.Query{}
  defp build_request(params, action) do
    %ExAws.Operation.Query{
      service: "redshift",
      action: action,
      params: params |> Map.put("Action", action)
    }
  end
end

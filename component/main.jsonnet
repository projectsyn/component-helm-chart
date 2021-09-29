// main template for helm-chart
local kap = import 'lib/kapitan.libjsonnet';
local kube = import 'lib/kube.libjsonnet';
local inv = kap.inventory();
local instance = inv.parameters._instance;
local params = inv.parameters[instance];

local namespace = kube.Namespace(params.namespace);

// Define outputs below
{
  '00_namespace': namespace,
}

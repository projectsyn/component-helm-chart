local kap = import 'lib/kapitan.libjsonnet';
local inv = kap.inventory();
local argocd = import 'lib/argocd.libjsonnet';
local params = inv.parameters;
local instance = inv.parameters._instance;
local params = inv.parameters[instance];

local app = argocd.App(instance, params.namespace);

{
  [instance]: app,
}

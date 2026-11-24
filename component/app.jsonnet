local kap = import 'lib/kapitan.libjsonnet';
local inv = kap.inventory();
local params = inv.parameters.helm_chart;
local argocd = import 'lib/argocd.libjsonnet';

local component_name = 'helm-chart';

local instance = inv.parameters._instance;
local app = argocd.App(instance, params.namespace, secrets=true, base=component_name);

local appPath =
  local project = std.get(std.get(app, 'spec', {}), 'project', 'syn');
  if project == 'syn' then 'apps' else 'apps-%s' % project;

if instance == component_name then
  error 'Component helm-chart must be instantiated with `%s as foo` when using it.' % component_name
else {
  ['%s/%s' % [ appPath, instance ]]: app,
}

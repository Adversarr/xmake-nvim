import 'core.project.project'
import 'core.project.config'
import 'core.base.option'
import 'core.base.json'

function main()
  -- project.load()
  config.load()
  local output_config = {
    target = {

    },
    name = project.name(),
    directory = project.directory(),
    arch = config.get('arch'),
    plat = config.get('plat'),
    mode = config.get('mode'),
    buildir = config.get('buildir'),
    options = {}
  }



  -- Setup targets:
  for targetname, target in pairs(project.targets()) do
    local target_spec = {
      name = targetname,
      kind = target:targetkind(),
      deps = target:get('deps')
    }

    output_config.target[targetname] = target_spec
  end


  local output_config_json = json.encode(output_config)
  print(output_config_json)
end

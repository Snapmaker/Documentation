require "yaml"
require "set"

GCODE_SOURCE_DIR = "resources/_gcode"
GCODE_OVERWRITE_DIR = "resources/_gcode_overwrite"
GCODE_OUTPUT_DIR = "_gcode"
GCODE_KEYS = [
  "tag",
  "codes",
  "title",
  "long",
  "notes",
  "parameters",
  "example",
  "examples",
]

names = Set.new

Dir.children(GCODE_SOURCE_DIR).each { |name|
  names.add(name)
}

Dir.children(GCODE_OVERWRITE_DIR).each { |name|
  names.add(name)
}

names.each { |name|
  source_path = File.join(GCODE_SOURCE_DIR, name)
  overwrite_path = File.join(GCODE_OVERWRITE_DIR, name)
  output_path = File.join(GCODE_OUTPUT_DIR, name)

  if File.file?(source_path)
    source = YAML.load_file(source_path)
  else
    source = nil
  end

  if File.file?(overwrite_path)
    overwrite = YAML.load_file(overwrite_path)
  else
    overwrite = nil
  end

  new_gcode = Hash.new
  GCODE_KEYS.each { |key|
    if overwrite != nil && overwrite[key]
      new_gcode[key] = overwrite[key]
    elsif source != nil
      new_gcode[key] = source[key]
    end
  }

  File.open(output_path, "w") { |f|
    f.write(new_gcode.to_yaml)
    f.write("---")
  }
}

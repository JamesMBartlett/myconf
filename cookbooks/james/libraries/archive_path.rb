class Chef
  class Recipe
    def archive_path(name)
      home_dir = node['home_dir']
      base_dir = "#{home_dir}/tools"
      "#{base_dir}/#{name}"
    end
  end
end

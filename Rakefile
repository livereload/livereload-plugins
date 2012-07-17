require 'json'
require 'open-uri'
require 'net/http'
require 'zlib'

GEMS_DIR = '/Library/Ruby/Gems/1.8/gems'


def find_gem name, options={}
    options = { :prerelease => false }.merge(options)

    versions = Dir["#{GEMS_DIR}/#{name}-*"].map { |path| File.basename(path) =~ /^#{name}-(\d+\.\d.*)$/ ? [path, $1] : nil }.compact

    unless options[:prerelease]
        versions = versions.reject { |path, ver| ver =~ /alpha/ }
    end

    versions.sort! { |a, b| Gem::Version.new(a[1]) <=> Gem::Version.new(b[1]) }

    versions.last
end


class GemHosting
    class <<self
        def latest_gem_version name, prerelease=false
            result = gem_versions(name, prerelease).last
            if result.nil? && prerelease
                result = gem_versions(name, false).last
            end
            result[1]
        end

        def gem_versions name, prerelease=false
            gem_specs(prerelease).select { |n, ver, plaf| n == name }.sort { |a, b| a[1] <=> b[1] }
        end

        def gem_specs prerelease=false
            if prerelease
                @prerelease_gem_specs ||= load_gem_specs('http://rubygems.org/prerelease_specs.4.8.gz')
            else
                @gem_specs ||= load_gem_specs('http://rubygems.org/latest_specs.4.8.gz')
            end
        end

        def load_gem_specs url
            puts "Loading gem list from #{url}..."
            Marshal.load(Zlib::GzipReader.new(StringIO.new(open(url).read)).read)
        end
    end
end


class Dependency < Struct.new(:name, :cur_version, :old_version, :requires_update, :dst_path)
end

class NpmDependency < Dependency

    include Rake::DSL

    def install! plugin_dir
        Dir.chdir plugin_dir do
            sh "npm install #{name}@#{cur_version}"
        end
    end

end

class GemDependency < Dependency

    include Rake::DSL

    def src_path
        File.join(GEMS_DIR, "#{name}-#{cur_version}")
    end

    def install! plugin_dir
        unless File.directory? src_path
            sh "sudo gem install #{name} -v #{cur_version} --no-rdoc --no-ri --verbose"
        end
        begin
            cp_r src_path, dst_path
        rescue Errno::EACCES
            # fix perms of compass-*/examples/css3/extensions/fancy-fonts/templates/project/bgrove.otf
            sh "sudo chmod -R +r #{src_path}"
            rm_rf dst_path
            cp_r src_path, dst_path
        end
    end

end


class PluginTask

    include Rake::DSL

    def initialize name, options={}
        options = {
            :gems => [],
            :npm  => [],
            :prerelease => true
        }.merge(options)

        @name = name
        @gems = options[:gems]
        @npm  = options[:npm]
        @important_dependencies = options[:important] || [@gems.first, @npm.first].compact

        @plugin_dir = "#{@name}.lrplugin"
        @lib_dir = "#{@plugin_dir}/lib"
        @node_modules_dir = "#{@plugin_dir}/node_modules"
        @versions_json = File.join(@plugin_dir, 'versions.json')

        task_name = @name.downcase

        desc "Bundle the latest stable version of #{name}"
        task(task_name) { bundle(options.merge(:prerelease => false)) }

        if options[:prerelease]
            desc "Bundle the latest prerelease version of #{name}"
            task("#{task_name}:pre") { bundle(options.merge(:prerelease => true)) }
        end

        task "all" => task_name
        task "all:pre" => "#{task_name}:pre"
    end

    def bundle options
        dep_versions = (JSON.parse(File.read(@versions_json)) rescue {})

        gem_dependencies = @gems.map do |gem_name|
            cur_version = GemHosting.latest_gem_version(gem_name, options[:prerelease]).to_s

            dst_path = File.join(@lib_dir, gem_name)

            requires_update = (dep_versions[gem_name] != cur_version) || !File.exists?(dst_path)

            GemDependency.new(gem_name, cur_version, dep_versions[gem_name], requires_update, dst_path)
        end

        npm_dependencies = if @npm.empty?
            []
        else
            Net::HTTP.start('registry.npmjs.org', 80) do |http|
                @npm.map do |npm_name|
                    manifest = JSON.parse(http.get("/#{npm_name}/").body)
                    dist_tags = manifest['dist-tags']

                    dst_path = File.join(@node_modules_dir, npm_name)

                    cur_version = dist_tags['latest']
                    if !options[:prerelease] && dist_tags.include?('stable')
                        cur_version = dist_tags['stable']
                    end

                    requires_update = (dep_versions[npm_name] != cur_version) || !File.exists?(dst_path)

                    NpmDependency.new(npm_name, cur_version, dep_versions[npm_name], requires_update, dst_path)
                end
            end
        end

        dependencies = gem_dependencies + npm_dependencies

        updated_dependencies = dependencies.select { |dep| dep.requires_update }

        important_dependencies = @important_dependencies.map { |n| [n, dependencies.find { |d| d.name == n }] }

        overall_name = case important_dependencies.size
        when 1 then important_dependencies.first[1].cur_version
        else important_dependencies.map { |n, d| "#{n} #{d.cur_version}" }.join(", ")
        end

        if updated_dependencies.empty?
            puts "All #{@name} #{overall_name} dependencies are up to date."
        else
            puts "Updating #{@name} to #{overall_name} -- dependencies: #{updated_dependencies.map { |d| d.name }.join(' ')}."

            for dependency in updated_dependencies
                puts "Updating #{dependency.name}: #{dependency.old_version} => #{dependency.cur_version}"

                rm_rf dependency.dst_path
                mkdir_p File.dirname(dependency.dst_path) unless File.directory?(File.dirname(dependency.dst_path))
                dependency.install! @plugin_dir

                dep_versions[dependency.name] = dependency.cur_version
                puts "Updated #{dependency.name}: #{dependency.old_version} => #{dependency.cur_version}"
            end

            puts "Updated #{@name} #{overall_name} dependencies: #{updated_dependencies.map { |d| d.name }.join(' ')}."
            puts "Final #{@name} #{overall_name} dependency versions: " + JSON.pretty_generate(dep_versions)

            dep_versions['.'] = overall_name

            File.open(@versions_json, 'w') { |f| f.puts JSON.pretty_generate(dep_versions) }

            puts "Committing #{@name}..."
            Dir.chdir @plugin_dir do
                sh "git add -A versions.json " + Dir['{lib,node_modules}'].join(' ')
                sh "git commit . -m 'Update #{@name} to #{overall_name}' && git log -1" rescue nil
            end
        end
    end

end


desc "Bundle the latest stable versions of all compilers"
task 'all'

desc "Bundle the latest prerelease versions of all compilers"
task 'all:pre'

PluginTask.new 'CoffeeScript', :npm => %w(coffee-script)
PluginTask.new 'IcedCoffeeScript', :npm => %w(iced-coffee-script)
PluginTask.new 'Eco',        :npm => %w(eco)
PluginTask.new 'LESS',       :npm => %w(less)
PluginTask.new 'Stylus',     :npm => %w(stylus nib canvas)
PluginTask.new 'Jade',       :npm => %w(jade markdown)

PluginTask.new 'HAML',       :gems => %w(haml tilt)
PluginTask.new 'SLIM',       :gems => %w(slim temple tilt)
PluginTask.new 'SASS',       :gems => %w(sass compass chunky_png html5-boilerplate compass-h5bp compass-960-plugin susy zurb-foundation compass-colors fancy-buttons compass-slickmap grid-coordinates compass-rgbapng compass-baseline compass-vgrid-plugin compass-less-plugin sassy-buttons compass-thesquaregrid compass-fancybox-plugin font-stack compass-squaregrid-plugin compass_formalize compass-lucid-grid stitch), :important => %w(sass compass)

task :default do
    puts ENV['INSTALL']
    puts find_gem('compass', :prerelease => true )
end

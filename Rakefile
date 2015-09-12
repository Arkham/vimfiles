task :default => [:neobundle, :tmp_dirs, :link, :vim, :command_t]

desc %(Setup neobundle)
task :neobundle do
  mkdir_p "bundle"
  sh "git clone https://github.com/Shougo/neobundle.vim bundle/neobundle.vim"
end

desc %(Create temporary folders)
task :tmp_dirs do
  mkdir_p "_backup"
  mkdir_p "_temp"
end

desc %(Make ~/.vimrc symlink)
task :link do
  dotfile = File.join(ENV['HOME'], ".vimrc")
  if File.exist? dotfile
    warn "~/.#{script} already exists"
  else
    ln_s File.join('.vim', script), dotfile
  end
end

desc %(Run Vim)
task :vim do
  sh "vim"
end

desc %(Compile Command-T plugin)
task :command_t => :macvim_check do
  Dir.chdir "bundle/Command-T/ruby/command-t" do
    sh "rake make"
  end
end

desc %(Check if MacVim is installed)
task :macvim_check do
  if mvim = which('mvim') and '/usr/bin/vim' == which('vim')
    warn color('Warning:', 31) + " You have MacVim installed, but `vim` still opens system Vim."
    warn "To use MacVim version when you invoke `vim`:  " + color("$ ln -s mvim #{File.dirname(mvim)}/vim", 37)
  end
end

def color(msg, code)
  if $stderr.tty? then "\e[1;#{code}m#{msg}\e[m"
  else msg
  end
end

def which(cmd)
  exts = ENV['PATHEXT'] ? ENV['PATHEXT'].split(';') : ['']
  ENV['PATH'].split(File::PATH_SEPARATOR).each do |path|
    exts.each { |ext|
      exe = "#{path}/#{cmd}#{ext}"
      return exe if File.executable? exe
    }
  end
  return nil
end

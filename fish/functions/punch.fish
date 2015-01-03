function punch --description "Creates directories leading up to and including the file"
  for file in $argv
    set -l path (dirname $file)
    mkdir -p $path
    touch $file
  end
end
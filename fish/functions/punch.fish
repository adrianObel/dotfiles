function punch --description "Creates directories leading up to and including the file"
  
  set -l path (dirname $argv[1])

  mkdir -p $path
  touch $argv[1]
  
end
eval '(exit $?0)' && eval 'exec perl -S $0 ${1+"$@"}'
  && eval 'exec perl -S $0 $argv:q'
  if 0;

# $Log: vbr.pl,v $
# Initial revision
# Srini @ Fabula Solutions (fabulasolutions.com)
# 

$cmd = "wget --user-agent='neo' " ;
$f = `date +%m_%d_%y-%H.%M.%S` ;
chomp($f) ; # remove crs and \ns 
$f = $f.".html" ;

while(<>) {	
    if(/^#/) { next ; } ## Skip comments 
    split ;
    $l = $_[0] ;
    $d = $_[1] ;
    if(-d "pages/$d") {
        `$cmd $l -O "pages/$d/$f"` ;
    } else {
        `mkdir -p "pages/$d"` ;
        `$cmd $l -O "pages/$d/$f"` ;
    }
}

use 5.008;
use ExtUtils::MakeMaker;

my (@INC,@LIBPATH,@LIBS);
@INC     = qw(-I. -I/usr/local/include -I/usr/include ) unless @INC;
@LIBPATH = qw(-L/usr/local/lib -L/usr/lib) unless @LIBPATH;
@LIBS    = qw(-lz -lpng -lgif) unless @LIBS;

# support for AMD64 libraries
if (-d '/usr/lib64') {
    my @libs64 = map {my $a = $_; $a=~ s/lib$/lib64/; $a} @LIBPATH;
    @LIBPATH = (@LIBPATH,@libs64);
}

my $DEFINES = ' -DHAVE_PNG -DHAVE_GIF';

open F,">.config.cache";
print F $DEFINES,"\n";
close F;

WriteMakefile(
    NAME              => 'SWFEditor',
    VERSION_FROM      => 'lib/SWFEditor.pm', # finds $VERSION
    PREREQ_PM         => {}, # e.g., Module::Name => 1.1
    ($] >= 5.005 ?     ## Add these new keywords supported since 5.005
      (ABSTRACT_FROM  => 'lib/SWFEditor.pm', # retrieve abstract from module
       AUTHOR         => 'mix3 <himachocost333@gmail.com>') : ()),
    LIBS              => [join(' ',@LIBPATH,@LIBS)],
    DEFINE            => $DEFINES, # e.g., '-DHAVE_SOMETHING'
    INC               => join(' ',@INC), # e.g., '-I. -I/usr/include/other'
    # Un-comment this if you add C files to link with later:
    OBJECT            => '$(O_FILES)', # link all the C files too
);

use t::Utils;
use Test::More;
use SWFEditor;

my $d1     = get_file_contents('/resource/negimiku.swf');
my $expect = get_file_contents('/swf/shape004.swf');

my $swfed = SWFEditor->new();
{
    $swfed->input($d1);
    $swfed->apply_shape_matrix_factor(4, 0.9, 0.5, 45, 10, 10);
    my $got = $swfed->output();
    is (
        $got,
        $expect,
        ''
    );
}

done_testing();

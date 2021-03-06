use t::Utils;
use Test::More;
use SWFEditor;

my $expect = get_file_contents('/swf/edit001.swf');

{
    my $d1    = get_file_contents('/resource/textvar.swf');
    my $swfed = SWFEditor->new();
    $swfed->input(\$d1);
    $swfed->replace_edit_string(2, 'hello world');
    my $got = $swfed->output();
    is (
        $got,
        $expect,
        'action001.phpt'
    );
}

{
    my $d1    = get_file_path('/resource/textvar.swf');
    my $swfed = SWFEditor->new();
    $swfed->input($d1);
    $swfed->replace_edit_string(2, 'hello world');
    my $got = $swfed->output();
    is (
        $got,
        $expect,
        'action001.phpt'
    );
}

done_testing();

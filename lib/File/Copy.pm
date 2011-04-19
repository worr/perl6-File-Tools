use v6;

module File::Copy;

sub cp(Str $from, Str $to, :$r) is export {
    if ($from.IO ~~ :d and $r) {
        mkdir("$to") if $to.IO !~~ :d;
        for dir($from) -> $item {
            mkdir("$to/$item") if "$from/$item".IO ~~ :d;
            cp("$from/$item", "$to/$item", :r);
        }
    } else {
        $from.IO.copy($to);
    }
}

=begin pod

=head1 NAME

File::Copy -- copy files

=head1 SYNOPSIS

	use File::Copy;

	cp 'source', 'destination', :r;
	
=head1 DESCRIPTION

C<File::Copy> exports just one subroutine, cp taking two string
parameters: source and destination and a recursion flag. If something 
goes wrong, IO.cp fails. There is no special error reporting.

=end pod

# vim: ft=perl6

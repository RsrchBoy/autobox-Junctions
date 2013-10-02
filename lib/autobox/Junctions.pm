package autobox::Junctions;

# ABSTRACT: Autoboxified junction-style operators

use strict;
use warnings;

use parent 'autobox';

sub import {
    my $class = shift @_;

    $class->SUPER::import(
        ARRAY => 'autobox::Junctions::ARRAY',
        @_,
    );
}

{
    package autobox::Junctions::ARRAY;

    use strict;
    use warnings;

    use Syntax::Keyword::Junction ();

    sub all  { Syntax::Keyword::Junction::all( @{ $_[0] }) }
    sub any  { Syntax::Keyword::Junction::any( @{ $_[0] }) }
    sub none { Syntax::Keyword::Junction::none(@{ $_[0] }) }
    sub one  { Syntax::Keyword::Junction::one( @{ $_[0] }) }
}

!!42;
__END__

=for :stopwords autoboxified autoboxifying AUTOBOXED

=head1 SYNOPSIS

    # somewhere above...
    use autobox::Junctions;

    # somewhere below...
    my @explodey = qw{ bing bang boom };
    warn "boom!\n"
        if @explody->any eq 'boom';

    my $still_explody = [ @explodey ];
    warn "not all explody\n"
        unless $still_explody->all eq 'boom';

    # now, bonus points...
    use autobox::Core;

    my $weapons = {
        mateu => 'bow & arrow',     # fearsome hunter
        ether => 'disarming smile', # Canadian
        jnap  => 'shotgun',         # upstate NY
    };

    warn 'mateu is armed!'
        if $weapons->keys->any eq 'mateu'

    warn '...but at least no one has a nuke'
        if $weapons->values->none eq 'nuke';

=head1 DESCRIPTION

This is a simple autoboxifying wrapper around L<Syntax::Keyword::Junction>,
that provides array and array references with the functions provided by that
package as methods for arrays:
L<any|Syntax::Keyword::Junction/any>,
L<all|Syntax::Keyword::Junction/all>, L<one|Syntax::Keyword::Junction/one>,
and L<none|Syntax::Keyword::Junction/none>.

=head1 AUTOBOXED METHODS

See: L<Syntax::Keyword::Junction/any>, LSyntax::Keyword::Junction/all>,
L<Syntax::Keyword::Junction/one>, and L<Syntax::Keyword::Junction/none>.

=head1 SEE ALSO

Syntax::Keyword::Junction

=cut

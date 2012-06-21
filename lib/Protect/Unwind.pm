package Protect::Unwind;

use strict;

use Guard;

our $VERSION = '0.1';

use base 'Exporter';
our @EXPORT = qw(protect unwind);


sub protect (&;@) {
  my ($protected, $unwinder) = @_;

  scope_guard {
    $unwinder->();
  };

  return $protected->();
}

sub unwind (&) {
  my ($unwinder) = @_;

  return $unwinder;
}

1;



__END__


=head1 NAME

Protect-Unwind - Safe cleanup blocks, Common Lisp style


=head1 SYNOPSIS

    use Protect::Unwind;

    protect {
      goto ESCAPE;
    } unwind {
      print "This is printed no matter what happens in protect.";
    };

    ESCAPE:


=head1 DESCRIPTION

This module is just syntactic sugar around L<Guard>. It implements an interface like Common Lisp's L<unwind-protect|http://www.lispworks.com/documentation/HyperSpec/Body/s_unwind.htm>.

It only exists so that hopefully lisp programmers new to perl will find this module before they find the buggy L<Unwind::Protect>.

Unwind::Protect concentrates too hard on maintaining C<wantarray> and hiding created stack frames which are "problems" I don't care about. The only purpose of lisp's C<unwind-protect> is that the cleanup-form is always run once the protected-form goes out of scope, something that Unwind::Protect doesn't implement correctly.

Note that if your unwind forms throw exceptions the behaviour is somewhat complicated (see the L<Guard> docs).


=head1 SEE ALSO

L<Guard> is a correct and efficient perl C<unwind-protect> implementation which is why this module uses it.


=head1 AUTHOR

Doug Hoyte, C<< <doug@hcsw.org> >>

=head1 COPYRIGHT & LICENSE

Copyright 2012 Doug Hoyte.

This module is licensed under the same terms as perl itself.

=cut

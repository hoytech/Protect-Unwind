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


=cut

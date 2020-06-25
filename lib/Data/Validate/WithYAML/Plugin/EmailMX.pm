package Data::Validate::WithYAML::Plugin::EmailMX;

use warnings;
use strict; 

use Carp;

use Net::validMX;

# ABSTRACT: Plugin to check if a mx exists for the given mail address

our $VERSION = '0.01';

=head1 SYNOPSIS

    use Data::Validate::WithYAML::Plugin::EmailMX;

    my $foo = Data::Validate::WithYAML::Plugin::EmailMX->check( 'test@example.tld' );
    ...
    
    # use the plugin via Data::Validate::WithYAML
    
    use Data::Validate::WithYAML;
    
    my $email     = 'test@example.tld';
    my $validator = Data::Validate::WithYAML->new( 'test.yml' );
    print "yes" if $validator->check( 'email', $email );

test.yml

  ---
  step1:
      email:
          plugin: EmailMX
          type: required
  

=head1 SUBROUTINES

=head2 check

=cut

sub check {
    my ($class, $value) = @_;
    
    croak "no value to check" unless defined $value;
    
    my ($rv) = Net::validMX::check_valid_mx($value);

    return $rv;
}

1;

=head1 SEE ALSO

L<Net::validMX>

=cut

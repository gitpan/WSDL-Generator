=pod

=head1 NAME

	WSDLTest - A class to test WSDL::Generator

=cut

package WSDLTest;

=pod

=head2 new($param)

	$param = { param1 => $something,
	           param2 => $somethingelse,
	         };
	Returns a SoapTest object

=cut
sub new {
	my $class = shift;
	my $param = shift;
	my $self = { 'param1' => $param->{param1},
	             'param2' => $param->{param2} };
	return bless $self => $class;
}


=pod

=head2 test1($msg)

	Returns [ [$msg,1,2,3], [4,5], [6,7] ]

=cut
sub test1 {
		my ($self, $msg) = @_;
        return [ [$msg,1,2,3], [4,5], [6,7] ];
}

=pod

=head2 test2($msg)

	Returns { param1  => $something,
	          param2  => $somethingelse,
	          message => $msg
	         };

=cut
sub test2 {
	my $self = shift;
	my $string = shift;
	return { 'param1'  => $self->{param1},
             'param2'  => $self->{param2},
             'message' => $string };
}


1;

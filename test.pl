use lib qw (./lib);
use WSDL::Generator;
use Test::Simple tests => 3;

my $param = {
				'param1' => 'toto',
				'param2' => [ { key1 => 'a',
				                key3 => 'complexe'
				               },
				              { key1 => 'mykey1',
				                key2 => 'mykey2' },
				            ],
			};

my $wsdl_param = {
					'schema_namesp' => 'http://www.fotango.com/FotangoWSDLTest.xsd',
		  			'services'      => 'Fotango',
					'service_name'  => 'WSDLTest',
					'target_namesp' => 'http://www.fotango.com/SOAP/',
					'documentation' => 'Test of WSDL::Generator',
					'location'      => 'http://pics.work-fotango.com/SOAP/WSDLTest'
				 };
my $wsdl = WSDL::Generator->new($wsdl_param);
ok(ref $wsdl eq 'WSDL::Generator', 'Init from Class::Hook');
my $test = WSDLTest->new($param);
$test->test1('hello');
$test->test2('world');
my $result = $wsdl->get('WSDLTest');
my $result_ref;
{
	local $/ = undef;
	open  WSDL, 'WSDLTest.wsdl';
	$result_ref = <WSDL>;
	close WSDL;
}

ok($result eq $result_ref, 'WSDL generation');
my @classes = $wsdl->get_all;
ok($classes[0] eq 'WSDLTest', 'Class registered');

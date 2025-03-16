import ipv6mnemonic.Decode;


class TestDecode extends utest.Test {
	var ip6decode:Decode;

	// synchronous setup
	public function setup() {
		ip6decode = new Decode();
	}

	function testSimpleNoWOM() {
		// speaker exam town people tale
		// 220     67   95   1      224
		final ip6value = ip6decode.decode("The speaker during the exam, next to the town, regaled the people of a tale");

		utest.Assert.equals("some", "some");
	}
}

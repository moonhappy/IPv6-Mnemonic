package ipv6mnemonic;

import ipv6mnemonic.v0_1.Decoder;
import haxe.io.Bytes;

/**
 * TODO
 */
class Decode {
	/**
	 * TODO
	 */
	public function new() {
	}

	/**
	 * TODO
	 * @param input 
	 * @return Bytes
	 */
	public function decode(input:String):Bytes {
		final decoder = new Decoder();
		return decoder.decode(input);
	}
}

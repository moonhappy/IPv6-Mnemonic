package ipv6mnemonic.v0_1;

/**
 * TODO
 */
class StringSplit implements IVersion {
	/**
	 * TODO
	 */
	public function new() {}

	/**
	 * TODO
	 * @return String
	 */
	public function version():String {
		return "0.1.0";
	}

	/**
	 * TODO
	 * @param input 
	 * @return Array<String>
	 */
	public function split(input:String):Array<String> {
		var result:Array<String> = [];
		var currentWord = "";

		for (i in 0...input.length) {
			final char = input.charAt(i);
			if (isAlpha(char)) {
				currentWord += char;
			} else {
				if (currentWord.length > 0) {
					result.push(currentWord);
					currentWord = "";
				}
			}
		}

		if (currentWord.length > 0) {
			result.push(currentWord);
		}

		return result;
	}

	/**
	 * TODO
	 * @param char 
	 * @return Bool
	 */
	private function isAlpha(char:String):Bool {
		var code = char.charCodeAt(0);
		return (code >= 65 && code <= 90) || (code >= 97 && code <= 122);
	}
}

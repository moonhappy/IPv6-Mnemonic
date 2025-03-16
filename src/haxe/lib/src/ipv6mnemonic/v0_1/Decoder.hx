package ipv6mnemonic.v0_1;

import haxe.io.BytesBuffer;
import haxe.ds.Map;
import haxe.io.Bytes;


/**
 * TODO
 */
typedef Token = { noun: String, position: Int, index: Int, value: Int }

/**
 * TODO
 */
class Decoder implements IDecoder {
    // TODO: Write comment
    private final nounsMap:Map<String, Int>;

    /**
     * TODO
     */
    public function new() {
        // Load nouns word list into map for quick look-ups, rather than 
        // searching through the list.
        final nouns = new Nouns();
        final nounsListShort = nouns.nounsShort();
        nounsMap = [for (i in 0...nounsListShort.length) nounsListShort[i] => i+1 ]; 
    }

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
     * @return Bytes
     */
    public function decode(input:String):Bytes {
        // TODO: Add param checks
        // Check each word to a corresponding noun in the list.
        // 1. Split the input
        final stringSplit = new StringSplit();
        final inSequence = stringSplit.split(input);
        // 2. Build up the tokens
        var tokens = new Array<Token>();
        var position = 0;
        for (inWord in inSequence) {
            final word = inWord.toLowerCase();
            final nounIndex = nounsMap[word] ?? continue;
            tokens.push({
                noun: word, 
                position: position, 
                index: nounIndex, 
                value: nounIndex % 256
            });
            position++;
        }
        // TODO: Re-arrange via WOM and produce ByteArray
        return (new BytesBuffer()).getBytes();
    }
}

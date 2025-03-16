package ipv6mnemonic;

import haxe.io.Bytes;

/**
 * TODO
 */
interface IDecoder extends IVersion {
    /**
     * TODO
     * @param input 
     * @return Bytes
     */
    public function decode(input:String):Bytes;
}

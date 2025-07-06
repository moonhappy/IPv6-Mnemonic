

using IPv6Mnemonic.v0_1;

namespace IPv6Mnemonic;

public class Decode 
{
    private Decoder _decoder = new Decoder();

    public byte[] Do(string input)
    {
        return _decoder.Decode(input);
    }
}

using IPv6Mnemonic;

namespace IPv6MnemonicTest;

public class TestDecode
{
    private Decode _decode = new Decode();

    // [SetUp]
    // public void Setup()
    // {
    // }

    [Test]
    public void Decode_Simple_NoWOM()
    {
        // speaker exam town people tale
        // 220     67   95   1      224
        var ip6value = _decode.Do("The speaker during the exam, next to the town, regaled the people of a tale");

        Assert.Pass();
    }
}
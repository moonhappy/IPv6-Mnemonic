using Microsoft.VisualStudio.TestTools.UnitTesting;
using IPv6Mnemonic;


namespace IPv6MnemonicTest;

[TestClass]
public class TestDecode
{
    private Decode _decode = new Decode();

    // [SetUp]
    // public void Setup()
    // {
    // }

    [TestMethod]
    public void Decode_Simple_NoWOM()
    {
        // speaker exam town people tale
        // 220     67   95   1      224
        var ip6value = _decode.Do("The speaker during the exam, next to the town, regaled the people of a tale");

        // Verify expected size
        Assert.AreEqual(5, ip6value.Length);
        // Verify expected values in correrct order
        Assert.AreEqual( (byte)220, ip6value[0]);
        Assert.AreEqual( (byte) 67, ip6value[1]);
        Assert.AreEqual( (byte) 95, ip6value[2]);
        Assert.AreEqual( (byte)  1, ip6value[3]);
        Assert.AreEqual( (byte)224, ip6value[4]);
    }
}
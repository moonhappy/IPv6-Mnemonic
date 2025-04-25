
namespace IPv6Mnemonic;

interface IDecoder : IVersion
{
    List<byte> Decode(string input);
}

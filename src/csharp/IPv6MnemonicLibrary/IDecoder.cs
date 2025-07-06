
namespace IPv6Mnemonic;

interface IDecoder : IVersion
{
    byte[] Decode(string input);
}

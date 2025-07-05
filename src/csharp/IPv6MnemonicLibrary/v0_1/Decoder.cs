
using System.Text.RegularExpressions;

namespace IPv6Mnemonic.v0_1;

internal struct Token
{
    internal string Noun;
    internal int Position;
    internal int Index;
    internal int Value;
}

class Decoder : IDecoder
{
    readonly Dictionary<string, int> _nounsMap;

    public Decoder()
    {
        // Load nouns word list into map for quick look-ups, rather than 
        // searching through the list
        var nounsListShort = new Nouns().NounsShort();
        _nounsMap = nounsListShort
                        .Select((noun, index) => new { Noun = noun, Index = index })
                        .ToDictionary(item => item.Noun, item => item.Index);
    }

    public string Version()
    {
        return "0.1.0";
    }

    public List<byte> Decode(string input)
    {
        // TODO: Add param checks
        // Check each word to a corresponding noun in the list.
        // 1. Split the input
        var inSequence = Regex.Split(input, "[^a-zA-Z]+");
        // 2. Build up the tokens
        var tokens = new LinkedList<Token>();
        var position = 0;
        foreach (string it in inSequence)
        {
            var word = it.ToLower();
            if (!_nounsMap.ContainsKey(word))
                continue;
            var nounIndex = _nounsMap[word];
            tokens.AddLast(new Token { Noun = word, Position = position, Index = nounIndex, Value = (nounIndex + 1) % 256 });
            position++;
        }
        // TODO: Re-arrange via WOM and produce ByteArray
        return new List<byte>();
    }
}

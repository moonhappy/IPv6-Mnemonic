package io.moonhappy.ipv6mnemonic.v0_1

import io.moonhappy.ipv6mnemonic.IDecoder

data class Token(val noun: String, val position: Int, val index: Int, val value: Int)

class Decoder : IDecoder {

    private val nounsMap: Map<String, Int>;

    init {
        // Load nouns word list into map for quick look-ups, rather than 
        // searching through the list
        val nounsListShort = Nouns().nounsShort()
        nounsMap = nounsListShort.mapIndexed { index, s -> s to index + 1  }.toMap()
    }

    override fun version(): String = "0.1.0"

    override fun decode(input: String): ByteArray {
        // TODO: Add param checks
        // Check each word to a corresponding noun in the list.
        // 1. Split the input
        val inSequence = input.split(Regex("[^a-zA-Z]+"))
        // 2. Build up the tokens
        val tokens = mutableListOf<Token>()
        var position = 0
        inSequence.forEach {
            val word = it.lowercase();
            val nounIndex = nounsMap[word] ?: return@forEach
            tokens.addLast(Token(word, position, nounIndex, nounIndex % 256))
            position++
        }
        // TODO: Re-arrange via WOM and produce ByteArray
        return ByteArray(0)
    }

}

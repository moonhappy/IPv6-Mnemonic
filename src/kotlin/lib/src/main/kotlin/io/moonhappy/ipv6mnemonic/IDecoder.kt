package io.moonhappy.ipv6mnemonic

interface IDecoder: IVersion {
    fun decode(input: String): ByteArray
}

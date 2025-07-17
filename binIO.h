#ifndef BININPUTOUTPUT_H
#define BININPUTOUTPUT_H

#include <cstdio>
#include <cstdint>
#include <vector>
#include <string>

namespace BinIO
{
    /*!
    Reads a hex-encoded stream of data from the NULL-terminated char buffer
    "is" and places its binary representation in binOut.
    Returns the length (in bytes) of the output binary buffer.

    param[out] binOut
        Reference tostd::vector<uint8_t> encoding an octet vector
        representation of is.
        Endianness is preserved from that of the input stream.
        The caller doesn't have to allocate size for it, the function will
        allocate just enough memory for the whole stream to be encoded.

    param[in] is
        Null-terminated stream of chars encoding the hex string.
        The caller is responsible for providing a valid string, otherwise
        they will get plenty of stderr eyecandy.
    */
    size_t readHexBinary(std::vector<uint8_t>& binOut, const char* is);

    /*!
    Provided with an octet vector inHex, this function will create a
    std::string encoding an HEX representation of the binary data.
    Returns the length of the encoded string.

    param[out] outStr
        Reference to a std::string that will encode the inHex data.

    param[in] inHex
        std::vector holding the octets to be converted.
    */
    size_t hexBinaryToString(std::string&         outStr,
                             std::vector<uint8_t> inHex);

    /*!
    Prints a binary array in its HEX representation.
    Returns 0 if successful.
    */
    int printHexBinary(const std::vector<uint8_t>& binIn);

    // exception types:
    struct InputError_IllegalConversion {};
}

#endif

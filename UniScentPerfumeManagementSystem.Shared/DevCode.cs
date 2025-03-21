﻿using System.ComponentModel;
using System.Text;
using System.Security.Cryptography;

namespace UniScentPerfumeManagementSystem.Shared;

public static partial class DevCode
{
    public static string ToSHA256HexHashString(this string password, string username)
    {
        password = password.Trim();
        username = username.Trim();
        string saltedCode = EncodedBySalted(username);
        string hashString;
        using (var sha256 = SHA256.Create())
        {
            var hash = sha256.ComputeHash(Encoding.Default.GetBytes(password + saltedCode));
            hashString = ToHex(hash, false);
        }

        return hashString;
    }

    private static string EncodedBySalted(string decodeString)
    {
        decodeString = decodeString.ToLower()
            .Replace("a", "@")
            .Replace("i", "!")
            .Replace("l", "1")
            .Replace("e", "3")
            .Replace("o", "0")
            .Replace("s", "$")
            .Replace("n", "&");
        return decodeString;
    }

    public static string ToHex(byte[] bytes, bool upperCase)
    {
        StringBuilder result = new StringBuilder(bytes.Length * 2);
        for (int i = 0; i < bytes.Length; i++)
            result.Append(bytes[i].ToString(upperCase ? "X2" : "x2"));
        return result.ToString();
    }

    public static string ToEnumDescription<T>(this T val)
    {
        DescriptionAttribute[] attributes = (DescriptionAttribute[])val
            .GetType()
            .GetField(val.ToString())
            .GetCustomAttributes(typeof(DescriptionAttribute), false);
        return attributes.Length > 0 ? attributes[0].Description : string.Empty;
    }
}

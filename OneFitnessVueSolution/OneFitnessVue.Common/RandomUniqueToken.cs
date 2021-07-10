using System;

namespace OneFitnessVue.Common
{
    public static class RandomUniqueToken
    {
        public static string Value()
        {
            var guid1 = Guid.NewGuid().ToString("N").Substring(0, 8).ToUpper();
            var guid2 = Guid.NewGuid().ToString("N").Substring(20, 8).ToUpper();
            var unique = $"{guid1}{guid2}";
            return unique;
        }
    }
}
using Microsoft.AspNetCore.Http;
using Newtonsoft.Json;

namespace OneFitnessVue.Common
{
    /// <summary>
    /// Represents extensions of ISession
    /// </summary>
    public static class SessionExtensions
    {
        /// <summary>
        /// Set value to Session
        /// </summary>
        /// <typeparam name="T">Type of value</typeparam>
        /// <param name="session">Session</param>
        /// <param name="key">Key</param>
        /// <param name="value">Value</param>
        public static void SetSession<T>(this ISession session, string key, T value)
        {
            session.SetString(key, JsonConvert.SerializeObject(value));
        }

        /// <summary>
        /// Get value from session
        /// </summary>
        /// <typeparam name="T">Type of value</typeparam>
        /// <param name="session">Session</param>
        /// <param name="key">Key</param>
        /// <returns>Value</returns>
        public static T GetSession<T>(this ISession session, string key)
        {
            var value = session.GetString(key);
            if (value == null)
                return default;

            return JsonConvert.DeserializeObject<T>(value);
        }
    }
}
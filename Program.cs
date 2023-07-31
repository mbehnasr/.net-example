using System;
using System.Text.Json;

namespace HelloWorldJsonLogging
{
    class Program
    {
        static void Main(string[] args)
        {
            var message = "Hello, World!";
            var logEntry = new
            {
                Timestamp = DateTime.UtcNow,
                Message = message,
                LogLevel = "INFO"
            };
            var json = JsonSerializer.Serialize(logEntry);
            Console.WriteLine(json);
        }
    }
}

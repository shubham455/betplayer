using System;
using Twilio;
using Twilio.Rest.Api.V2010.Account;
using Twilio.Types;

namespace ConsoleApplication1
{
    class Program
    {
        static void Main(string[] args)
        {
            // Your Account SID from twilio.com/console
            var accountSid = "ACc41cdd70dafe968074c26cf577054360";
            // Your Auth Token from twilio.com/console
            var authToken = "auth_token";

            TwilioClient.Init(accountSid, authToken);

            var message = MessageResource.Create(
                to: new PhoneNumber("8319058205"),
                from: new PhoneNumber("9827374556"),
                body: "Hello from C#");

            Console.WriteLine(message.Sid);
            Console.Write("Press any key to continue.");
            Console.ReadKey();
        }
    }
}
using System;
using DataGenerator.Utilities;
using System.Threading;
using System.IO;

using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Net;
using Microsoft.Extensions.Configuration;
using System.Security.Cryptography;
using System.Text;

using Newtonsoft.Json;



using System.Threading;
namespace DataGeneratorConsole
{
    class Program
    {
        static void Main(string[] args)
        {
            var builder = new ConfigurationBuilder()
                .SetBasePath(Directory.GetCurrentDirectory())
                .AddJsonFile("appsettings.json");
 
            IConfiguration config = builder.Build();

            string eventHubConnectionString = config.GetConnectionString("EventHubConnection");
            string eventHubTopicCA = config.GetConnectionString("EVHCalifornia");
            string eventHubTopicFL = config.GetConnectionString("EVHFlorida");
            string eventHubTopicWA = config.GetConnectionString("EVHWashington");

            // How many rounds of data generation we are going to do
            int numberOfRounds = 10;

            Console.WriteLine("Setting Up Data Generator for " + numberOfRounds + " rounds");
            PatientStream generator = new PatientStream(eventHubConnectionString, eventHubTopicCA, eventHubTopicFL, eventHubTopicWA);

            Console.WriteLine("Starting Up Data generation for " + numberOfRounds + " rounds");

            generator.generateData(numberOfRounds);

            Console.WriteLine("Data generation for " + numberOfRounds + " rounds completed.");
        }
    }


}

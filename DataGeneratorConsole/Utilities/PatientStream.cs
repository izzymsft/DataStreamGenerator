using System;
using System.Threading;
using System.Collections.Generic;
using System.IO;
using System.Threading.Tasks;
using Microsoft.Azure.EventHubs;
using System.Text;
using DataGenerator.Models;

namespace DataGenerator.Utilities
{
    public class PatientStream
    {
        private static readonly string[] departments = {"Emergency Room", "Outpatient Unit"};
        private readonly string EventHubConnectionString;
        private string EventHubNameCA;
        private string EventHubNameFL;
        private string EventHubNameWA;

        private EventHubClient eventHubClientCA;
        private EventHubClient eventHubClientFL;
        private EventHubClient eventHubClientWA;

        public PatientStream(string eventHubConnection, string evhCA, string evhFL, string evhWA)
        {
            this.EventHubConnectionString = eventHubConnection;
            this.EventHubNameCA = evhCA;
            this.EventHubNameFL = evhFL;
            this.EventHubNameWA = evhWA;

            var connectionStringBuilderCA = new EventHubsConnectionStringBuilder(EventHubConnectionString)
            {
                EntityPath = EventHubNameCA
            };

            var connectionStringBuilderFL = new EventHubsConnectionStringBuilder(EventHubConnectionString)
            {
                EntityPath = EventHubNameFL
            };

            var connectionStringBuilderWA = new EventHubsConnectionStringBuilder(EventHubConnectionString)
            {
                EntityPath = EventHubNameWA
            };

            this.eventHubClientCA = EventHubClient.CreateFromConnectionString(connectionStringBuilderCA.ToString());
            this.eventHubClientFL = EventHubClient.CreateFromConnectionString(connectionStringBuilderFL.ToString());
            this.eventHubClientWA = EventHubClient.CreateFromConnectionString(connectionStringBuilderWA.ToString());
        }

        private PatientArrival generatePatientArrival(int patientNumber) {


            var checkinTimestamp = DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss.fff");

            Random random = new Random();

            var patientId = HashUtils.SHA1HashStringForUTF8String(patientNumber + "");

            int hospitalId = random.Next(1, 6); // 1-5
            int feedbackId = random.Next(1, 9); // 1-8
            int departmentPrefix = random.Next(0, 2);
            string departmentName = departments[departmentPrefix];

            PatientArrival arrivalRecord = new PatientArrival(patientId, checkinTimestamp, hospitalId, departmentName, feedbackId);

            return arrivalRecord;
        }

        // This method will be called with the number of 
        public void generateData(int numberOfRounds) {

            Random random = new Random();

            for (int roundId = 1; roundId <= numberOfRounds; roundId++) {

                // Generate and broadcast data for all 15 patients
                broadcastSingleRound().Wait();

                int pauseDurationSeconds = random.Next(1, 12); // sleep between 1 and 11 seconds

                Console.WriteLine("Completed Round " + roundId + " and pausing for " + pauseDurationSeconds + " seconds");

                // Pause for between 1 to 11 seconds and then kick off the next round again
                Thread.Sleep(new TimeSpan(0, 0, pauseDurationSeconds));
            }
        }

        private async Task broadcastSingleRound()
        {
            // Generating and transmitting data for 15 patients
            for (int patientId = 1; patientId <= 15; patientId++) {

                await broadcastSinglePatient(patientId);
            }
        }

        // This will transmit the same patient arrival record to all 3 event hubs
        private async Task broadcastSinglePatient(int patientId) {

             PatientArrival arrivalRecord = this.generatePatientArrival(patientId);

             string record = arrivalRecord.ToString();

             Console.WriteLine("\n");
             Console.WriteLine("========================================================================");
             Console.WriteLine("Transmitting Patient Record to all event hubs");
             Console.WriteLine(record);

             await sendMessage(this.eventHubClientCA, record);
             await sendMessage(this.eventHubClientFL, record);
             await sendMessage(this.eventHubClientWA, record);
        }

        private async Task sendMessage(EventHubClient client, string message) {
        
            // Convert String to bytes
            var rawMessage = Encoding.UTF8.GetBytes(message);
                
            // Package message as Event Data
            EventData eventData = new EventData(rawMessage);

            // Send the pulse and blood pressure data to Event Hub
            await client.SendAsync(eventData);
        }

        public void Close()
        {
             this.eventHubClientCA.CloseAsync().Wait();
             this.eventHubClientFL.CloseAsync().Wait();
             this.eventHubClientWA.CloseAsync().Wait();
        }
    }
}
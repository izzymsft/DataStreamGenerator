using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Threading;
using System.IO;
using Microsoft.WindowsAzure;
using Microsoft.WindowsAzure.Storage;
using Microsoft.WindowsAzure.Storage.File;
using Microsoft.WindowsAzure.Storage.Blob;
using Microsoft.Azure.EventHubs;
using System.Text;
using DataGenerator.Models;
using DataGenerator.Utilities;

namespace DataGenerator.Models
{
    public class PatientArrival
    {
        public string CheckinTime { get; set; }
        public string PatientId {get; set; }
        public int HospitalId {get; set; }
        public string Department {get; set; } // One of Outpatient Unit, Emergency Room
        public int FeedbackId {get; set; }
        public PatientArrival()
        {

        }
        
        public PatientArrival(string id, string checkinTime, int facilityId, string dept, int feedbackId)
        {
            this.CheckinTime = checkinTime;
            this.PatientId = id;
            this.HospitalId = facilityId;
            this.Department = dept;
            this.FeedbackId = feedbackId;
        }

        /**
        * Returns a JSON representation of the object 
        */
        public override string ToString()
        {
            string result = JsonConvert.SerializeObject(this);

            return result;
        }
    }
}
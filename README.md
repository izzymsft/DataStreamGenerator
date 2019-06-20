## How to Run the Program to Generate Data

```shell
# Check out the code from git hub
git clone git@github.com:izzymsft/DataStreamGenerator.git

# Navigate to code root folder
cd DataStreamGenerator/DataGeneratorConsole

# Fetch all the dependencies if necessary
dotnet restore

# Check if the compilation works
dotnet build

# Compile and run the code to generate the messages
dotnet run
```

## Modifying and Configuring the Program

You should edit the Program.cs script in the Main() method to indicate the number of rounds you want to generate.

Each round will generate data for 15 patients and broadcast them to all applicable event hubs.

You also need an appsettings.json file similar to this one with your connection string and event hub names

```json 

{
    "Logging": {
      "LogLevel": {
        "Default": "Warning"
      }
    },
    "ConnectionStrings": {
        "EventHubConnection": "Endpoint=sb://pat093495.servicebus.windows.net/;SharedAccessKeyName=RootManageSharedAccessKey;SharedAccessKey=2prP9whtKJKmC8zo5lv/HcSitrV2GGi2ID5OrDnpYeY=",
        "EVHCalifornia": "California",
        "EVHFlorida": "Florida",
        "EVHWashington": "Washington",
        "EVHTexas": "Texas",
        "EVHAlabama": "Alabama",
        "EVHKansas": "Kansas",
        "EVHVirginia": "Virginia"
    }
  }
  
```

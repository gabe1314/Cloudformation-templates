CREATE EXTERNAL TABLE IF NOT EXISTS vpc_flow_logs (
Version INT,
Account STRING,
InterfaceId STRING,
SourceAddress STRING,
DestinationAddress STRING,
SourcePort INT,
DestinationPort INT,
Protocol INT,
Packets INT,
Bytes INT,
StartTime INT,
EndTime INT,
Action STRING,
LogStatus STRING
)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.RegexSerDe'
WITH SERDEPROPERTIES (
    "input.regex" = "^([^ ]+)\\s+([0-9]+)\\s+([^ ]+)\\s+([^ ]+)\\s+([^ ]+)\\s+([^ ]+)\\s+([^ ]+)\\s+([^ ]+)\\s+([^ ]+)\\s+([^ ]+)\\s+([0-9]+)\\s+([0-9]+)\\s+([^ ]+)\\s+([^ ]+)$") 
LOCATION 's3://central-cloudwatchlogs-765032730250/firehose2017/07/11/20/CloudWatchLogsStream-1-2017-07-11-20-49-11-215c6cea-9ec5-4916-aaf5-dee7185d216d//';
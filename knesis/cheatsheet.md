- For collecting, processing and analyzing streaming data in the cloud. When you need **real-time** think Kinesis
- **Kinesis Data Streams** Pay per running shard, data can persist within the stream. Data is ordered and every consumer keep its own position. Consumer has to be manually added(coded). Data persists for **24 hours** by default, can be up to 168 hours.
- **Kinesis Firehose** Pay for only the data ingested. data in **immediately disappears** once it's processed. Consumer of choice from a set of predefined services: S3, RedShift, ElasticSearch or Splunk
- **Kinesis Data Analytics** Allows you to perform **queries in real-time**. Needs a Kinesis Data Streams/Firehose as the input or output
- **Kinesis Video Analytics** securely ingest and store video and audio encoded data to consumers such as SageMaker, Rekognition or other services to apply Machine Learning and video processing
- KPL(Kinesis Producer Library) is a Java library to write data to a stream
- You can write data to streams using AWS SDK, but KPL is more efficient

# Kinesis
Collect, process and analyze real-time video and data streams. When you need **Realtime** think Kinesis

## 4 types of stream data
- Data Streams
- Data Firehose
- Data Analytics
- Video Streams

### Kinesis Data Streams
![image](https://github.com/nguyen1tech/learn-aws/assets/123853507/cc5f396e-21c3-4609-a60e-a88e0472ec89)
- You pay per running shard
- You can have muliple consumers, you must manually configure your consumers
- Data can be persist for **24 hours** by default to 168 hours before it disapears from the stream

### Kinesis Data Firehose
![image](https://github.com/nguyen1tech/learn-aws/assets/123853507/3747b1b2-e42a-4690-a1de-ed6ad9e0c58a)
- You choose **one consumer** from a pre-defined list
- Data immediately **disappears** once it's consumed
- You can convert incoming data to other to a few files formats, compress and secure data
- You pay for only data that is ingested

### Kinesis Data Analytics
![image](https://github.com/nguyen1tech/learn-aws/assets/123853507/52d284ba-df7f-4100-85fc-0ec5cf1772d4)
- Data that passes through Data Analytics is run through **custom SQL** you provide and the results are then output
- Real-time analytics for your data

### Kinesis Video Streams
![image](https://github.com/nguyen1tech/learn-aws/assets/123853507/1f9d5b7d-5e5a-40b2-9fe9-b22a6516253a)
- Ingest audio and video encoded data from various devices and or services
- Output video data to ML or processing services

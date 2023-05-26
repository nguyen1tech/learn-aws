# SQS(Simple Queue Service)
Fully managed message queuing for microservices, distributed systems and serverless applications.

## How it works
![image](https://github.com/nguyen1tech/learn-aws/assets/123853507/00ecb8b0-7595-445e-b93a-2548a70253e5)

## Queue Types
- **Standard Queues**
  - Unlimited throughput: support a nearly unlimited number of transactions per second(TPS)
  - At-Least-Once Delivery: A message is delivered at least once but occationally more than one copy of a message is delivered.
  - Best Effort Ordering: Occationally, messages might be delivered in an order different from which they were sent.
- **FIFO Queues**: 
  - High Throughput: By default, FIFO queues support up to 300 messages per second(300 send, receive, or delete operations per second)
  - Exactly-Once Processing: A message is delivered once and remains available until a consumer processes and deletes it. Duplicates aren't introduced into the queue.
  - First in First out Delivery: The order in which messages are sent and received is strictly preserved.
## Functionality
- Unlimited Queues and messages
- Payload size: up to 256kb
- Batches
- Long Polling
- Retain messages in queues for up to 14 days
- Send and read messages simultaneously
- Message locking
- Queue Sharing
- Server side encryption
- Dead Letter Queues(DLQ)

## Common Design Patterns
- Work Queues: Decoupled components of a distributed application
- Buffer and Batch Operations: Add scalibility and reliability to your architecture, and smooth out temporary volume spikes without losing messages and increasing latency
- Request Offloading: Move slow operations off of interactive request paths by queuing the request.
- Fanout
- Priority: User separate queues to provide prioritization of work
- Scalibility: B/c message queues decouple processes, it's easy to scale up the send and read rate of messages - simply add another process
- Resiliency: When part of your system fails, it doesn't need to take entire system down. Message queues deouple components of your system, so if a process that is reading messages from the queue fails, messages can still be added to the queue to be processed when the system recovered.

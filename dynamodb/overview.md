# Dynamodb
A **key-value** and **document** NoSQL database which can **guarantee consistent reads and writes at any scale**

## What is NoSQL
NoSQL is database which is neither relational and does not use SQL to query the data for results

## What is a Key-Vaue store
A form of data storage which has a key references to a value and nothing more.

## What is a Document store
A form of data storage which has a **nested data structure**

## Features
- Fully managed
- Multi-region
- Multi-master
- Durable database
- Built-in security
- Backup and restore
- In-memory caching

## Provides
- Eventual consistent reads - default
- Strongly consistent reads

## Read consistency
![image](https://github.com/nguyen1tech/learn-aws/assets/123853507/d7ad4b46-923c-4b8c-b7fa-6edabf9dc2ef)

- When data needs to be updated it has to write updates to all copies -> It is possible for data to be **inconsistent** when reading from a copy which has yet to be updated.
=> To get around this, you need to set the **read consistency**

| Eventual Consistent Read - Default      | Strongly Consistent Reads |
| --------------------------------------- | ------------------------- |
| When copies are being updated it is possible for you to read and be returned an inconsistent copy  | When copies are being updated then you attempt to read, it will not return a result until all copies are consistent  |
| **Reads are fast** but no guarantee of consistent data |  You have a guarantee of consistency but the trade-off is higher latency (slower reads)   |
| All copies of data eventual **become generally consistent within a second** | All copies of data will be consistent within a second    |

## Partitions
A partition is an allocation of storage for a table, backed by a solid state drives (SSD) and automatically replicate across multiple Availibility Zones within an AWS Region. A partition is when you **slice your table up into smaller chucks of data(a partition)**. It speeds up reads for every large tables by logically grouping similar data together.
![image](https://github.com/nguyen1tech/learn-aws/assets/123853507/c3272e6d-2e98-4bf0-9a70-0ea47a58fa51)
- Dynamodb starts off with a single partition
- There are two cases where Dynamodb will create new partitions:
  - For every 10GB of data
  - When you exeed the **RCUs - 3000 RCUs** and **WCUs - 1000 WCUs** for a single parition

## Primary Keys
The primary keys determine where and how your data will be stored in paritions.
![image](https://github.com/nguyen1tech/learn-aws/assets/123853507/1fcf11d1-e8b3-4e6f-85f0-1c2376078859)
- There are 2 types of Primary Keys
  - Simple Primary Key - Only a Partition Key
  ![image](https://github.com/nguyen1tech/learn-aws/assets/123853507/4ff0234e-8c3c-4f52-a295-a6b8e6635e62)

  - Composite Primary Key -  A parition key + a sort key
  ![image](https://github.com/nguyen1tech/learn-aws/assets/123853507/84f074e7-bd38-435f-9d33-7ea8e1b4bde3)
  
## Query and Scan
- Query:
  - Allows you to find Items in a table based on primary key values
  - Query any table or secondary index that has a **composite primary key(parition and sort key)**
  - By default, read as **Eventual consistent**, if you want strongly consistent set `ConsistentRead true`
  - By default, returns all attributes for items
  - You can return specific attributes by using `ProjectionExpression`
  - By default is sorted ascending(use `ScanIndexForward False` to reverse or to desending)
- Scan:
  - Scan through all items and return one or more items through filters.
  - By default, return all attributes for items.
  - Scan can be performed on tables or secondary indexes
  - You can return specific attributes by using `ProjectionExpression`
  - **Avoid scans when possible**
**Notes**
  - Avoid scans when possible
    - Much less effient than running a query
    - As a table, scan can take longer to complete
    - A large table can use **all of your table provisioned throuhput** in a single scan

## Provisioned Capcity
- **Provisioned throughput capacity** is the maximum amount of capacity your application is allowed to **read** or **write** per second on a table or index
- Throughput is measured in capacity units:
  - RCUs -> Read capacity units
  - WCUs -> Write capacity units
- If you go beyond your capacity you will get the error `ProvisionedThroughputExceededException` --> This is known as **Throttling**. Requests that are throttled will be dropped(data loss)

## On-demand capacity
- Pay per request so you pay for only what you use.
- On-demand mode is good for:
  - New table with unknown workloads
  - Unpredictable application traffic
  - The ease of paying for only what you use

## Calculating Reads
- **Read capacity units(RCUs)**
  - Read capacity units present:
    - One strongly consistent read per second
    - or two eventual consistent reads per second
    - for an item up to 4kb in size
  - eg: RCUs = 10 --> 10 strongly consistent reads or 20 eventual consistent reads of 4kb of data or less
  - How to calculate RCUs for **Strong**
    - Round data up to nearest 4
    - Divide data by 4
    - Times by number of reads
    - eg: 50 reads at 40kb per item --> (40/4) * 50 = 500 RCUs <--> 10 reads at 6kb per item --> (8/4) * 10 = 200 RCUs (roud up 6 to 8) <--> 33 reads at 17kb per item --> (20 / 4) * 33 = 165 RCUs (round up 17 to 20)
  - How to calculate RCUs for **Eventual consistent read**
    - Round data up to the nearest 4
    - Divide by 4
    - Times by number of reads
    - Divide final number by 2
    - Round up to the nearest whole number
    - eg: 50 reads at 40kb per item --> (40 / 4) * 50 / 2 = 250 RCUs <--> 11 reads at 9kb per item --> (12 / 4) * 11 / 2 = 17 RCUs <--> 14 reads at 24kb per item --> (24 / 4) * 14 / 2 = 42 RCUs
- **Write capacity units(WCUs)**
  - Write capacity units represent:
    - One write per second
    - for an item up to 1kb
  - eg: WCUs = 10 --> 10 writes of 1kb of data or less
  - How to calculate WCUs
    - Round up data to the nearest 1
    - Times by number of writes
    - eg: 50 writes at 40kb per item --> 40 * 50 = 2000 WCUs <--> 11 writes at 1kb per item 1 * 11 = 11 WCUs <--> 18 writes at 500 bytes per item --> Round up 500 bytes to 1 kb --> 1 * 18 = 18 WCUs
## Global table
Fully managed, multi-region, multi-active database. Global table replicates your Dynamodb tables automatically across your choice of AWS Regions. Dynamodb global table consists of multiple replica tables(one per AWS Region) that Dynamodb treats as a single unit. Every replica have the same table name, the same primary key schema. When an application writes data to a replica in one region, Dynamodb propagates the write to the other replica tables in the other AWS Regions automatically.

## Transactions
Dynamodb offer the ability to perform transactions at no additional cost, using the `TransactionWriteItems` and `TransactionGetItem` operations
- Transactions allow **all or nothing** changes to mulitple items both **within and cross tables**

## Time to live (TTL)
Let you have items in Dynamodb expire(delete) at any given time

## Streams
If enable, DynamoDB will capture every modification to items so you can react to those changes
- When an **Insert**, **Update**, **Delete** occurs, the change will be captured and sent to **Lambda Functions**
  - Changes are sent in batches at a time to your Lambda
  - Changes are sent to your custom Lambda in near real-time
  - Each stream record appears exactly once in the stream
  - For each item that is modified, the stream records appear in the same sequence as the actual modifications

## Errors
- **Throttling exception**: rate of requests exceeds the allowed throughput. This exception might be returned if you performed any of the following operations too rapidly: CreateTable, UpdateTable, DeleteTable
- **ProvisionedThroughputExceededException**: You exceeded your maximum allowed provisioned throughput for a table or for one or more global secondary indexes.
- The AWS SDK will automatically retry with Exponential Backoffs when an error occurs: It will attempt the request again 50ms, 100ms, 200ms up to a minute before stopping.

## Secondary Indexes
- There are two types of indexes:
  - LSI - Local secondary index
  - GSI - Global secondary index
- **Local secondary indexes**
  - The total size of indexed items for one partition key value **can not exceed 10GB**
  - **Share provisioned throughput** settings for read and write activity with the table it's indexing.
  - Limit of 5 per table
- **Global secondary indexes**
  - It's considered global b/c queries on the index **can span all of the data in the base table, cross all paritions**
  - The indexes have no size restrictions (unlimited)
  - They have their own provisioned throughput settings. They consume capacity but not from the base table
  - Limited to 20 per table - default
![image](https://github.com/nguyen1tech/learn-aws/assets/123853507/c6c5fce9-95af-448b-9e35-7e0c7dbf51b4)


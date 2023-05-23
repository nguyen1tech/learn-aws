## Deployment Policies
1. All at once: Deploy the new version to all instances simutaneously. All instances in your environment are out of service for a short time while deployment occurs.
2. Rolling: Deploy the new version in batches. Each batch is taken out of service during the deployment phase, reducing your environment's capacity by the number of instances in a batch.
3. Rolling with additional batch: Deploy the new version in batches, but first launch a new batch of instances to ensure full capacity during the deployment process.
4. Immuatable: Deploy the new version to a fresh group of instances by performing immutable update.
5. Traffic Splitting: Deploy the new version to a fresh group of instances and temporarily split incoming client traffic between the existing application version and the new one.

## Blue/green deployment
Deploy the new version to a separate environment and then swap CNAMEs of the two environments to redirect traffic to the new version instantly

---
published: true
layout: post
title: Can I send batch messages larger than 256 KB to Azure Service Bus? 
categories: Lab
tags: dotnet azure azure-service-bus
---
## The short answer 
NO!

## The long answer
The Azure Service Bus maximum message size is 256 KB for `Standard tier` and `1 MB` for `Premium tier` ([https://docs.microsoft.com/azure/service-bus-messaging/service-bus-quotas](https://docs.microsoft.com/azure/service-bus-messaging/service-bus-quotas)).

A simple solution to overcome this limitation is split the messages in blocks lower or equal to 256 KB size. 

Below is a simplified version of the code that I used for Stantard tier  case:

{% gist ed0d6eb6a8457eabed916e86c369c56c %}
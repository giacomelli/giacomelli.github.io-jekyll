---
published: true
layout: post
title: Publishing WebJobs with Azure Pipelines
categories: Article
tags: dotnet azure webjobs azure-pipelines continuous-integration
---

[Azure WebJobs](https://docs.microsoft.com/en-US/azure/app-service/webjobs-sdk-get-started) are a great way to execute background process. 

{% logo azure.svg default %}

## Scenario
In last days I've created a [Azure Pipelines](https://azure.microsoft.com/pt-br/services/devops/pipelines/) that publish WebJobs, but in our specific case our WebJobs were not being published to `/site/wwwroot/App_Data/jobs/Continuous/<webjobs name>`, because "reasons" our root web app is using '/site/www' as folder. So, you should expect that the new folder to deploy WebJobs is `/site/www/App_Data/jobs/Continuous/<webjobs name>`, but `NO`, the new folder is `/site/jobs/Continuous/<webjobs name>`.

The big problem with the above behaviour is that `WebDeploy` via VS or  `AzureRmWebAppDeployment` task via Azure Pipeline will still try to deploy the webjobs to the folder inside `/site/www/`

My best suspects are these lines on [AzureRmWebAppDeployment@3](https://github.com/microsoft/azure-pipelines-tasks/blob/master/Tasks/AzureRmWebAppDeploymentV3/azurermwebappdeployment.ts#L73)
{% gist 1d47b7bf7e9a2b3806dbd0b0332743d2 AzureRmWebAppDeployment-lines.ts %}

The `AzureRmWebAppDeployment` just check the physical path configured on Azure when we defined a `VirtualApplicatoin` parameter, but in our case it is not a virtual application, but it is a different folder than `/site/wwwroot/`.
{% externalref in [Kudu wiki](https://github.com/projectkudu/kudu/wiki/WebJobs) there is some explanation about the webjobs folders. %}

## Solution
I used the FtpUpload task to publish the WebJobs binaries to the `/site/jobs/Continuous/<webjobs name>` and two instances of `AzureAppServiceManage` task to stop and start the jobs:

{% note you'll need to replace the values between <..> in the `variables` section to specific values of your project %}
{% gist 1d47b7bf7e9a2b3806dbd0b0332743d2 azure-pipelines.yml %}


{% note I omitted some tasks from the original azure-pipelines.yml for simplicity. The original has a lot of others taks, as unit tests and web api publishing %}


## Extra points (graceful shutdown)
Now that you've automate your WebJobs publishing, is a good idea improve your jobs to check if Azure has requested a shutdown. You can do this taks through the [CancellationToken](https://docs.microsoft.com/en-us/azure/azure-functions/functions-dotnet-class-library#cancellation-tokens) parameter passed to the job.

> A function can accept a CancellationToken parameter, which enables the operating system to notify your code when the function is about to be terminated. You can use this notification to make sure the function doesn't terminate unexpectedly in a way that leaves data in an inconsistent state.

## Further reading
* [FTP Upload task](https://docs.microsoft.com/en-us/azure/devops/pipelines/tasks/utility/ftp-upload?view=azure-devops)
* [Azure App Service Manage task](https://docs.microsoft.com/en-us/azure/devops/pipelines/tasks/deploy/azure-app-service-manage?view=azure-devops)
* [WebJobs Graceful Shutdown](http://blog.amitapple.com/post/2014/05/webjobs-graceful-shutdown)
* [YAML schema reference](https://docs.microsoft.com/en-us/azure/devops/pipelines/yaml-schema?view=azure-devops&tabs=schema)
* [Predefined variables](https://docs.microsoft.com/en-us/azure/devops/pipelines/build/variables?view=azure-devops&tabs=yaml)


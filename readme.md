## Windows Azure

###Tools's
 1. Microsoft Azure (https://azure.microsoft.com/en-us/) / (https://portal.azure.com)
 2. mRemoteNG (http://www.mremoteng.org/)
 3. CloudBerry (http://www.cloudberrylab.com/)
 4. VisualStudio (https://www.visualstudio.com/) Version 2015
 5. PowerShell (https://msdn.microsoft.com/en-us/powershell/mt173057.aspx)
 6. Deployment tool (using there own custom tool)
 7. Download SQL Server Management Studio (SSMS) (https://msdn.microsoft.com/en-us/library/mt238290.aspx)
 8. SSL Certificate 
 9. .Net Framework 4.6.1
 10. nlog  (http://nlog-project.org/)
 11. Roboongo (https://robomongo.org)
 12. FreeCommander (http://freecommander.com/en/summary/)
 13. Fiddler (http://www.telerik.com/fiddler)
 14. TeamFoundation Server (https://www.visualstudio.com/en-us/products/tfs-overview-vs.aspx)
 15. Liberkey  (http://www.liberkey.com/en.html)
 
##Types of Server's

 1. Redis 
 2. Webserver (ISS)
 3. Mongo (Cluster)
 4. Database (MSSQL)
 
 
## Server Configuration
  
 1. Redis(1)
    - Premium one
    
 2. Webserver(3)
    - Hotel (2) 
        - ExtraLarge
        - 8 cores
        - 15GB RAM
    - Diagnostic (Small :2)   
        - Logs
            - 1 cores
            - 3.5GB RAM
        - Trace
            - 1 cores
            - 3.5GB RAM
 3. Mongo 
    - master(2)
        - 4 cores
        - 15GB RAM
        - 1TB  HDD
    - config(3)
        - 1 core
        - 4GB RAM
        - 1TB HDD
 
 4. Database(1) 
    - P1-Premium 
        - 125 DTUs
        - 250GB HDD
        - V12 Version
 
 5. Data Containers(2)
    - prodsystemdata (Stores all folders/files)
        - Perfomace : Standard
        - Replication : Local-redundant-storage (LRS) 
    - prodsession 
        - Perfomace : Standard
        - Replication : Local-redundant-storage (LRS) 

    
 
## Step's

1. Login to https://portal.azure.com
    - Resouce Group
        - Name:
        - Subscription:
        - Location:
      - Note
        - Do not remove resource group it will delete everything.
        - we can't rename resource group.
    
    - Reserved IP-Address    
        - Created using powershell  (Bug)
    
    - Storage Account
        
    - Cloud Services 
        - DNS Name:
        - Subscription:
        - Reaource Group:
        - Package:
        - Location:
        - Certificate:
    
    - Virtaul Network 
        - Name:
        - Address:
        - SubnetName:
        - Subnet Address Range:
        - Resource Group:
        - Location:   
      - Note
        - was recreated using powershell (Bug)
        
    - SQL Database 
      - Note
        - Should be in Private network 
        - For private network we need a Premium server
        
    - Redis Instance 
      - Note
        - Should be in Private network 
        - For private network we need a Premium server 

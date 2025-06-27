--ARM Azure resource manager
--is json format
--this can be saved as template and create future db
--similar could be achieve through powershell, but powershell incur extra cost

--dacpac
--data tear application, portable artefec
--which is sth could be added to azure_pipeline.yml
--this are helpful when batch creating db

-- deployment method
--1.Azure SQL DB
--platform as a service
--Azure managed DB
--always running unless dropped(for serverless unless paused)
--best for modern cloud solution & fast time to market
--SQL compatability best
--trace flag aren't supported
--Trace flags in SQL Server are specialized configuration settings that alter the behavior of the database engine. They are used to enable or disable specific features, diagnose issues, or fine-tune performance, often providing access to undocumented or advanced options.
--build in backup, patching and recovery
--storage up to 100tb
--support serverless & provisioned compute
--.net framework, common language runtime not supported
--using latest SQL server version
--can use elastic job agent service
--size of db/elastic pool can be changed
--vertical scaling and horizontal scaling allowed
--service tier can be changed from basic/standard/general purpose (premium disc) to premium(premium disc)/business critical(ssds)
--downgrade is not allowed, only can be decommisioned
--auditing work at db level
--.xel log file are stored in Azure Blob storage
--authentication:SQL server /Azure active directory

--2.Azure SQL manged Instance
--platform as a service
--Azure managed DB
--always running unless dropped
--best for new or in-prem aplication to use in/migration to cloud
--SQL compatability second
--some trace flag are supported
--build in backup, patching and recovery
--general purpose 16 tb,business critical 4-16tb. up to 100db, next-gen feneral purpose up to 500db. subject to number of vcores
--.net framework, common language runtime supported
--using latest SQL server version
--can use SQL agent job, no need of elastic pool bcs everything are laready in a pool
--size of db can be changed
--vertical scaling allowed, but not easy
--service tier can be changed between premium/business critical
--auditing work at server level
--.xel log file are stored in Azure Blob storage
--authentication:SQL server /Azure active directory


--3. SQL server on Azure VM
--infrastructure as a service
--user self manage
--can be shut down when not used, when shut down there is a storage cost
--lift and shift, can be easily moved from on-prem server to another
--more expensive
--best when don't want any change/require OS level service
--all on-premise compatable
--all trace flag are supported
--self manage backup, patching and recovery
--instance up to 256tb, up to 50 instance per server (db of up to instance size)
--using any version of SQL server 2008r2 onwards
--can use SQL agent job
--size of vm can be changed
--adding more compute power to VM is possible
--auditing work at server level
--event stored in window events log/file system
--authentication:SQL server /windows


--all 3 can use Azure hybrid benefit (windows server for VM, SQL server license for software assurance) & reserve capcity to reduce cost
--hybrid benefit doesn't apply to serverless
--lift and shift the server onto on premise machine
--vertical scaling = adding more compute power
--horizontal scaling = sharing data into multiple database nodes
-- can use azure defender (include vuneraility assessment & threat detection) (0,02dollar/hr/instance)
--data encryption, can use transport layer security (tls)/transport data encryption (tds)/always encrypted & firewall



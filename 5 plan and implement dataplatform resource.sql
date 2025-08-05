--ARM Azure resource manager
--is json format
--this can be saved as template and create future db
--similar could be achieve through powershell, but powershell incur extra cost

--dacpac
--data tear application, portable artefec
--which is sth could be added to azure_pipeline.yml
--this are helpful when batch creating db





--deployment can be done through using json template
--in the json file for sql db template under keyword resource, 2 type would need to be defined. one is server, the other is db
--both server and db need apiversion, name and db
--server has properties: administratorlogin, administratorpassword
--db has sku: name and tier, dependsOn: resourceid(servername)
--parameters(as variable in python) can be stored in a seperate file


--bicep is a shorthand for json
--bicep:       param    severname string = uniqueString('sql',  resourcegroup.id())
--json-filed=  keyword  attribute type:sting default_value: uniqueString('sql',  resourcegroup.id())
--bicep can't be directly deployed
--azure pipeline, visual studio code bicep extention and github action can help with generate bicep format
--then azure will convert bicep back to arm when compile
--there is bicep playground online which does the translate between ARM and bicep, but the translation might not stay true to original version
--deployment could also be done through powershell/azure cli
--Der SQL Server Agent ist ein Feature von SQL Server selbst und wird f�r die Verwaltung und Ausf�hrung von Auftr�gen auf einer einzelnen SQL Server-Instanz oder in einem Multi-Server-Setup verwendet. 
--Der Elastic Job Agent hingegen ist eine Azure-Ressource, die speziell f�r die Verwaltung und Ausf�hrung von Auftr�gen �ber mehrere Datenbanken in Azure SQL Datenbank, auch �ber verschiedene Server und Regionen hinweg, entwickelt wurde. 

-- <dataset>
--   <record>
--     <id>1</id>
--     <first_name>Ashleigh</first_name>
--     <last_name>Whellans</last_name>
--     <email>awhellans0@linkedin.com</email>
--     <gender>Bigender</gender>
--     <country>Vietnam</country>
--   </record>
-- </dataset>

select MY_XML.record.query('id').value('.','INT')  ,
		MY_XML.record.query('first_name').value('.','VARCHAR(50)')  ,
		MY_XML.record.query('last_name').value('.','VARCHAR(50)')  ,
		MY_XML.record.query('email').value('.','VARCHAR(100)')  ,
		MY_XML.record.query('gender').value('.','VARCHAR(50)')  ,
		MY_XML.record.query('country').value('.','VARCHAR(100)')  
FROM
(select CAST(MY_XML AS xml) from 
OPENROWSET(BULK 'C:\Users\ChJain\OneDrive - DXC Production\Desktop\Sellers.xml', SINGLE_BLOB)
AS T(MY_XML) 
) AS T(MY_XML)
CROSS APPLY MY_XML.nodes('dataset/record') AS MY_XML (record);

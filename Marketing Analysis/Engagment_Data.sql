USE Marketing ; 

SELECT count(*) FROM engagement_data ;


--*******************************
--*******************************

-- Normalize and Clean The engagemnt_data Table
SELECT EngagementID,
       ContentID,
	   CampaignID,
	   ProductID,
       UPPER(REPLACE(ContentType , 'socialmedia', 'Social Media' )) AS Content_Type , 
       LEFT(ViewsClicksCombined, CHARINDEX('-',ViewsClicksCombined) -1) AS Views ,
	   RIGHT(ViewsClicksCombined, len(ViewsClicksCombined) - CHARINDEX('-',ViewsClicksCombined)) AS Clicks,
	   Likes,
	   FORMAT(CAST(EngagementDate as Date) ,'dd.MM.yyyy') AS EngagementDate
FROM engagement_data
WHERE ContentType != 'NEWSLETTER'

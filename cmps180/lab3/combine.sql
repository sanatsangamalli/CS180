/*use transaction, upsert(not on duplicatekeyupdate)*/
/*\i create.sql
\i lab3_data_loading.sql*/
START TRANSACTION ISOLATION LEVEL SERIALIZABLE;
INSERT INTO Members(memberID, memberName, joinDate, renewalDate, isCurrentMember)
SELECT n.memberID, n.memberName, CURRENT_DATE, n.renewalDate, TRUE
FROM NewMemberships n
ON CONFLICT (memberID)
DO 
	UPDATE 
		SET isCurrentMember = TRUE, memberName = EXCLUDED.memberName, renewalDate = EXCLUDED.renewalDate;
COMMIT;



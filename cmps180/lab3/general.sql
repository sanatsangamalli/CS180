/*check constraint*/
ALTER TABLE Orders
ADD CONSTRAINT positive_quantity CHECK (quantity > 0);

ALTER TABLE Books
ADD CONSTRAINT  date_check CHECK (lastOrderDate >= pubDate);

ALTER TABLE Members
ADD CONSTRAINT join_is_current CHECK ((joinDate is NULL AND isCurrentMember is NULL)
										OR joinDate IS NOT NULL);
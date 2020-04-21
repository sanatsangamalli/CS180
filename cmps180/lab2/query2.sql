Select o.quantity, o.orderDate
FROM Orders o, Members m
Where o.memberID = m.memberID AND
		m.isCurrentMember = true;
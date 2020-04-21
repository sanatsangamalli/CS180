Create or Replace Function increasePricesFunction(thePublisherID INTEGER, theCount INTEGER)
	Returns INTEGER AS $$
	DECLARE
		counter INTEGER;
		bID CHAR(6);
		genre CHAR(1);
		inc INTEGER;
		tracker INTEGER;
	DECLARE c CURSOR FOR 
		SELECT b.bookID, b.category 
		FROM Books b, Publishers p
		WHERE p.publisherID = b.publisherID AND
				p.publisherID = thePublisherID AND
				b.category IS NOT NULL
		ORDER by b.price DESC
		FOR UPDATE;
	BEGIN
		OPEN c;
		counter := 0;
		tracker := 0;
		LOOP
		FETCH FROM c INTO bID, genre;
			EXIT WHEN NOT FOUND;
			EXIT WHEN counter = theCount;
			IF genre = 'F' THEN inc := 2.50; 
			ELSEIF genre = 'N' THEN inc := 1.50;
			END IF;
			counter := counter + 1;
			UPDATE Books SET price = price + inc 
				WHERE CURRENT OF c;
			tracker := tracker + 1;
			EXIT WHEN tracker = theCount;
			END LOOP;
		CLOSE c;
		RETURN counter;
	END;$$
	LANGUAGE plpgsql;
	
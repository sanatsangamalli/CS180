import java.sql.*;
import java.util.*;

/**
 * The class implements methods of the NileBooks database interface.
 *
 * All methods of the class receive a Connection object through which all
 * communication to the database should be performed. Note: the
 * Connection object should not be closed by any method.
 *
 * Also, no method should throw any exceptions. In particular, in case
 * an error occurs in the database, then the method should print an
 * error message and call System.exit(-1);
 */

public class NileBooksApplication {

    private Connection connection;

    /*
     * Constructor
     */
    public NileBooksApplication(Connection connection) {
        this.connection = connection;
    }

    public Connection getConnection()
    {
        return connection;
    }

    /**
     * Takes as argument an integer called numberReviewedBooks.
     * Returns the authorID for each author in Authors that has at least numberReviewedBooks
     * different books that have at least one review.
     * A negative value for numberReviewedBooks is an error.
     */

    public List<Integer> getAuthorsWithManyReviewedBooks(int numberReviewedBooks)
    {
        // your code here
		//parameter check
		if(numberReviewedBooks <= 0) { System.err.println("numberReviewedBooks is not positive"); System.exit(-1); }
        List<Integer> result = new ArrayList<Integer>();
		//each book should have a review
		String query = "Select a.authorID From Authors a, Books b, Reviews r " +
						"Where a.authorID = b.authorID and b.bookID = r.bookID " +
						"Group By a.authorID " +
						"Having COUNT(DISTINCT b.bookID) >= ?;"; //query
		//initialize statement and result set
		PreparedStatement prest = null;
		ResultSet rs = null;
		try {
			prest = connection.prepareStatement(query);	//execute query
			prest.setInt(1, numberReviewedBooks);
			rs = prest.executeQuery();
			while(rs.next())
			{
                int author = rs.getInt(1);
                result.add(author);
			}
		} catch(SQLException e) {	//exception handling
			System.out.print("SQLException" + e);
		} finally {	//close statement and result set
			try { if(prest != null) prest.close();} catch(Exception e){};
			try { if(rs != null) rs.close();} catch(Exception e){};
		}

        // end of your code
        return result;
    }


    /**
     * The fixTotalOrdered method has one integer argument, aPublisherIDtoFix, which is a publisherID.
     * fixTotalOrdered should change the totalOrdered values for each “bad book” that was published
     * by aPublisherIDtoFix, updating totalOrdered so that it is correct, i.e., so that it’s equal
     * to the sum of the quantity values for the Orders of that book.
     * fixTotalOrdered should return the number of bad books whose totalOrdered values were “fixed”.
     *
     * This method is relatively easy to write if you use the BadBookTotals view from Lab3, which has
     * been provided to you in the lab4_create.sql script for this assignment.
     */

    public int fixTotalOrdered(int aPublisherIDtoFix)
    {
        // your code here; return 0 appears for now to allow this skeleton to compile.
        //return 0;
		String updateQuery = "Update Books " +
						"Set totalOrdered = t.badQuantitySum " +
						"From BadBookTotals t " +
						"Where Books.publisherID = " + aPublisherIDtoFix + " and " +
						"t.bookID = Books.bookID; "; //query
		//initialize variables
		int countFix = 0;
		PreparedStatement ps = null;
		try {
			ps = connection.prepareStatement(updateQuery);	//execute query
			countFix = ps.executeUpdate();
		} catch(SQLException e) {	//exception handling
			System.out.print("SQLException" + e);
		} finally {	//close statement
			try { if(ps != null) ps.close();} catch(Exception e){};
		}
		return countFix;


        // end of your code
    }


    /**
     * increasePublishersPrices has two integer parameters, thePublisherID and theCount, and invokes
     * a stored function increasePricesFunction that you will need to implement and store in the database
     * according to the description in Lab4 assignment.
     *
     * The increasePublishersPrices method must only invoke the stored function increasePricesFunction,
     * which does all of the assignment work; do not implement the increasePublishersPrices method using
     * a bunch of SQL statements through JDBC.  However, increasePublishersPrices should check to see
     * whether theCount is greater or equal to 0, and report an error if it’s not.
     *
     * increasePublishersPrices should return the same integer result as the increasePricesFunction
     * stored function.
     */

    public int increasePublishersPrices(int thePublisherID, int theCount)
    {
        // There's nothing special about the name storedFunctionResult
		//parameter check
		if(theCount <= 0) { System.err.println("storedFunctionResult is not positive"); System.exit(-1); }
		//loop auto goes to next iteration of cursor
        int storedFunctionResult = 0;
        // your code here
		String query = "SELECT * FROM increasePricesFunction(?, ?); ";	//query
		//initialize statement and result set
		PreparedStatement prest = null;
		ResultSet rs = null;
		try {
			prest = connection.prepareStatement(query);	//execute query using function
			prest.setInt(1, thePublisherID);
			prest.setInt(2, theCount);
			rs = prest.executeQuery();
			while(rs.next())
			{
                storedFunctionResult = rs.getInt(1);
			}
		} catch(SQLException e) {	//exception handling
			System.out.print("SQLException" + e);
		} finally {	//close statement and result set
			try { if(prest != null) prest.close();} catch(Exception e){};
			try { if(rs != null) rs.close();} catch(Exception e){};
		}
        // end of your code
        return storedFunctionResult;

    }

};

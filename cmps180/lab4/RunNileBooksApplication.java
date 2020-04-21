import java.sql.*;
import java.io.*;
import java.util.*;

/**
 * A class that connects to PostgreSQL and disconnects.
 * You will need to change your credentials below, to match the usename and password of your account
 * in the PostgreSQL server.
 * The name of your database in the server is the same as your username.
 * You are asked to include code that tests the methods of the NileBooksApplication class
 * in a similar manner to the sample RunStoresApplication.java program.
*/
//run this every time you make changes to the code
//look into as a result set

public class RunNileBooksApplication
{
    public static void main(String[] args) {
    	
    	Connection connection = null;
    	try {
    	    //Register the driver
    		Class.forName("org.postgresql.Driver"); 
    	    // Make the connection.
            // You will need to fill in your real username
            // and password for your Postgres account in the arguments of the
            // getConnection method below.
            connection = DriverManager.getConnection(
                                                     "jdbc:postgresql://cmps180-db.lt.ucsc.edu/ssangama",
                                                     "usename",
                                                     "password");//replace with "username" and "password" when submitting
            
            if (connection != null)
                System.out.println("Connected to the database!");

            /* Include your code below to test the methods of the NileBooksApplication class
             * The sample code in RunStoresApplication.java should be useful.
             * That code tests other methods for a different database schema.
             * Your code below: */
            NileBooksApplication nb = new NileBooksApplication(connection);
			List<Integer> authorList = nb.getAuthorsWithManyReviewedBooks(3);
			System.out.println("Result of first query is: ");
			for(int i: authorList) {
				System.out.println(i);
			}
			/* * Output of getAuthorsWithManyReviewedBooks 
			 * when the parameter numReviewedBooks is 3
			 * Connected to the database!
			 *	Result of first query is:
			 *	111
			 *	2192
			 */

            int n = nb.fixTotalOrdered(94519);
			System.out.println(n);
			/*
			 * Output of fixTotalOrdered when parameter is 94519
			 * 9
			 */
			 
			int result = nb.increasePublishersPrices(98035, 2);
			System.out.println(result);
			/**
			 * Output of increasePublishersPrices when
			 * the publisherID = 98035 and theCount is 2
			 * Connected to the database!
			 * 2
			 */
			result = nb.increasePublishersPrices(98035, 4);
			System.out.println(result);
			/**
			 * Output of increasePublishersPrices when
			 * the publisherID = 98035 and theCount is 4
			 * Connected to the database!
			 * 4
			 */
            /*******************
            * Your code ends here */
            
    	}
    	catch (SQLException | ClassNotFoundException e) {
    		System.out.println("Error while connecting to database: " + e);
    		e.printStackTrace();
    	}
    	finally {
    		if (connection != null) {
    			// Closing Connection
    			try {
					connection.close();
				} catch (SQLException e) {
					System.out.println("Failed to close connection: " + e);
					e.printStackTrace();
				}
    		}
    	}
    }
}

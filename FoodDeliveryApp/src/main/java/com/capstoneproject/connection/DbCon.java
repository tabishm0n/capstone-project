package com.capstoneproject.connection;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DbCon {
	private static Connection connection = null;
	public static Connection getConnection() throws ClassNotFoundException, SQLException{
        if(connection == null){
            Class.forName("org.postgresql.Driver");
            connection=DriverManager.getConnection("jdbc:postgresql://localhost:5432/capstoneproject","tabishmon","123");
            System.out.print("connected");
        }
        return connection;
    }
}

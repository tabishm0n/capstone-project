package com.capstoneproject.connection;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
//Establishing connection with Database
public class DbCon {
	private static Connection connection = null;
	public static Connection getConnection() throws ClassNotFoundException, SQLException{
        if(connection == null){
            Class.forName("org.postgresql.Driver");
            connection=DriverManager.getConnection("jdbc:postgresql://localhost:5432/capstoneproject","postgres","123");
            System.out.print("connected");
        }
        return connection;
    }
}

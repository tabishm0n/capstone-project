package com.capstoneproject.connection;

import java.sql.Statement;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Properties;
import java.util.Scanner;
//Establishing connection with Database
public class DbCon {
	private static Connection connection = null;
	public static Connection getConnection() throws ClassNotFoundException, SQLException{
        if(connection == null){
        	Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
        	  String connectionUrl = "jdbc:sqlserver://hungersupply.database.windows.net:1433;database=hungersupply;user=HungerAdmin@hungersupply;password=Microsoft123;encrypt=true;trustServerCertificate=false;hostNameInCertificate=*.database.windows.net;loginTimeout=30;";
        	  	try {
                  // Load SQL Server JDBC driver and establish connection.
                  System.out.print("Connecting to SQL Server ... ");
                  connection = DriverManager.getConnection(connectionUrl);
                  System.out.println("Connected!");
                  
              } catch (Exception e) {
                  System.out.println();
                  e.printStackTrace();
              }
        }
        return connection;
    }
}

public class JDBCUtils {
    private static DataSource ds;

    static {
        Properties properties = new Properties();
        try {
            properties.load(JDBCUtils.class.getClassLoader().getResourceAsStream("druid.properties"));
        } catch (IOException e) {
            e.printStackTrace();
        }
        try {
            ds = DruidDataSourceFactory.createDataSource(properties);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // connect
    public  static Connection getConnection() throws SQLException {
        return ds.getConnection();
    }
    // close
    public static void close(ResultSet rs, Statement stmt, Connection conn){

        if (stmt != null) {
            try {
                stmt.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        if (conn != null) {
            try {
                conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        if (rs != null) {
            try {
                rs.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

    }

    public static void close(Statement stmt, Connection conn){

      close(null, stmt, conn);
    }

  

    public static DataSource getDs() {
        return ds;
    }
}


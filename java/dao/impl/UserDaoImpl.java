public class UserDaoImpl implements UserDao {
    private  JdbcTemplate template  = new JdbcTemplate(JDBCUtils.getDs());
    @Override
    public List<User> findAll() {
        String sql = "select * from user";

        return template.query(sql, new BeanPropertyRowMapper<User>(User.class));
    }

    @Override
    public void add(User user) {
        String sql = "insert into user values(null,?,?,?,?,?,?,null, null)";
        int i = template.update(sql, user.getName(), user.getGender(), user.getAge(), user.getProvince(), user.getPhone(), user.getEmail());
        System.out.println("affected rows"+i);

    }

    @Override
    public void update(User user) {
        String sql = "update user set name = ?, gender=?, age=?, province=?, phone=?, email=? where id = ?";
        int i = template.update(sql, user.getName(), user.getGender(), user.getAge(), user.getProvince(), user.getPhone(), user.getEmail(), user.getId());
        System.out.println("affected rows"+i);
    }

    @Override
    public void delete(int id) {
        String sql = "delete from user where id = ?";
        int i = template.update(sql, id);
        System.out.println("affected rows"+i);

    }

    @Override
    public User findById(int id) {

        String sql = "select * from user where id = ?";
        return template.queryForObject(sql, new BeanPropertyRowMapper<User>(User.class), id);
    }

    @Override
    public User findUserByUserNameAndPassword(String username, String password) {
        try {
            String sql = "select * from user where username=? and password=?";

            User user = template.queryForObject(sql, new BeanPropertyRowMapper<User>(User.class), username, password);
            return user;
        }catch (Exception e){
            e.printStackTrace();
            return null;
        }
    }

    @Override
    public List<User> findByPage(int start, int rows, Map<String, String[]> condition) {
        String sql = "SELECT * FROM user where 1=1";
        StringBuilder sb = new StringBuilder(sql);
        Set<String> keySet = condition.keySet(); 
        ArrayList<Object> params = new ArrayList<>();
        for (String key: keySet){
            if ("currentPage".equals(key) || "rows".equals(key)){
                continue;
            }

           String value =  condition.get(key)[0];
            if (value != null && !"".equals(value)){
                sb.append(" AND " + key + " LIKE ? ");
                params.add("%" + value + "%");
            }

        }

        sb.append(" limit ?, ?");
        sql = sb.toString();
        params.add(start); 
        params.add(rows);
        System.out.println("sqlfindByPage = " + sql);
        System.out.println("paramsList = " + params);

        return template.query(sql, new BeanPropertyRowMapper<User>(User.class), params.toArray());
    }

    @Override
    public int findTotalCount(Map<String, String[]> condition) {
        String sql = "SELECT count(*) FROM user where 1=1";
        StringBuilder sb = new StringBuilder(sql);
        Set<String> keySet = condition.keySet();
        ArrayList<Object> params = new ArrayList<>();
      
        for (String key: keySet){
            if ("currentPage".equals(key) || "rows".equals(key)){
                continue;
            }
            String value =  condition.get(key)[0];
            if (value != null && !"".equals(value)){
                sb.append(" AND " + key + " LIKE ? ");
                params.add("%" + value + "%");
            }

        }
        System.out.println("params"+ params);
        return template.queryForObject(sb.toString(), Integer.class, params.toArray() );
    }
}

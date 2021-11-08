public interface UserDao {
  
    public List<User> findAll();

    public void add(User user);

    public void update(User user);

    public void delete(int id);

    public User findById(int id);

    public User findUserByUserNameAndPassword(String username, String password);

    public List<User> findByPage(int start, int rows, Map<String, String[]> condition);

    int findTotalCount(Map<String, String[]> condition);

}

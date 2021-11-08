public interface UserService {
   
    public List<User> findAll();

    public void addUser(User user);

    public void update(User user);

    public void deleteUser(String id);

    public User findUserById(String id);

    public User login(User user);

    public PageBean<User> findUserByPage(String _currentPage, String _rows, Map<String, String[]> condition );

    public void deleteSelectedUser(String[] ids);

}

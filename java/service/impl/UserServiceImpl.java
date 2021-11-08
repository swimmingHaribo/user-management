public class UserServiceImpl implements UserService {
    private  UserDao dao = new UserDaoImpl();
    @Override
    public List<User> findAll() {
        return dao.findAll();
    }

    @Override
    public void addUser(User user) {
        dao.add(user);
    }

    @Override
    public void update(User user) {
        dao.update(user);
    }

    @Override
    public void deleteUser(String id) {
        dao.delete(Integer.parseInt(id));
    }

    @Override
    public User findUserById(String id) {
        return dao.findById(Integer.parseInt(id));
    }

    @Override
    public User login(User user) {
        return dao.findUserByUserNameAndPassword(user.getUsername(), user.getPassword());
    }

    @Override
    public PageBean<User> findUserByPage(String _currentPage, String _rows, Map<String, String[]> condition) {
        //
        int currentPage = Integer.parseInt(_currentPage);
        int rows = Integer.parseInt(_rows);
        if (currentPage <= 0)
            currentPage = 1;

        PageBean<User> pageBean = new PageBean<>();
        pageBean.setCurrentPage(currentPage);
        pageBean.setRows(rows);

        int start =  (currentPage - 1)*rows; 
        List<User> list = dao.findByPage(start, rows, condition);
        pageBean.setList(list);

        int totalCount = dao.findTotalCount(condition);
        pageBean.setTotalCount(totalCount);

        int totalPage = (totalCount%rows) == 0?totalCount/rows : (totalCount/rows+1);
        pageBean.setTotalPage(totalPage);

        return pageBean;
    }

    public void deleteSelectedUser(String[] ids) {
        if (ids != null && ids.length > 0) {
            for (String id : ids) {
                dao.delete(Integer.parseInt(id));
            }
        }
    }

}

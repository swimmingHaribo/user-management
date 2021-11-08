@WebServlet(name = "loginServlet", value = "/loginServlet")
public class LoginServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        request.getRequestDispatcher("/login.jsp").forward(request, response);
        return;
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        request.setCharacterEncoding("utf-8");
        String verifycode = request.getParameter("verifycode");
       
        HttpSession session = request.getSession();
        String checkcode_server = (String)session.getAttribute("CHECKCODE_SERVER");
        session.removeAttribute("CHECKCODE_SERVER");
        if (!checkcode_server.equalsIgnoreCase(verifycode)){
            request.setAttribute("login_msg", "Incorrect verification code");
            request.getRequestDispatcher("/login.jsp").forward(request, response);
            return;
        }
        Map<String, String[]> map = request.getParameterMap();
        User user = new User();
        try {           
            BeanUtils.populate(user, map);
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        } catch (InvocationTargetException e) {
            e.printStackTrace();
        }

//        String username = request.getParameter("username");
//        String password = request.getParameter("password");
//        User user = new User();
//        if (username!= null && password !=null){
//            user.setUsername(username);
//            user.setPassword(password);
//        }else {
//            request.setAttribute("login_msg", "null username or password");
//            request.getRequestDispatcher("/login.jsp").forward(request, response);
//            return;
//        }
        
        UserService userService = new UserServiceImpl();
        User dataUser = userService.login(user);
//        UserDaoImpl userDao = new UserDaoImpl();
//        User  dataUser = userDao.findUserByUserNameAndPassword(username, password);

        if (dataUser != null){
            session.setAttribute("user", dataUser);
            response.sendRedirect("index.jsp");
            return;
        }else{
            request.setAttribute("login_msg", "Incorrect username or password");
            request.getRequestDispatcher("login.jsp").forward(request, response);
            return;
        }
    }
}

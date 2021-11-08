@WebServlet(name = "updateUserServlet", value = "/updateUserServlet")
public class UpdateUserServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
}

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // post
        request.setCharacterEncoding("utf-8");
        Map<String, String[]> map = request.getParameterMap();

        User user = new User();
        try {
            BeanUtils.copyProperties(user, map);
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        } catch (InvocationTargetException e) {
            e.printStackTrace();
        }
        UserService service = new UserServiceImpl();
        service.update(user);
//        request.setAttribute("id", user.getId());
        response.sendRedirect("/findUserByPageServlet");
//        response.sendRedirect("/userListServlet");

    }
}

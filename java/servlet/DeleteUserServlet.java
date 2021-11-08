@WebServlet(name = "deleteUserServlet", value = "/deleteUserServlet")
public class DeleteUserServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String id = request.getParameter("id");

//        request.getParameterValues("")
        UserService userService = new UserServiceImpl();
        userService.deleteUser(id);

        response.sendRedirect("/findUserByPageServlet");


    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doGet(request, response);
    }
}

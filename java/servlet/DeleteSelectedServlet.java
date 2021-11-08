
@WebServlet(name = "deleteSelectedServlet", value = "/deleteSelectedServlet")
public class DeleteSelectedServlet extends HttpServlet {
    @Override
    protected   void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            this.doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String[] uids = request.getParameterValues("uid");
        System.out.println("Arrays.toString(uids) = ");
        System.out.println(Arrays.toString(uids));

        UserService userService = new UserServiceImpl();
        userService.deleteSelectedUser(uids);
        response.sendRedirect("/findUserByPageServlet");
    }
}

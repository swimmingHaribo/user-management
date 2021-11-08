@WebServlet(name = "findUserByPageServlet", value = "/findUserByPageServlet")
public class FindUserByPageServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
      
        String currentPage = request.getParameter("currentPage"); 
        String rows = request.getParameter("rows"); 
        if (currentPage == null || "".equals(currentPage)){
            currentPage = "1"; 
        }
        if (rows == null || "".equals(rows)){
            rows = "5";
        }
        Map<String, String[]> condition = request.getParameterMap();

        UserService service = new UserServiceImpl();
        PageBean<User> pb = service.findUserByPage(currentPage, rows, condition);

        System.out.println("pb = " + pb);
        request.setAttribute("pb", pb);
        request.setAttribute("condition", condition);     
        request.getRequestDispatcher("/list.jsp").forward(request, response);
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            this.doGet(request, response);
    }
}

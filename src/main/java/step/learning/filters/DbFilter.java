package step.learning.filters;

import com.google.inject.Inject;
import com.google.inject.Singleton;
import com.sun.istack.internal.logging.Logger;
import jdk.nashorn.internal.objects.NativeMath;
import step.learning.services.db.DbProvider;

import javax.servlet.*;
import java.io.IOException;
import java.sql.*;
import java.util.logging.Level;

/**
 * Перевірка можливості підключення до БД, переведення
 * сайту до "статичного" режиму
 */
@Singleton
public class DbFilter  implements Filter {
    private final DbProvider dbProvider ;
    private FilterConfig filterConfig ;

    @Inject
    public DbFilter(DbProvider dbProvider) {
        this.dbProvider = dbProvider;
    }

    public void init(FilterConfig filterConfig) throws ServletException {
        this.filterConfig = filterConfig ;
    }

    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        try {
            Connection connection = dbProvider.getConnection();

            if (connection != null) {
                // Виконуємо запит "SELECT 1"
                PreparedStatement statement = connection.prepareStatement("SELECT 1");
                ResultSet resultSet = statement.executeQuery();

                // обробка результату запиту і виведення його в консоль
                while (resultSet.next()) {
                    int result = resultSet.getInt(1);
                    System.out.println("Result: " + result);
                }
            }

            filterChain.doFilter(servletRequest, servletResponse);
        } catch (SQLException e) {
            // Обробка помилки SQL
            e.printStackTrace();
            servletRequest.setAttribute("pageBody", "error.jsp");
            servletRequest.getRequestDispatcher("WEB-INF/_layout.jsp").forward(servletRequest, servletResponse);
        }
        if( dbProvider.getConnection() == null ) {  // якщо немє підключення
            // то переводимо до сторінки "static.jsp" (незалежно від
            // адреси запиту)

            servletRequest.setAttribute( "pageBody", "static.jsp" ) ;
            servletRequest.getRequestDispatcher( "WEB-INF/_layout.jsp" )
                    .forward( servletRequest, servletResponse ) ;
        }
        else {

            filterChain.doFilter( servletRequest, servletResponse ) ;
        }
    }

    /*
    Для перевірки підключення БД слід виконувати пробні запити
    типу "SELECT 1"
    Реалізувати виконання такого запиту перед прийняттям рішення
    про наявність підключення.
    Встановити Android Studio
     */

    public void destroy() {
        this.filterConfig = null ;
    }
}
/*
Guice - підключення фільтру
1. Описуємо фільтр
2. ! Додаємо анотацію @Singleton (com.google.inject)
3. Додаємо налаштування у ServletConfig
4. Для можливості інжекції оголошуємо конструктор,
   ! з анотацією @Inject
 */

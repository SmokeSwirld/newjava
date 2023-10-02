package step.learning.IOC;

import com.google.inject.servlet.ServletModule;
import step.learning.filters.*;
import step.learning.servlets.*;

public class ServletConfig extends ServletModule {
    @Override
    protected void configureServlets() {
        // Модуль - конфігурація IoC, тут реєструємо фільтри
        filter( "/*" ).through( CharsetFilter.class ) ;
       filter( "/*" ).through( UserAgentFilter.class ) ;
        filter( "/*" ).through( DbFilter.class ) ;

        // ... та сервлети
        serve( "/"       ).with( IndexServlet.class  ) ;
        serve( "/about-jsp"  ).with( AboutjspServlet.class  ) ;
        serve( "/page2"  ).with( AboutServlet.class  ) ;
        serve( "/page3" ).with( FilterServlet.class ) ;
        serve( "/IOC"    ).with( IocServlet.class    ) ;
    }
}

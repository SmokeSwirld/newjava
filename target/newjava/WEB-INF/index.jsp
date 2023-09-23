
<%@ page contentType="text/html;charset=UTF-8" %>
    <h1>Java. Web проектування</h1>
    <h2>Встановлення та налаштування</h2>
    <p>
        Створюємо новий проект. Обираємо Maven Archetype -- webapp, змінюємо
        базовий пакет, задаємо назву проекту. Після створення корегуємо
        /src/main/webapp/index.jsp - додаємо директиву JSP
        <code>
            &lt;%@ page contentType="text/html;charset=UTF-8" language="java" %>
        </code>
    </p>
    <p>
        Налаштовуємо конфігурацію запуску. Необхідно встановити веб-сервер для Java.
        Серед найбільш поширених: Tomcat (8.5), Glassfish (4, 5), JBoss, WildFly, тощо.
        Частіше за все достатньо завантажити архів сервера та розпакувати його
        в окрему папку (без кириличних символів у шляху). <br/>
        Edit Configuration -- + -- Tomcat Local -- Configure -- (.../tomcat) --
        Fix / Deploy -- ...war exploded
        За бажанням змінюємо контекст (адресу сайту) та змінюємо реакцію на перезапуск - оновлення ресурсів
    </p>
    <p>
        Додаємо до залежностей пакет servlet-api
    </p>

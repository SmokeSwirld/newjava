
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<h1>Про сервлети</h1>
<p>
  Сервелти - спеціальні класи, призначені для задач роботи у мережі,
  зокрема, у НТТР. Можна провести аналогію з контроллерами (типу API)
  в ASP.
</p>
<p>
  Сервлети, як класи Java, описуються в окремій папці "java" яку слід додати
  до проєкту (у папку main). У ній створюємо пакети у відповідності до
  даних, вказаних при створенні проєкту (step.learning).
  У цьому пакеті додаємо пакет "servlets", у ньому клас - AboutServlet
</p>
<p>
  Звертаємо увагу на папку WEB-INF. Це папка з налаштуваннями сервера (web.xml),
  і доступ до цієї папки блокується самим сервером (до неї неможна звернутись
  з браузера). Але можна звертатись з java-коду, зокрема, з сервлетів.
  Це використовується як спосіб захисту файлів від прямого звертання і гарантує
  правильний порядок їх проходження через шаблон(и).
</p>
<p>
  У папці WEB-INF створюємо два файли - "_layout.jsp" та "about.jsp"
</p>

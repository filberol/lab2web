<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ru">

<head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="icon" href="img/favicon.ico.svg">
    <link rel="stylesheet" href="style/style.css" />
    <link rel="stylesheet" href="style/night.css" />
    <title>Web Lab#1</title>
</head>

<body>
<!--Header-->
<div class="header">
    <div class="nickname header-block">
        <img class="avatar"
             src="https://sun9-43.userapi.com/s/v1/ig2/OvRRgO1KU9OwBb2mTRp5ywllEQ2peh8jbEOlAmgUqqDWyr3xaVRmu6v8sHpu3rdIg0m8MzluNQzpsXdFIOQn2le-.jpg?size=200x200&quality=95&crop=351,0,1816,1818&ava=1"
             alt="Avatar" />
        <a href="https://t.me/filberol">
            <p>@filberol</p>
        </a>
        <p>Vadim Mikhu</p>
    </div>
    <div class="buttons">
        <ul>
            <li class="header-block">P32301</li>
            <li class="header-block">#310800</li>
        </ul>
        <button class="menu-button header-block">
            <img class="menu-button" src="./img/menu-button.svg" alt="Menu" decoding="async" />
        </button>
    </div>
</div>
<!--Description-->
<div id="description">
    <div class="desc-header">
        <div class="header-block">Выполнил: Миху Вадим Дмитриевич</div>
        <div class="header-block">s339106</div>
        <div class="header-block">P32301</div>
        <div class="header-block">#310800</div>
        <a href="https://github.com/filberol" class="header-block">GitHub</a>
        <button id="night-mode" class="header-block">
            <div id="dragger"></div>
        </button>
    </div>
    <div class="desc-text">
        Разработать веб-приложение на базе сервлетов и JSP, определяющее
        попадание точки на координатной плоскости в заданную область.
        Приложение должно быть реализовано в соответствии с шаблоном
        MVC и состоять из следующих элементов:
    </div>
    <ul>
        <li>
            <b>ControllerServlet</b>, определяющий тип запроса, и, в зависимости
            от того, содержит ли запрос информацию о координатах точки и
            радиусе, делегирующий его обработку одному из перечисленных
            ниже компонентов. Все запросы внутри приложения должны
            передаваться этому сервлету (по методу GET или POST в
            зависимости от варианта задания), остальные сервлеты с
            веб-страниц напрямую вызываться не должны.
        </li>
        <li>
            <b>AreaCheckServlet</b>, осуществляющий проверку попадания точки в область
            на координатной плоскости и формирующий HTML-страницу с результатами
            проверки. Должен обрабатывать все запросы, содержащие сведения о координатах
            точки и радиусе области.
        </li>
        <li>
            <b>Страница JSP</b>, формирующая HTML-страницу с веб-формой. Должна обрабатывать все
            запросы, не содержащие сведений о координатах точки и радиусе области.
        </li>
    </ul>
    <div class="desc-text">
        Разработанная страница JSP должна содержать:
    </div>
    <ul>
        <li>"Шапку", содержащую ФИО студента, номер группы и номер варианта.</li>
        <li>Форму, отправляющую данные на сервер.</li>
        <li>Набор полей для задания координат точки и радиуса области в соответствии с
            вариантом задания.</li>
        <li>Сценарий на языке JavaScript, осуществляющий валидацию значений, вводимых
            пользователем в поля формы.</li>
        <li>Интерактивный элемент, содержащий изображение области на координатной плоскости
            (в соответствии с вариантом задания) и реализующий следующую функциональность:</li>
        <ul>
            <li>
                Если радиус области установлен, клик курсором мыши по изображению должен
                обрабатываться JavaScript-функцией, определяющей координаты точки, по которой
                кликнул пользователь и отправляющей полученные координаты на сервер для
                проверки факта попадания.</li>
            <li>В противном случае, после клика по картинке должно выводиться сообщение о
                невозможности определения координат точки.</li>
            <li>После проверки факта попадания точки в область изображение должно быть обновлено с
                учётом результатов этой проверки (т.е., на нём должна появиться новая точка).</li>
        </ul>
        <li>Таблицу с результатами предыдущих проверок. Список результатов должен браться из контекста
            приложения, HTTP-сессии или Bean-компонента в зависимости от варианта.</li>
    </ul>
    <div class="desc-text">
        Страница, возвращаемая AreaCheckServlet, должна содержать:
    </div>
    <ul>
        <li>Таблицу, содержащую полученные параметры.</li>
        <li>Результат вычислений - факт попадания или непопадания точки в область.</li>
        <li>Ссылку на страницу с веб-формой для формирования нового запроса.</li>
    </ul>
    <div class="desc-text">
        Разработанное веб-приложение необходимо развернуть на сервере WildFly. Сервер
        должен быть запущен в standalone-конфигурации, порты должны быть настроены в
        соответствии с выданным portbase, доступ к http listener'у должен быть открыт для всех IP.
    </div>
</div>
<!--Content-->
<div class="content">
    <div class="target-container">
        <div class="target glass canvas">
            <canvas id="graph" width="300" height="300"></canvas>
        </div>
        <div class="target glass">
            <div class="form">
                <fieldset>
                    <legend class="content-text bordered">Выбор значений</legend>
                    <div class="x-check">
                        <label for="check-4" class="content-text">X</label>
                        <div class="hor-checkbox">
                            <input type="checkbox" id="check-4" name="checkbox" value="-4" class="x-check" />
                            <label for="check-4">-4</label>
                        </div>
                        <div class="hor-checkbox">
                            <input type="checkbox" id="check-3" name="checkbox" value="-3" class="x-check" />
                            <label for="check-3">-3</label>
                        </div>
                        <div class="hor-checkbox">
                            <input type="checkbox" id="check-2" name="checkbox" value="-2" class="x-check" />
                            <label for="check-2">-2</label>
                        </div>
                        <div class="hor-checkbox">
                            <input type="checkbox" id="check-1" name="checkbox" value="-1" class="x-check" />
                            <label for="check-1">-1</label>
                        </div>
                        <div class="hor-checkbox">
                            <input type="checkbox" id="check-0" name="checkbox" value="0" class="x-check" />
                            <label for="check-0">0</label>
                        </div>
                        <div class="hor-checkbox">
                            <input type="checkbox" id="check+1" name="checkbox" value="1" class="x-check" />
                            <label for="check+1">1</label>
                        </div>
                        <div class="hor-checkbox">
                            <input type="checkbox" id="check+2" name="checkbox" value="2" class="x-check" />
                            <label for="check+2">2</label>
                        </div>
                        <div class="hor-checkbox">
                            <input type="checkbox" id="check+3" name="checkbox" value="3" class="x-check" />
                            <label for="check+3">3</label>
                        </div>
                        <div class="hor-checkbox">
                            <input type="checkbox" id="check+4" name="checkbox" value="4" class="x-check" />
                            <label for="check+4">4</label>
                        </div>
                    </div>
                    <div class="y-check">
                        <label for="y-textinput" class="content-text">Y</label>
                        <input id="y-textinput" type="text" name="textarea" autocomplete="off" placeholder="Число от -3 до 3"
                               size="30" />
                    </div>
                    <div class="r-check">
                        <label for="rcheck1" class="content-text">R</label>
                        <div class="hor-radio">
                            <input type="radio" id="rcheck1" name="radio" value="1" class="r-radio" />
                            <label for="rcheck1">1</label>
                        </div>
                        <div class="hor-radio">
                            <input type="radio" id="rcheck2" name="radio" value="2" class="r-radio" />
                            <label for="rcheck2">2</label>
                        </div>
                        <div class="hor-radio">
                            <input type="radio" id="rcheck3" name="radio" value="3" class="r-radio" />
                            <label for="rcheck3">3</label>
                        </div>
                        <div class="hor-radio">
                            <input type="radio" id="rcheck4" name="radio" value="4" class="r-radio" />
                            <label for="rcheck4">4</label>
                        </div>
                        <div class="hor-radio">
                            <input type="radio" id="rcheck5" name="radio" value="5" class="r-radio" />
                            <label for="rcheck5">5</label>
                        </div>
                    </div>
                </fieldset>
                <button id="submit" class="content-text">Проверить</button>
            </div>
        </div>
    </div>
    <div class="table-container">
        <div class="glass">
            <table>
                <tbody>
                <tr>
                    <th colspan="4" class="bordered">Результаты попаданий</th>
                </tr>
                <tr>
                    <td>Координаты</td>
                    <td>Время</td>
                    <td>Исполнение</td>
                    <td>Результат</td>
                </tr>
                </tbody>
            </table>
        </div>
    </div>
</div>
<script src="./js/jquery-3.6.0.js" defer></script>
<script src="./js/cookies.js" defer type="module"></script>
<script src="./js/main.js" defer type="module"></script>
<script src="./js/canvas.js" defer type="module"></script>
</body>

</html>
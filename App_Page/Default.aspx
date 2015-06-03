<%@ Page Title="Main" Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="AppPageDefault" MasterPageFile="MasterPage.master"  %>

<asp:Content runat="server" ContentPlaceHolderID="head">
           
            <!-- Header -->
            <header id="head">
                <div class="container">
                    <div class="row">
                        <h1 class="lead">МИР ТРУД КУРСАЧ</h1>
                      </div>
                </div>
            </header>
            <!-- /Header -->

            <!-- Intro -->
            <div class="container text-center">
                <br>
                <br>
                <h2 class="thin">Разработан с любовью</h2>
                <p class="text">
                    Мы использовали ASP.NET, SQL, Microsoft SQL Server, Bootstrap, JavaScript<br>
                   Надеемся, Вам понравится.
                </p>
            </div>
            <!-- /Intro-->

            <!-- Highlights - jumbotron -->
            <div class="jumbotron top-space">
                <div class="container">

                    <h3 class="text-center thin">Почему мы лучшие?</h3>

                    <div class="row">
                        <div class="col-md-3 col-sm-6 highlight">
                            <div class="h-caption">
                                <h4><i class="fa fa-cogs fa-5"></i>ASP.NET</h4>
                            </div>
                            <div class="h-body text-center">
                                <p>
                                    Надежность и стабильность. <br/>
                                    Высокая производительность и скорость работы. <br/>
                                    Скорость разработки на высшем уровне. <br/>
                                </p>
                            </div>
                        </div>
                        <div class="col-md-3 col-sm-6 highlight">
                            <div class="h-caption">
                                <h4><i class="fa fa-flash fa-5"></i>Microsoft SQL Server</h4>
                            </div>
                            <div class="h-body text-center">
                                <p>
                                    Стабильно. <br/>
                                    Надёжно. <br/>
                                    Производительно. <br/>
                                </p>
                            </div>
                        </div>
                        <div class="col-md-3 col-sm-6 highlight">
                            <div class="h-caption">
                                <h4><i class="fa fa-heart fa-5"></i>Bootstrap</h4>
                            </div>
                            <div class="h-body text-center">
                                <p>
                                    Bootstrap легко и эффективно масштабирует ваш проект с одной базой кода, от телефонов и планшетов до настольных компьютеров.
                                </p>
                            </div>
                        </div>
                        <div class="col-md-3 col-sm-6 highlight">
                            <div class="h-caption">
                                <h4><i class="fa fa-smile-o fa-5"></i>JavaScript</h4>
                            </div>
                            <div class="h-body text-center">
                                <p>
                                     Javascript не требуется компилировать, он подключается к HTML-странице и работает "как есть".
                                </p>
                            </div>
                        </div>
                    </div>
                    <!-- /row  -->

                </div>
            </div>
            <!-- /Highlights -->

            <!-- container -->
            <div class="container">

                <h2 class="text-center top-space">Немного информации</h2>
                <br>

                <div class="row">
                    <div class="col-sm-6">
                        <h3>lambda в массы!</h3>
                        <p>
                            При реализации проекта, а именно при написании динамически формируемых страниц активно использовался механизм lambda-выражения. Lambda-выражение наиболее прямо заменяет анонимный метод, представляет собой блок кода, заключенный в фигурные скобки это — прямая замена анонимных методов. Лямбда-выражения предоставляют еще более сокращенный способ объявлять анонимный метод и не требуют ни кода в фигурных скобках, ни оператора return.
                         </p>
                    </div>
                    <div class="col-sm-6">
                        <h3>Microsoft SQL Server</h3>
                        <p>
                           При написании работы невозможно было обойти необходимость использования реляционной базы данных для хранения информации о пользователях, квестах, этапах и подписках.
При выборе базы данных стоял выбор между базой данных Microsoft SQL Server и Oracle MySQL. Выбор был сделан в пользу решения компании Microsoft, которое является встроенным в среду разработки Microsoft Visual Studio Ultimate решением.

                         </p>
                    </div>
                </div>
                <!-- /row -->

                <div class="row">
                    <div class="col-sm-6">
                        <h3>Util классы</h3>
                        <p>
                            Util-классы применяются для выполнения часто используемых процедур, что делает код чище, упрощает его визуальное восприятие, даёт программисту возможность уделять внимание не мелочам а сконцентрироваться непосредственно над реализацией поставленной задачи. 
                        </p>
                    </div>
                    <div class="col-sm-6">
                        <h3>Преодолевая трудности</h3>
                        <p>
                            При реализации курсвой работы, команда столкнулась с довольно распространённой проблемой в программировании на ASP.NET: отсутствием отклика динамически добавленных элементов управления. Проблема проявлялсь в момент отправки страницы на сервер, в случае, когда пользователь воздействовал на динамически добавленный элемент управления (нажимал на кнопку, например). Сервер принимал страницу, и ряд блоков с проверкой if не давал элементам управления вновь добавиться на странцу, вследствие чего не происходил вызов соответствующих событий нажатия на кнопку. Проблема была решена лишь за счёт продолжительного тестирования кода и упорной работы.
                        </p>
                    </div>
                </div>
                <!-- /row -->

               

            </div>
            <!-- /container -->

           </asp:Content>



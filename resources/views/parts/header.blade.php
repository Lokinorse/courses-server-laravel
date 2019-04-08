<nav class="varilo-nav grey padded">
    <div class="nav-content">

        <div class="logo-row">
            
            
            <a class="navbar-brand" href="{{ url('/') }}">              
                <img class="logo" src="{{ asset('img/logo.png') }}" alt="{{ config('app.name', 'Laravel') }}" />
            </a>

            <button class="mobile-hamb"><i class="fa"></i></button>
        </div>



        <div class="nav-collapse-wrapper">
            <div></div>
            @yield('landing-nav')
            <div class="nav-right-side navbar-list">

                @guest
                    <div class="navbar-list-item">
                        <a class="nav-link" href="{{ url('auth/vkontakte') }}">Войти через VK</a>
                    </div>
                @else
                    @if(Auth::user()->hasRole('admin')) 
                        <div class="navbar-list-item">
                            <a class="nav-link" href="{{ url('admin') }}">
                                Админка
                            </a>
                        </div>
                    @endif
                    <div class="navbar-list-item">
                        <a class="nav-link" href="{{ route('cabinet') }}">
                            <img src={{Auth::user()->avatar}}/>
                            В кабинет
                        </a>
                    </div>
                    <div class="navbar-list-item">
                        <a class="nav-link" href="{{ route('logout') }}"
                           onclick="event.preventDefault(); document.getElementById('logout-form').submit();">
                            Выход
                        </a>
                    </div>
                    <form id="logout-form" action="{{ route('logout') }}" method="POST" style="display: none;">
                        @csrf
                    </form>
                @endguest


            </div>
        </div>






{{--         
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="{{ __('Toggle navigation') }}">
            <span class="navbar-toggler-icon"></span>
        </button>

            <div class="collapse navbar-collapse" id="navbarSupportedContent">

            <ul class="navbar-nav mr-auto">

            </ul>


            <ul class="navbar-nav ml-auto">

                @guest
                    <li class="nav-item">
                        <a class="nav-link" href="{{ route('login') }}">Вход</a>
                    </li>
                    <li class="nav-item">
                        @if (Route::has('register'))
                            <a class="nav-link" href="{{ route('register') }}">Регистрация</a>
                        @endif
                    </li>
                @else
                    <li class="nav-item dropdown">
                        <a id="navbarDropdown" class="nav-link dropdown-toggle" href="#" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" v-pre>
                            {{ Auth::user()->name }} <span class="caret"></span>
                        </a>

                        <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdown">
                            @if(Auth::user()->hasRole('admin')) 
                                <a class="dropdown-item" href="{{ route('admin') }}">
                                    Админка
                                </a>
                            @endif
                            <a class="dropdown-item" href="{{ route('cabinet') }}">
                                Кабинет ученика
                            </a>
                            
                            <a class="dropdown-item" href="{{ route('logout') }}"
                               onclick="event.preventDefault();
                                             document.getElementById('logout-form').submit();">
                                Выход
                            </a>

                            <form id="logout-form" action="{{ route('logout') }}" method="POST" style="display: none;">
                                @csrf
                            </form>
                        </div>
                    </li>
                @endguest
            </ul>
        </div> --}}
    </div>
</nav>



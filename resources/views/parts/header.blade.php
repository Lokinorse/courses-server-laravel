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


    </div>
</nav>



<section class="lp-section matrix-section" id="matrix">

	<canvas id="canvas">ОСВОЙ ПРОФЕССИЮ «JAVASCRIPT-РАЗРАБОТЧИК»</canvas>


	<div class="lp-utp-action-wrapper">
		<img class="js-icon" src="{{ asset('img/jslp/js.png') }}" alt="Профессия: JAVASCRIPT-РАЗРАБОТЧИК" />
		<h1>ОСВОЙ ПРОФЕССИЮ <br/> «JAVASCRIPT-РАЗРАБОТЧИК»</h1>
		<a class="lp-cta-button conversion" data-conversion="more" href="/#advantages"><img src="{{ asset('img/jslp/double-down.png') }}"/> Подробнее</a>
	</div>
	<script type="text/javascript">

		function randomInteger(min, max) {
			var rand = min - 0.5 + Math.random() * (max - min + 1)
			rand = Math.round(rand);
			return rand;
		}

	

		var symbols = "かきてとふへりるぜぞどぶべぷ".toUpperCase().split("");

		//some chinese symbols
		for (var i = 1; i <= 14; i++) {
			symbols.push(String.fromCharCode(3e9+i))
		}


		var utp_text = ["ОСВОЙ ПРОФЕССИЮ JAVASCRIPT-РАЗРАБОТЧИК!"];

		var charsActivated = [];

		var s = window;
		var width = s.innerWidth;
		var height = s.innerHeight - 55;


		var columns = 56;
		if (width < 1025) {
			columns = 45;
		}
		if (width < 769) {
			columns = 40;
		}



		var font_size = Math.round(width/columns);


		var clone_text = Object.assign([], utp_text);


		var sentence = clone_text.sort(function (a, b) { return b.length - a.length; })[0];



	
		function start(q) {
			//var s = window.screen;

			var canvas = document.getElementById("canvas");

			canvas.width = width;
			canvas.height = height;

			var context = canvas.getContext('2d')

			var letters = Array(Math.round(width/(font_size))+3).join(1).split('');

			for (var i = 0; i <= 800; i++) {
				letters.map(function(y_pos, index){
				  letters[index] = (y_pos > height + Math.random() * 1e4) ? 0 : y_pos + font_size;
				});
			}


			var draw = function () {

				context.shadowColor = '#6473cd';
				context.shadowOffsetX = 0;
				context.shadowOffsetY = 0;
				//context.shadowBlur = 5;
				context.fillStyle='rgba(27, 36, 97,.2)';
				context.fillRect(0,0,width,height);
				context.fillStyle='#6473cd';
				context.font        = "normal "+font_size+"px Lucida Console";

				letters.map(function(y_pos, index){
				  text = symbols[randomInteger(0, symbols.length-1)];
				  x_pos = index * font_size;
				  context.fillText(text, x_pos, y_pos);
				  letters[index] = (y_pos > height + Math.random() * 1e4) ? 0 : y_pos + font_size;
				});

			};
			setInterval(draw, 60);
		}
		

		start(canvas);
	
	</script>

</section>
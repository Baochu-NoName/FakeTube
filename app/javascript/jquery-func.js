
$(function(){
	
	$(".movie-image").hover(function(){
		$(this).find(".play").show();
		$(this).find(".play-img").show();
	},
	function()
	{
		$(this).find(".play").hide();
		$(this).find(".play-img").hide();
	});

	$(".blink").focus(function() {
            if(this.title==this.value) {
                this.value = '';
            }
        })
        .blur(function(){
            if(this.value=='') {
                this.value = this.title;                    
			}
		});
});

// Carousel
$(function (){
    var max_items = 12;
    var item = 2;
    $(".prev-wrapper").on("click", (e)=>{
        e.preventDefault();
        if(item > 1 ){
            $(".latest-update-wrapper").animate({ scrollLeft: 
                "-=" + $("#movie_" + item).position().left }, "slow");
            item--;
        }
    });
    $(".next-wrapper").on("click", (e)=>{
        e.preventDefault();
        if(item < max_items - 2 ){
            $(".latest-update-wrapper").animate({ scrollLeft: 
                "+=" + $("#movie_" + item).position().left }, "slow");
            item++;
        }
    });
});

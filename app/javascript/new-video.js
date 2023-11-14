$(function() {
    $('.category-select2').select2({
        theme: "classic",
        width: "resolve"
    });
   function showImage(input){
    if(input.files && input.files[0]){
      var reader = new FileReader();
      reader.onload = function (e) {
        $('#video_thumbnail_preview')
          .attr('src', e.target.result)
          .width(150)
          .height(200);
      };
      reader.readAsDataURL(input.files[0])
    }
   }
   $("#video_thumbnail").on("change", function(){
      showImage(this);
   });
});
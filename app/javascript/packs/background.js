$(':checkbox').on('change',function(){
    $(document).on('change', 'backgroundChange', function(){
      if(this.checked) {
        $('#backgroundChange').addClass("bg-dark"); 
        $('#backgroundChange').addClass("text-white"); 
      }
      else {
        $('#backgroundChange').removeClass("bg-dark"); 
        $('#backgroundChange').removeClass("text-white"); 
      }
    });
 });

// $(document).ready(function(){
//   $("#img-thumbnail").mouseenter(function(){
//     if($(this).show()){
//       $(this).hide();
//       $("#video-clip").show();
//     }else{
//       $(this).show();
//       $("#video-clip").hide();
//     }
//   });
// });

  //  var checkbox = document.querySelector('input[type="checkbox"]');
  //   var background = document.getElementById("backgroundChange");
  //   checkbox.addEventListener('change', function () {
  //     if (checkbox.checked) {

  //       background.classList.add("bg-dark"); 
  //       background.classList.add("text-white"); 
  //     } else {
  //       // do that
  //       background.classList.remove("bg-dark");
  //       background.classList.remove("text-white"); 
  //     }
  // });
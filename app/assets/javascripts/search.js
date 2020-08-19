$(function() {
  $(".search-input").on("keyup", function() {
    var input = $(".search-input").val();
    $.ajax({
      type: 'GET',
      url: '/posts/search',
      data: { keyword: input },
      dataType: 'json'
    })
    .done(function(posts) {
      $(".contents.row").empty();
      if (posts.length !== 0) {
        posts.forEach(function(post){
          appendPost(post);
        });
      }
      else {
        appendErrMsgToHTML("一致するツイートがありません");
      }
    })
  });
});
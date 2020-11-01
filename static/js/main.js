$(function () {
  // register changeTheme function on navbar dropdown anchors
  $(".dropdown-menu a").click(function (e) {
    changeTheme($(this).text().toLowerCase());
  });

  // hide all content div (default)
  $(".content").hide();

  // toggle active content
  $(".content.active").toggle();

  // register accordion toggle functions
  $(".accordion").click(function (e) {
    $(this).next(".content").toggle();
  });
});

function changeTheme(theme) {
  $("#theme").attr("href", "./css/aafu_" + theme + ".css")
  $('#navbarDropdown').text(theme);
}

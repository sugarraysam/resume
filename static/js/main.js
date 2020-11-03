$(function () {
  // register changeTheme function on navbar dropdown anchors
  $(".dropdown-menu a").click(function (e) {
    changeTheme($(this).text().toLowerCase());
  });

  // hide all content div (default) && add left indentation
  $(".content").hide().addClass("pl-2");

  // toggle active content
  $(".content.active").toggle();

  // register accordion toggle functions
  $(".accordion").click(function (e) {
    $(this).next(".content").toggle();
  });
});

function changeTheme(theme) {
  $("#theme").attr("href", "./css/aafu_" + theme + ".css")
  $('#themeDropdown').text(theme);
}

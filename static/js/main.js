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

  $("#pdfButton").click(function (e) {
    e.preventDefault();
    theme = $('#themeDropdown').text().trim();
    console.log(theme);
    window.location.href = "/pdf/resume_" + theme + ".pdf"
  })
});

function changeTheme(theme) {
  $("#theme").attr("href", "./css/aafu_" + theme + ".css")
  $('#themeDropdown').text(theme);
}

function prepareToPrintPDF() {
  $(".btn-primary").toggle();
  $(".content").show();
  $(".send-to-footer").appendTo("#footer");
  $(".github-button-wrapper").hide();
}

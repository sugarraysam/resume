# Resume [![Build Status](https://travis-ci.com/sugarraysam/resume.svg?branch=master)](https://travis-ci.com/sugarraysam/resume)

Generate my resume using:
- [Hugo](https://gohugo.io/)
- [jQuery](https://jquery.com/)
- [Bootstrap](https://getbootstrap.com/)
- [Font Awesome](https://fontawesome.com/)

I started off from the Hugo [Aafu theme](https://themes.gohugo.io/aafu/) but moved the data to the `data/` directory, and changed the whole styling and templating logic. It deploys to [Github Pages](https://gohugo.io/hosting-and-deployment/hosting-on-github/) automatically using Travis CI.

# PDF version

I coded a javascript helper function `prepareToPrintPDF()` that styles the HTML so it will print nicely as a PDF. I tried using `wkhtmltopdf` but was not happy with the result. So what I do is:
1. `$ make dev` (runs hugo server)
2. Open `http://localhost:1313` in Chromium Browser
3. Pull-up the js console and type `prepareToPrintPDF()`
4. Save the pdf for each theme color version `light, dark & pink`

```js
function prepareToPrintPDF() {
  $(".btn-primary").toggle();
  $(".content").show();
  $(".send-to-footer").appendTo("#footer");
  $(".github-button-wrapper").hide();
}
```

# CI/CD

Thanks to this [blog post](https://cjolowicz.github.io/posts/hosting-a-hugo-blog-on-github-pages-with-travis-ci/)

Travis also has a [Github Pages deployment](https://docs.travis-ci.com/user/deployment/pages/) integration, but it requires generating an oAuth token for your main Github account. It is more appealing to use the bot technique as mentioned in the blog post.

# Live website

[https://sugarraysam.github.io](https://sugarraysam.github.io)

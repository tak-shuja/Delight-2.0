<template>
  <div class="not-found-container">
    <h3>OOPS! PAGE NOT FOUND</h3>
    <div class="not-found-container1">
      <h1 class="not-found-text1">404</h1>
    </div>
    <div class="not-found-container2">
      <h2 class="not-found-text2">
        WE ARE SORRY, BUT THE PAGE YOU REQUESTED WAS NOT FOUND
      </h2>
    </div>
  </div>
</template>

<style scoped>
html {
  line-height: 1.15;
  scroll-behavior: smooth;
}
body {
  margin: 0;
}
* {
  box-sizing: border-box;
  border-width: 0;
  border-style: solid;
}
p,
li,
ul,
pre,
div,
h1,
h2,
h3,
h4,
h5,
h6,
figure,
blockquote,
figcaption {
  margin: 0;
  padding: 0;
}
button {
  background-color: transparent;
}
button,
input,
optgroup,
select,
textarea {
  font-family: inherit;
  font-size: 100%;
  line-height: 1.15;
  margin: 0;
}
button,
select {
  text-transform: none;
}
button,
[type="button"],
[type="reset"],
[type="submit"] {
  -webkit-appearance: button;
}
button::-moz-focus-inner,
[type="button"]::-moz-focus-inner,
[type="reset"]::-moz-focus-inner,
[type="submit"]::-moz-focus-inner {
  border-style: none;
  padding: 0;
}
button:-moz-focus,
[type="button"]:-moz-focus,
[type="reset"]:-moz-focus,
[type="submit"]:-moz-focus {
  outline: 1px dotted ButtonText;
}
a {
  color: inherit;
  text-decoration: inherit;
}
input {
  padding: 2px 4px;
}
img {
  display: block;
}
html {
  scroll-behavior: smooth;
}
html {
  font-family: Inter;
  font-size: 16px;
}

body {
  font-weight: 400;
  font-style: normal;
  text-decoration: none;
  text-transform: none;
  letter-spacing: normal;
  line-height: 1.15;
  color: var(--dl-color-gray-black);
  background-color: var(--dl-color-gray-white);
}

.not-found-container {
  width: 100%;
  display: flex;
  overflow: auto;
  min-height: 100vh;
  align-items: center;
  flex-direction: column;
  justify-content: center;
}
.not-found-container1 {
  display: flex;
  position: relative;
  align-items: center;
  flex-direction: column;
  justify-content: center;
}
.not-found-text1 {
  color: rgb(38, 38, 38);
  font-size: 252px;
  margin-top: -20px;
  font-weight: 900;
  margin-bottom: -20px;
  letter-spacing: -20px;
}
.not-found-container2 {
  width: 421px;
  display: flex;
  align-items: center;
  flex-direction: column;
  justify-content: center;
}
.not-found-text2 {
  text-align: center;
  font-weight: 400;
}
</style>

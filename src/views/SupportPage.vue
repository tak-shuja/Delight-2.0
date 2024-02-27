<template>
  <div>
    <h1>Contact Us</h1>
    <p>
      <a class="fa fa-phone" href="tel:+917006621040"> +91 70066 21040 </a>

      <i class="fa-regular fa-envelope"></i>
      <a class="fa fa-sharp fa-envelope" href="tel:+917006621040">
        +91 95962 69992
      </a>

      <a href="https://www.instagram.com/delightdeheaven">
        <i class="fa fa-instagram"></i>Instagram</a
      >
    </p>
  </div>
  <div>
    <p></p>
  </div>
</template>
<script>
export default {};
</script>
<style scoped>
div {
  margin: auto;
  text-align: start;
  width: 100%;
  padding: auto;
  display: flex;
  height: calc(100vh);
  justify-content: center;
  align-items: center;
  flex-direction: column;
}

h1 {
  letter-spacing: 1px;
  filter: drop-shadow(1px 1px 5px grey);
  box-shadow: 1px 1px 5px 1px black;
  border-radius: 8px;
}
p {
  display: flex;
  flex-direction: column;
  justify-content: space-evenly;
  align-items: center;
  font-size: 20px;
  gap: 10px;
}

p a {
  border: 1px solid;
  padding: 5px;
  border-radius: 8px;
  filter: drop-shadow(4px 4px 5px gray);
  box-shadow: 1px 1px 5px black;
}

a:hover {
  scale: 1.02;
  color: black;
  transition: all 0.1s ease;
  display: flex;
  flex-direction: row;
  justify-content: center;
  align-items: center;
}

a:visited {
  color: black;
}

.fa-instagram {
  font-size: 30px;
  border: none;
  background: linear-gradient(to top right, #f9ce34, #ee2a7b, #6228d7);
  color: transparent;
  mix-blend-mode: screen;
  background-clip: text;
}
</style>

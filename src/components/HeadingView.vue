<template>
  <div class="heading">
    <div class="heading-text">
      The best place to buy top quality dry fruits for a healthy lifestyle
      <div class="sub-heading">
        <button>
          <router-link :to="{ name: 'products' }">Get Started</router-link>
          <!-- Get Started -->
        </button>
        <!-- <Button>Learn More...</Button> -->
      </div>
    </div>

    <img src="/assets/logo-big-cropped.jpeg" alt="" class="logo-big" />
  </div>
</template>

<style>
.heading {
  font-size: 2.5rem;
  display: flex;
  flex-direction: row;
  justify-content: space-around;
  margin: 50px 50px;
  justify-content: center;
  align-items: center;
  font-family: "Allura", cursive;
  font-family: "Merienda", cursive;
  gap: 20px;
  widows: 95;
}

.sub-heading {
  display: flex;
  flex-direction: row;
  /* gap: 50px; */
  justify-content: space-evenly;
  align-items: center;
  margin: 40px 0;
}

.sub-heading * {
  border: none;
  border-radius: 42px;
  padding: 12px 18px;
  /* border: 1px solid rgb(49, 3, 3); */
  font-weight: bold;
  font-size: 18px;
  cursor: pointer;
}

.sub-heading *:hover {
  scale: 1.02;
  transition: all 0.1s;
  color: white;
}

.sub-heading * {
  /* background-color: navy; */
  /* background: rgb(49, 3, 3); */
  background-color: #556b2f;
  color: white;
}

/* .sub-heading :last-child {
  background: transparent;
} */

.logo-big {
  height: 400px;
  border-radius: 50%;
}

@media only screen and (max-width: 768px) {
  .heading {
    flex-direction: column-reverse;
    margin: 50px 0;
  }

  .sub-heading * {
    font-size: 14px;
  }

  .heading-text {
    padding: 0 5px;
    font-size: 1.5rem;
    font-family: "Allura", cursive;
    font-family: "Merienda", cursive;
  }

  .logo-big {
    height: 200px;
  }
}
</style>

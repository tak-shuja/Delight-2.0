<template>
  <div>
    <div class="product-card-container" v-if="itemLoaded">
      <div class="product-card-container03">
        <div class="product-card-container04">
          <span class="product-card-text">{{ productName }}</span>
        </div>
        <div class="product-card-container05">
          <div class="product-card-container06">
            <a
              href="https://example.com"
              target="_blank"
              rel="noreferrer noopener"
            >
              Almond
            </a>
            <a
              href="https://example.com"
              target="_blank"
              rel="noreferrer noopener"
              class="product-card-link1"
            >
              Cashews
            </a>
            <a
              href="https://example.com"
              target="_blank"
              rel="noreferrer noopener"
              class="product-card-link2"
            >
              Pistachios
            </a>
            <a
              href="https://example.com"
              target="_blank"
              rel="noreferrer noopener"
              class="product-card-link3"
            >
              Walnuts
            </a>
            <a
              href="https://example.com"
              target="_blank"
              rel="noreferrer noopener"
              class="product-card-link4"
            >
              Hazelnuts
            </a>
          </div>
        </div>
        <div class="product-card-container07" @click="$router.back()">
          <svg viewBox="0 0 1024 1024" class="product-card-icon14">
            <path
              d="M854 470v84h-520l238 240-60 60-342-342 342-342 60 60-238 240h520z"
            ></path>
          </svg>
          <!-- <a
            href="https://example.com"
            target="_blank"
            rel="noreferrer noopener"
          > -->
          Go Back
          <!-- </a> -->
        </div>
        <div class="product-card-container08">
          <div class="product-card-container09">
            <div class="product-card-container10">
              <!-- <div class="product-card-container11">
                <img
                  alt="image"
                  src="public/_a3df016f-a218-4bdb-b188-755534fbf5af-300w.jpg"
                  class="product-card-image1"
                />
              </div> -->
              <!-- <div class="product-card-container12">
                <img
                  alt="image"
                  src="public/_92c783d7-c962-416a-be1f-7930628185ec-300w.jpg"
                  class="product-card-image2"
                />
              </div> -->

              <div class="product-card-container12" v-for="image in images">
                <img
                  alt="image"
                  :src="imageUrl + image"
                  class="product-card-image2"
                  @click="changeActiveImage(image)"
                />
              </div>

              <!-- <div class="product-card-container13">
                <img
                  alt="image"
                  src="public/_230a6a52-bb4c-4906-bdef-1f29b49e58cb-700w.jpg"
                  class="product-card-image3"
                />
              </div> -->
            </div>
            <div class="product-card-container14">
              <img
                alt="imagejsad"
                :src="imageUrl + selectedImage"
                class="product-card-image4"
              />
            </div>
          </div>
          <div class="product-card-container15">
            <div class="product-card-container16">
              <h1>
                <span>{{ productName }}</span>
                <br />
              </h1>
              <div class="product-card-container17">
                <svg viewBox="0 0 1024 1024" class="product-card-icon16">
                  <path
                    d="M768 686q52 0 88 37t36 87q0 52-37 89t-87 37-87-37-37-89q0-20 2-28l-302-176q-38 34-88 34-52 0-90-38t-38-90 38-90 90-38q50 0 88 34l300-174q-4-20-4-30 0-52 38-90t90-38 90 38 38 90-38 90-90 38q-48 0-88-36l-300 176q4 20 4 30t-4 30l304 176q36-32 84-32z"
                  ></path>
                </svg>
                <svg viewBox="0 0 1024 1024" class="product-card-icon18">
                  <path
                    d="M475.648 186.624c3.115-5.248 7.893-10.325 14.251-14.165 10.069-6.101 21.589-7.595 32.256-4.949s20.224 9.216 26.197 19.115l361.216 603.008c3.285 5.589 5.461 12.715 5.547 20.565 0.128 11.776-4.48 22.443-12.16 30.293s-18.261 12.715-29.568 12.843h-722.645c-6.485-0.043-13.696-1.749-20.523-5.717-10.197-5.888-17.024-15.317-19.883-25.899s-1.621-22.144 3.925-31.787zM402.432 142.763l-361.387 603.307c-18.005 31.189-21.589 66.133-13.141 97.707s29.013 60.075 59.648 77.739c19.797 11.435 41.643 17.067 62.933 17.152h722.901c35.797-0.384 67.712-15.104 90.581-38.485s36.864-55.595 36.48-90.923c-0.256-22.869-6.528-44.544-17.323-62.891l-361.557-603.605c-18.432-30.421-47.36-50.389-79.104-58.155s-66.603-3.456-96.811 14.891c-18.304 11.093-33.067 26.24-43.179 43.264zM469.333 384v170.667c0 23.552 19.115 42.667 42.667 42.667s42.667-19.115 42.667-42.667v-170.667c0-23.552-19.115-42.667-42.667-42.667s-42.667 19.115-42.667 42.667zM554.667 725.333c0-23.552-19.115-42.667-42.667-42.667s-42.667 19.115-42.667 42.667 19.115 42.667 42.667 42.667 42.667-19.115 42.667-42.667z"
                  ></path>
                </svg>
              </div>
            </div>
            <div class="product-card-container18">
              <div class="product-card-container19">
                <label class="product-card-label">
                  Rating:&nbsp; 4.5&nbsp;
                </label>
              </div>
              <div class="product-card-container20">
                <svg viewBox="0 0 1024 1024" class="product-card-icon20">
                  <path
                    d="M512 736l-264 160 70-300-232-202 306-26 120-282 120 282 306 26-232 202 70 300z"
                  ></path>
                </svg>
                <svg viewBox="0 0 1024 1024" class="product-card-icon22">
                  <path
                    d="M512 736l-264 160 70-300-232-202 306-26 120-282 120 282 306 26-232 202 70 300z"
                  ></path>
                </svg>
                <svg viewBox="0 0 1024 1024" class="product-card-icon24">
                  <path
                    d="M512 736l-264 160 70-300-232-202 306-26 120-282 120 282 306 26-232 202 70 300z"
                  ></path>
                </svg>
                <svg viewBox="0 0 1024 1024" class="product-card-icon26">
                  <path
                    d="M512 736l-264 160 70-300-232-202 306-26 120-282 120 282 306 26-232 202 70 300z"
                  ></path>
                </svg>
                <svg viewBox="0 0 1024 1024" class="product-card-icon28">
                  <path
                    d="M512 658l160 96-42-182 142-124-188-16-72-172v398zM938 394l-232 202 70 300-264-160-264 160 70-300-232-202 306-26 120-282 120 282z"
                  ></path>
                </svg>
              </div>
            </div>
            <div class="product-card-container21">
              <span class="product-card-text04">
                <span class="product-card-text05">
                  <!-- Add a touch of luxury and flavour to your dishes with our
                  premium quality saffron. Sourced from the finest saffron
                  crocuses, our saffron threads are hand-picked and dried to
                  preserve their natural colour and aroma. -->
                  {{ productDesc }}
                </span>
                <br />
              </span>
            </div>
            <div class="product-card-container22">
              <label class="product-card-text07">Size : 500g</label>
            </div>
            <div class="product-card-container23">
              <div class="product-card-container24">
                <label class="product-card-text08"
                  >Price : ${{ productPrice }}</label
                >
              </div>
              <div class="product-card-container25">
                <label class="product-card-text09">-50%&nbsp;</label>
                <label class="product-card-text10">$60</label>
              </div>
            </div>
            <div class="product-card-container26">
              <button type="submit" class="product-card-button button">
                Add To Cart
              </button>
              <button type="button" class="product-card-button1 button">
                Buy Now
              </button>
            </div>
          </div>
        </div>
      </div>
      <!-- <FooterView /> -->
    </div>
    <div v-else>
      <h1>Loading...</h1>
    </div>
  </div>
</template>

<script>
import FooterView from "./FooterView.vue";
export default {
  components: {
    FooterView,
  },
  data() {
    return {
      productName: "",
      productPrice: "",
      productDesc: "",
      images: [],
      selectedImage: null,
      imageUrl: "http://delightheaven.in/../Old/Upload%20Data/",
      itemLoaded: false,
    };
  },
  mounted() {
    this.productName = this.$route.query.id;
    console.log(this.productName);
    fetch(
      `https://delightheaven.in/../Old/src/php/get.php?product=${this.productName}`
    )
      .then((resp) => {
        return resp.json();
        // console.log(resp);
      })
      .then((data) => {
        // console.log(data);
        this.itemLoaded = true;
        this.productName = data.name;
        this.productPrice = data.price;
        this.productDesc = "";                               //data.desc;
        this.images = JSON.parse(data.path);
        // console.log(this.images);
        this.selectedImage = this.images[0];
      })
      .catch((error) => alert(error));
  },
  methods: {
    changeActiveImage(image) {
      this.selectedImage = image;
    },
  },
};
</script>

<style>
.product-card-container {
  width: 100%;
  display: flex;
  overflow: auto;
  min-height: 100vh;
  align-items: center;
  flex-direction: column;
}
.product-card-navbar-interactive {
  width: 100%;
  height: 80px;
  display: flex;
  max-width: var(--dl-size-size-maxwidth);
  align-self: center;
  box-shadow: 2px 4px 9px 2px rgba(16, 1, 1, 0.27);
  align-items: center;
  padding-top: var(--dl-space-space-oneandhalfunits);
  border-color: var(--dl-color-gray-white);
  border-width: 1px;
  padding-left: var(--dl-space-space-threeunits);
  padding-right: var(--dl-space-space-threeunits);
  padding-bottom: var(--dl-space-space-oneandhalfunits);
  justify-content: flex-start;
  background-color: var(--dl-color-gray-white);
}
.product-card-container01 {
  width: 60px;
  height: 39px;
  display: flex;
  align-items: center;
  border-radius: var(--dl-radius-radius-radius4);
  justify-content: center;
  border-top-left-radius: var(--dl-radius-radius-round);
  border-top-right-radius: var(--dl-radius-radius-round);
  border-bottom-left-radius: var(--dl-radius-radius-round);
  border-bottom-right-radius: var(--dl-radius-radius-round);
}
.product-card-image {
  width: 92px;
  height: 81px;
  object-fit: cover;
  border-radius: var(--dl-radius-radius-radius4);
  border-top-left-radius: var(--dl-radius-radius-round);
  border-top-right-radius: var(--dl-radius-radius-round);
  border-bottom-left-radius: var(--dl-radius-radius-round);
  border-bottom-right-radius: var(--dl-radius-radius-round);
}
.product-card-desktop-menu {
  flex: 1;
  display: flex;
  justify-content: space-between;
}
.product-card-container02 {
  flex: 0 0 auto;
  width: 721px;
  height: auto;
  display: flex;
  align-items: space-between;
  flex-direction: column;
}
.product-card-links {
  flex: 1;
  width: 739px;
  height: 49px;
  display: flex;
  align-items: center;
  flex-direction: row;
  justify-content: center;
}
.product-card-nav1 {
  transition: 0.3s;
}
.product-card-nav1:hover {
  color: #3d6e70ff;
}
.product-card-nav2 {
  transition: 0.3s;
  margin-left: var(--dl-space-space-twounits);
}
.product-card-nav2:hover {
  color: #3d6e70ff;
}
.product-card-nav3 {
  transition: 0.3s;
  margin-left: var(--dl-space-space-twounits);
}
.product-card-nav3:hover {
  color: #3d6e70ff;
}
.product-card-nav4 {
  transition: 0.3s;
  margin-left: var(--dl-space-space-twounits);
}
.product-card-nav4:hover {
  color: #3d6e70ff;
}
.product-card-nav5 {
  transition: 0.3s;
  margin-left: var(--dl-space-space-twounits);
}
.product-card-nav5:hover {
  color: #3d6e70ff;
}
.product-card-icon {
  width: 51px;
  height: 37px;
}
.product-card-icon02 {
  width: 47px;
  height: 38px;
  margin-right: 8px;
}
.product-card-buttons {
  display: flex;
  flex-direction: row;
  justify-content: space-between;
}
.product-card-login {
  transition: 0.3s;
  border-color: var(--dl-color-primary1-blue100);
  border-width: 1px;
  margin-right: var(--dl-space-space-twounits);
  padding-left: 1.5rem;
  border-radius: 45px;
  padding-right: 1.5rem;
}

.product-card-register {
  color: var(--dl-color-gray-white);
  transition: 0.3s;
  font-weight: bold;
  border-color: var(--dl-color-primary1-blue100);
  padding-left: 1.5rem;
  border-radius: 45px;
  padding-right: 1.5rem;
  background-color: var(--dl-color-primary1-blue100);
}

.product-card-burger-menu {
  display: none;
}
.product-card-icon04 {
  width: var(--dl-size-size-xsmall);
  cursor: pointer;
  height: var(--dl-size-size-xsmall);
}
.product-card-mobile-menu {
  top: 0px;
  left: 0px;
  width: 100%;
  height: 100vh;
  display: none;
  padding: 32px;
  z-index: 100;
  position: absolute;
  border-radius: 50px;
  flex-direction: column;
  justify-content: space-between;
  background-color: var(--dl-color-gray-white);
}
.product-card-nav {
  display: flex;
  align-items: flex-start;
  flex-direction: column;
}
.product-card-top {
  width: 100%;
  display: flex;
  align-items: center;
  margin-bottom: var(--dl-space-space-threeunits);
  justify-content: space-between;
}
.product-card-logo {
  font-size: 2em;
  font-weight: bold;
}
.product-card-close-menu {
  display: flex;
  align-items: center;
  justify-content: center;
}
.product-card-icon06 {
  fill: var(--dl-color-gray-900);
  width: var(--dl-size-size-xsmall);
  cursor: pointer;
  height: var(--dl-size-size-xsmall);
}
.product-card-links1 {
  flex: 0 0 auto;
  display: flex;
  align-self: flex-start;
  align-items: flex-start;
  flex-direction: column;
}
.product-card-nav11 {
  color: var(--dl-color-gray-black);
  margin-bottom: var(--dl-space-space-unit);
}
.product-card-nav21 {
  color: var(--dl-color-gray-black);
  margin-bottom: var(--dl-space-space-unit);
}
.product-card-nav31 {
  color: var(--dl-color-gray-black);
  margin-bottom: var(--dl-space-space-unit);
}
.product-card-nav41 {
  color: var(--dl-color-gray-black);
  margin-bottom: var(--dl-space-space-unit);
}
.product-card-nav51 {
  color: var(--dl-color-gray-black);
  margin-bottom: var(--dl-space-space-unit);
}
.product-card-buttons1 {
  display: flex;
  margin-top: var(--dl-space-space-unit);
  align-items: center;
  flex-direction: row;
  justify-content: space-between;
}
.product-card-login1 {
  border-color: var(--dl-color-primary1-blue100);
  border-width: 1px;
  margin-right: var(--dl-space-space-twounits);
  padding-left: 1.5rem;
  border-radius: 30px;
  padding-right: 1.5rem;
}
.product-card-register1 {
  color: var(--dl-color-gray-white);
  transition: 0.3s;
  border-color: var(--dl-color-primary1-blue100);
  border-width: 1px;
  padding-left: 1.5rem;
  border-radius: 30px;
  padding-right: 1.5rem;
  background-color: var(--dl-color-primary1-blue100);
}
.product-card-register1:hover {
  border-color: #849492ff;
  background-color: #849492ff;
}
.product-card-icon08 {
  width: var(--dl-size-size-xsmall);
  height: var(--dl-size-size-xsmall);
  margin-right: var(--dl-space-space-twounits);
}
.product-card-icon10 {
  width: var(--dl-size-size-xsmall);
  height: var(--dl-size-size-xsmall);
  margin-right: var(--dl-space-space-twounits);
}
.product-card-icon12 {
  width: var(--dl-size-size-xsmall);
  height: var(--dl-size-size-xsmall);
}
.product-card-container03 {
  width: 100%;
  height: 821px;
  display: flex;
  margin-top: 40px;
  align-items: flex-start;
  flex-direction: column;
}
.product-card-container04 {
  width: 100%;
  height: 62px;
  display: flex;
  position: relative;
  align-self: center;
  align-items: flex-start;
  margin-left: 0px;
  margin-right: 0px;
  flex-direction: column;
  justify-content: center;
}
.product-card-text {
  font-size: 30px;
  padding-left: 40px;
}
.product-card-container05 {
  width: 1180px;
  height: 40px;
  display: flex;
  margin-top: 30px;
  align-items: center;
  flex-direction: column;
  justify-content: center;
}
.product-card-container06 {
  gap: var(--dl-space-space-twounits);
  width: 1044px;
  height: 26px;
  display: flex;
  align-self: flex-start;
  align-items: center;
  margin-left: 40px;
  flex-direction: row;
  justify-content: flex-start;
}
.product-card-link1 {
  margin-left: 30px;
  margin-right: 0px;
}
.product-card-link2 {
  margin-left: 30px;
}
.product-card-link3 {
  margin-left: 30px;
}
.product-card-link4 {
  margin-left: 30px;
}
.product-card-container07 {
  gap: var(--dl-space-space-halfunit);
  flex: 0 0 auto;
  width: 200px;
  display: flex;
  margin-top: 20px;
  align-items: flex-start;
  margin-left: 40px;
  margin-right: 40px;
  margin-bottom: 20px;
  flex-direction: row;
  justify-content: flex-start;
}
.product-card-icon14 {
  width: 24px;
  height: 24px;
}
.product-card-container08 {
  flex: 0 0 auto;
  width: 1149px;
  display: flex;
  position: relative;
  align-items: center;
  justify-content: flex-start;
}
.product-card-container09 {
  width: 666px;
  height: 400px;
  display: flex;
  align-items: center;
  margin-left: 40px;
  flex-direction: row;
}
.product-card-container10 {
  gap: 4px;
  width: 256px;
  height: 100%;
  display: flex;
  align-self: center;
  align-items: center;
  flex-direction: column;
  justify-content: center;
}
.product-card-container11 {
  width: 236px;
  height: 124px;
  display: flex;
  align-self: center;
  align-items: flex-start;
  border-radius: 20px;
  margin-bottom: 4px;
  flex-direction: column;
  justify-content: flex-start;
}
.product-card-image1 {
  width: 100%;
  height: 100%;
  object-fit: cover;
  border-radius: 20px;
}
.product-card-container12 {
  width: 236px;
  height: 118px;
  display: flex;
  align-self: center;
  align-items: flex-start;
  border-radius: 20px;
  margin-bottom: 4px;
  flex-direction: column;
}
.product-card-image2 {
  width: 100%;
  height: 100%;
  object-fit: cover;
  border-radius: 20px;
}
.product-card-container13 {
  width: 236px;
  height: 132px;
  display: flex;
  align-self: center;
  align-items: flex-start;
  border-radius: 20px;
  margin-bottom: 4px;
  flex-direction: column;
}
.product-card-image3 {
  width: 100%;
  height: 100%;
  object-fit: cover;
  border-radius: 20px;
}
.product-card-container14 {
  width: 398px;
  height: 100%;
  display: flex;
  align-items: flex-start;
  border-radius: 20px;
  flex-direction: column;
}
.product-card-image4 {
  width: 100%;
  height: 397px;
  object-fit: cover;
  border-radius: 20px;
}
.product-card-container15 {
  flex: 0 0 auto;
  width: 451px;
  height: 394px;
  display: flex;
  align-items: flex-start;
  padding-left: 20px;
  padding-right: 20px;
  flex-direction: column;
}
.product-card-container16 {
  gap: 30px;
  width: 100%;
  height: 40px;
  display: flex;
  position: relative;
  align-items: center;
  margin-bottom: 0px;
}
.product-card-container17 {
  top: 8px;
  flex: 0 0 auto;
  right: 0px;
  width: auto;
  height: auto;
  display: flex;
  position: absolute;
  align-items: flex-start;
}
.product-card-icon16 {
  width: 24px;
  height: 24px;
  margin-right: 10px;
}
.product-card-icon18 {
  width: 24px;
  height: 24px;
}
.product-card-container18 {
  flex: 0 0 auto;
  width: auto;
  display: flex;
  align-items: center;
  margin-bottom: 10px;
}
.product-card-container19 {
  flex: 0 0 auto;
  width: auto;
  height: auto;
  display: flex;
  align-items: flex-start;
}
.product-card-label {
  font-size: 14px;
}
.product-card-container20 {
  flex: 0 0 auto;
  width: 80px;
  height: auto;
  display: flex;
  align-items: flex-start;
  flex-direction: row;
}
.product-card-icon20 {
  width: 24px;
  height: 24px;
}
.product-card-icon22 {
  width: 24px;
  height: 24px;
}
.product-card-icon24 {
  width: 24px;
  height: 24px;
}
.product-card-icon26 {
  width: 24px;
  height: 24px;
}
.product-card-icon28 {
  width: 24px;
  height: 24px;
}
.product-card-container21 {
  flex: 0 0 auto;
  width: 100%;
  display: flex;
  align-items: flex-start;
  margin-bottom: 10px;
  flex-direction: column;
}
.product-card-text04 {
  font-style: normal;
  font-family: "Inter";
  font-weight: 300;
}
.product-card-container22 {
  flex: 0 0 auto;
  width: 200px;
  display: flex;
  margin-top: 10px;
  align-items: flex-start;
  margin-bottom: 0px;
  flex-direction: column;
}
.product-card-text07 {
  font-style: normal;
  font-weight: 700;
}
.product-card-container23 {
  flex: 0 0 auto;
  display: flex;
  align-items: flex-start;
  flex-direction: column;
}
.product-card-container24 {
  flex: 0 0 auto;
  width: 200px;
  display: flex;
  margin-top: 15px;
  align-items: flex-start;
  margin-bottom: 10px;
  flex-direction: column;
}
.product-card-text08 {
  font-size: 20px;
  font-style: normal;
  font-weight: 700;
}
.product-card-container25 {
  flex: 0 0 auto;
  display: flex;
  align-items: flex-start;
  flex-direction: column;
}
.product-card-text09 {
  font-size: 25px;
}
.product-card-text10 {
  font-size: 18px;
  text-decoration: line-through;
}
.product-card-container26 {
  flex: 0 0 auto;
  width: 416px;
  display: flex;
  align-self: center;
  align-items: center;
  flex-direction: column;
  justify-content: flex-start;
}
.product-card-button {
  width: 100%;
  align-self: center;
  font-style: normal;
  margin-top: 20px;
  transition: 0.3s;
  font-weight: 400;
  border-width: 0px;
  border-radius: 40px;
  margin-bottom: 20px;
  background-color: rgb(52, 235, 92);
}
.product-card-button:hover {
  color: var(--dl-color-gray-white);
  background-color: var(--dl-color-success-700);
}
.product-card-button1 {
  width: 100%;
  align-self: center;
  font-style: normal;
  transition: 0.3s;
  font-weight: 400;
  border-width: 0px;
  border-radius: 40px;
  background-color: #ff9919;
}

.product-card-footer {
  width: 100%;
  display: flex;
  max-width: var(--dl-size-size-maxwidth);
  align-items: center;
  padding-top: var(--dl-space-space-fourunits);
  padding-left: var(--dl-space-space-threeunits);
  padding-right: var(--dl-space-space-threeunits);
  flex-direction: column;
  padding-bottom: var(--dl-space-space-fourunits);
  justify-content: space-between;
  background-color: var(--dl-color-gray-black);
}
.product-card-container27 {
  gap: var(--dl-space-space-oneandhalfunits);
  display: flex;
  max-width: var(--dl-size-size-maxwidth);
  align-items: center;
  flex-direction: column;
  justify-content: flex-start;
}
.product-card-logo1 {
  color: var(--dl-color-gray-white);
  font-size: 2em;
  font-weight: bold;
}
.product-card-nav1 {
  flex: 0 0 auto;
  display: flex;
  margin-top: 0px;
  align-items: center;
  flex-direction: row;
}
.product-card-nav12 {
  color: var(--dl-color-secondary-gray500);
  margin-left: 0px;
}
.product-card-nav22 {
  color: var(--dl-color-secondary-gray500);
  margin-left: var(--dl-space-space-unit);
}
.product-card-nav32 {
  color: var(--dl-color-secondary-gray500);
  margin-left: var(--dl-space-space-unit);
}
.product-card-nav42 {
  color: var(--dl-color-secondary-gray500);
  margin-left: var(--dl-space-space-unit);
}
.product-card-nav52 {
  color: var(--dl-color-secondary-gray500);
  margin-left: var(--dl-space-space-unit);
}
.product-card-separator {
  flex: 0 0 auto;
  width: 100%;
  height: 0px;
  display: flex;
  margin-top: var(--dl-space-space-twounits);
  align-items: flex-start;
  margin-left: 0px;
  border-color: var(--dl-color-gray-800);
  border-style: solid;
  border-width: 1px;
  margin-right: 0px;
  margin-bottom: var(--dl-space-space-twounits);
  flex-direction: row;
  border-top-width: 0px;
  border-left-width: 0px;
  border-right-width: 0px;
}
.product-card-container28 {
  flex: 0 0 auto;
  width: auto;
  display: flex;
  position: relative;
  align-items: center;
  flex-direction: row;
  justify-content: space-between;
}
.product-card-icon-group1 {
  width: auto;
  display: flex;
  align-self: center;
  align-items: center;
  flex-direction: row;
  justify-content: space-between;
}
.product-card-icon30 {
  fill: var(--dl-color-secondary-gray500);
  width: 24px;
  height: 24px;
  margin-right: var(--dl-space-space-twounits);
}
.product-card-icon32 {
  fill: var(--dl-color-secondary-gray500);
  width: 24px;
  height: 24px;
  margin-right: var(--dl-space-space-twounits);
}
.product-card-icon34 {
  fill: var(--dl-color-secondary-gray500);
  width: 24px;
  height: 24px;
}
@media (max-width: 991px) {
  .product-card-navbar-interactive {
    width: 990px;
    border-radius: 0px;
  }
  .product-card-links {
    width: 634px;
  }
  .product-card-icon {
    margin-left: -150px;
  }
  .product-card-register {
    margin-left: -30px;
  }
  .product-card-container03 {
    height: 678px;
  }
  .product-card-container04 {
    width: 100%;
  }
  .product-card-container08 {
    width: 100%;
  }
  .product-card-container09 {
    width: 554px;
    height: 361px;
  }
  .product-card-container10 {
    width: 217px;
    height: 370px;
  }
  .product-card-container11 {
    width: 192px;
    height: 108px;
  }
  .product-card-image1 {
    height: 100%;
  }
  .product-card-container12 {
    width: 192px;
    height: 108px;
  }
  .product-card-image2 {
    width: 100%;
    height: 100%;
  }
  .product-card-container13 {
    width: 192px;
    height: 108px;
  }
  .product-card-image3 {
    width: 100%;
    height: 100%;
  }
  .product-card-container14 {
    width: 328px;
    height: 342px;
  }
  .product-card-image4 {
    width: 100%;
    height: 100%;
  }
  .product-card-container15 {
    width: 374px;
  }
  .product-card-container16 {
    margin-bottom: 0px;
  }
  .product-card-container18 {
    width: auto;
    align-self: flex-start;
    align-items: center;
    margin-bottom: 10px;
    flex-direction: row;
  }
  .product-card-container19 {
    width: auto;
    height: auto;
  }
  .product-card-label {
    width: auto;
    font-size: 14px;
    margin-right: 0px;
  }
  .product-card-container20 {
    width: 80px;
    height: auto;
  }
  .product-card-container21 {
    height: 118px;
    margin-bottom: 0px;
  }
  .product-card-text04 {
    width: auto;
    align-self: flex-start;
    font-style: normal;
    font-family: Inter;
    font-weight: 300;
  }
  .product-card-text05 {
    font-family: Inter;
  }
  .product-card-container22 {
    margin-bottom: 0px;
  }
  .product-card-text07 {
    font-style: normal;
    font-weight: 700;
  }
  .product-card-container24 {
    margin-top: 10px;
  }
  .product-card-text08 {
    font-size: 20px;
    font-style: normal;
    font-weight: 700;
    margin-bottom: 3px;
  }
  .product-card-container25 {
    flex-direction: row;
  }
  .product-card-text09 {
    font-size: 25px;
  }
  .product-card-text10 {
    font-size: 18px;
    align-self: center;
    text-decoration: line-through;
  }
  .product-card-container26 {
    width: 100%;
  }
  .product-card-button {
    margin-top: 16px;
    margin-bottom: 16px;
  }
}
@media (max-width: 767px) {
  .product-card-navbar-interactive {
    width: 570px;
    height: 87px;
    padding-left: var(--dl-space-space-twounits);
    border-radius: 50px;
    padding-right: var(--dl-space-space-twounits);
  }
  .product-card-desktop-menu {
    display: none;
  }
  .product-card-burger-menu {
    display: flex;
    align-items: center;
    justify-content: center;
  }
  .product-card-icon04 {
    width: 15px;
    height: 16px;
    margin-left: 400px;
  }
  .product-card-mobile-menu {
    padding-top: var(--dl-space-space-oneandhalfunits);
    padding-left: var(--dl-space-space-twounits);
    padding-right: var(--dl-space-space-twounits);
    padding-bottom: var(--dl-space-space-oneandhalfunits);
  }
  .product-card-nav11 {
    margin-bottom: var(--dl-space-space-unit);
  }
  .product-card-nav21 {
    margin-left: 0;
    margin-bottom: var(--dl-space-space-unit);
  }
  .product-card-nav31 {
    margin-left: 0;
    margin-bottom: var(--dl-space-space-unit);
  }
  .product-card-nav41 {
    margin-left: 0;
    margin-bottom: var(--dl-space-space-unit);
  }
  .product-card-nav51 {
    margin-left: 0;
    margin-bottom: var(--dl-space-space-unit);
  }
  .product-card-container03 {
    height: 607px;
  }
  .product-card-container04 {
    width: 100%;
    height: 52px;
  }
  .product-card-container06 {
    width: auto;
  }
  .product-card-container09 {
    width: 280px;
    height: 252px;
  }
  .product-card-container10 {
    display: none;
  }
  .product-card-container14 {
    width: 290px;
    height: 382px;
  }
  .product-card-image4 {
    height: 100%;
  }
  .product-card-container15 {
    margin-left: 20px;
  }
  .product-card-footer {
    padding-left: var(--dl-space-space-twounits);
    padding-right: var(--dl-space-space-twounits);
  }
  .product-card-separator {
    margin-top: var(--dl-space-space-oneandhalfunits);
    margin-left: 0px;
    margin-right: 0px;
    margin-bottom: var(--dl-space-space-oneandhalfunits);
  }
  .product-card-container28 {
    align-items: center;
    flex-direction: column;
    justify-content: space-between;
  }
}
@media (max-width: 479px) {
  .product-card-navbar-interactive {
    width: 479px;
    padding: var(--dl-space-space-unit);
  }
  .product-card-icon04 {
    margin-left: 350px;
  }
  .product-card-mobile-menu {
    padding: 16px;
  }
  .product-card-logo {
    font-size: 1.5em;
  }
  .product-card-icon06 {
    fill: var(--dl-color-gray-900);
  }
  .product-card-container03 {
    height: 891px;
  }
  .product-card-container04 {
    width: 100%;
  }
  .product-card-text {
    padding-left: 20px;
  }
  .product-card-container05 {
    width: 100%;
  }
  .product-card-container06 {
    gap: 2px;
    margin-left: 20px;
  }
  .product-card-link1 {
    margin-left: 20px;
  }
  .product-card-link2 {
    margin-left: 20px;
  }
  .product-card-link3 {
    margin-left: 20px;
  }
  .product-card-link4 {
    margin-left: 20px;
  }
  .product-card-container07 {
    width: auto;
    align-items: center;
    margin-left: 20px;
    margin-right: 20px;
  }
  .product-card-container08 {
    height: 712px;
    flex-direction: column;
  }
  .product-card-container09 {
    width: 422px;
    height: 234px;
    margin-left: 0px;
  }
  .product-card-container14 {
    width: 100%;
    height: 100%;
  }
  .product-card-image4 {
    width: 100%;
    height: 231px;
  }
  .product-card-container15 {
    width: 442px;
    align-self: center;
    margin-top: 20px;
    margin-left: 10px;
    margin-right: 10px;
  }
  .product-card-footer {
    width: 100%;
    padding: var(--dl-space-space-unit);
  }
  .product-card-separator {
    margin-top: var(--dl-space-space-oneandhalfunits);
    margin-bottom: var(--dl-space-space-oneandhalfunits);
  }
  .product-card-container28 {
    align-items: center;
    flex-direction: column;
    justify-content: space-between;
  }
}
</style>

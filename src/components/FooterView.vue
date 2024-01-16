<template>
  <footer class="text-center text-lg-start text-white" v-if="correctPage">
    <!-- style="background-color: #929fba" -->
    <!-- Grid container -->
    <div class="container p-4 pb-0">
      <!-- Section: Links -->
      <section class="">
        <!--Grid row-->
        <div class="row">
          <!-- Grid column -->
          <div class="col-md-3 col-lg-3 col-xl-3 mx-auto mt-3">
            <h6 class="text-uppercase mb-4 font-weight-bold">
              Delight De Heaven
            </h6>
            <p>
              The essence of <b>Kashmiri</b> handpicked dryfruits brought to
              your home from the lap of <b>Heaven On Earth</b> with love.
            </p>
          </div>
          <!-- Grid column -->

          <hr class="w-100 clearfix d-md-none" />

          <!-- Grid column -->
          <div class="col-md-2 col-lg-2 col-xl-2 mx-auto mt-3">
            <h6 class="text-uppercase mb-4 font-weight-bold">Products</h6>
            <p>
              <a class="text-white">Dry fruits</a>
            </p>
            <p>
              <a class="text-white">Dried fruits</a>
            </p>
            <p>
              <a class="text-white">Kernels</a>
            </p>
            <p>
              <a class="text-white">Kashmiri Saffron</a>
            </p>
          </div>
          <!-- Grid column -->

          <hr class="w-100 clearfix d-md-none" />

          <!-- Grid column -->
          <hr class="w-100 clearfix d-md-none" />

          <!-- Grid column -->
          <div class="col-md-4 col-lg-3 col-xl-3 mx-auto mt-3">
            <h6 class="text-uppercase mb-4 font-weight-bold">Contact</h6>
            <p>
              <i class="fa fa-home mr-3"></i> Hazratbal, Srinagar J&K 190006, IN
            </p>
            <p><i class="fa fa-envelope mr-3"></i> delightdeheaven@gmail.com</p>
            <p><i class="fa fa-phone mr-3"></i> +91 7006621040</p>
            <!-- <p><i class="fa fa-phone mr-3"></i> +91 9596269992</p> -->
          </div>
          <!-- Grid column -->

          <!-- Grid column -->
          <div class="col-md-3 col-lg-2 col-xl-2 mx-auto mt-3">
            <h6 class="text-uppercase mb-4 font-weight-bold">Our socials</h6>

            <!-- Facebook -->
            <!-- <a
              class="btn btn-primary btn-floating m-1"
              style="background-color: #3b5998"
              href="#!"
              role="button"
              ><i class="fa fa-facebook-f"></i
            ></a> -->

            <!-- Twitter -->
            <!-- <a
              class="btn btn-primary btn-floating m-1"
              style="background-color: #55acee"
              href="#!"
              role="button"
              ><i class="fa fa-twitter"></i
            ></a> -->

            <!-- Google
            <a
              class="btn btn-primary btn-floating m-1"
              style="background-color: #dd4b39"
              href="#!"
              role="button"
              ><i class="fa fa-google"></i
            ></a> -->

            <!-- Instagram -->
            <a
              class="btn btn-primary btn-floating m-1 insta-icon"
              style="
                background-color: #ac2bac;
                background-color: transparent;
                border: none;
              "
              href="https://www.instagram.com/delightdeheaven"
              role="button"
              ><i class="fa fa-instagram"></i
            ></a>
          </div>
        </div>
        <!--Grid row-->
      </section>
      <!-- Section: Links -->
    </div>
    <!-- Grid container -->

    <!-- Copyright -->
    <!-- <div
             class="text-center p-3"
             style="background-color: rgba(0, 0, 0, 0.2)"
             >
          © 2020 Copyright:
          <a class="text-white" href="https://mdbootstrap.com/">
            MDBootstrap.com
          </a>
        </div> -->
    <!-- Copyright -->
  </footer>
</template>

<script>
export default {
  computed: {
    correctPage() {
      if (
        this.$route.path == "/register" ||
        // this.$route.path == "/product" ||
        this.$route.path == "/login"
      ) {
        return false;
      } else {
        return true;
      }
    },
  },
};
</script>

<style>
footer {
  padding: 1em;
  /* background-color: #33691e; */
  /* background: #c35959; */
  /* background-color: rgb(49, 3, 3); */
  /* background-color: #220202; */
  background-color: #556b2f;
  color: white;
}

footer .container-fluid {
  margin: 0;
}

.fa-instagram {
  font-size: 40px;
  border: none;
  background: linear-gradient(to top right, #f9ce34, #ee2a7b, #6228d7);
  color: transparent;
  mix-blend-mode: screen;
  background-clip: text;
  border: none;
}

.insta-icon {
  outline: none;
  border: none;
}

.insta-icon:active {
  outline: none;
  border: none;
}
</style>

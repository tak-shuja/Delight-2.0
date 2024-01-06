import { createRouter, createWebHistory } from "vue-router";
import HomeView from "../views/HomeView.vue";
// import Navbar from "../components/NavBar.vue";
import SignupPage from "../components/SignupPage.vue";
import NotFound from "../components/404.vue";
// import ProductsPage from "../components/ProductsPage.vue";
import SupportPage from "../components/SupportPage.vue";
import ProductPage from "../components/ProductView.vue";
import CardView from "../components/CardView.vue";
// import SignupPage from "../components/signup/styles/SignupPage.vue";

const routes = [
  {
    path: "/",
    name: "home",
    component: HomeView,
  },
  {
    path: "/about",
    name: "about",
    component: () =>
      import(/* webpackChunkName: "about" */ "../views/AboutView.vue"),
  },
  // {
  //   path: "/navbar",
  //   name: "navbar",
  //   component: Navbar,
  // },
  {
    path: "/register",
    name: "register",
    component: SignupPage,
  },

  {
    path: "/items",
    name: "products",
    component: CardView,
  },

  {
    path: "/support",
    name: "support",
    component: SupportPage,
  },

  {
    path: "/product",
    name: "product",
    component: ProductPage,
  },
  // { path: "/404", component: NotFound },
  { path: "/:pathMatch(.*)*", component: NotFound },
];

const router = createRouter({
  // history: createWebHistory(process.env.BASE_URL),
  history: createWebHistory(process.env.BASE_URL),
  routes,
});

export default router;

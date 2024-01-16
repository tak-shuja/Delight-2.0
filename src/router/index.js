import { createRouter, createWebHistory } from "vue-router";
import HomeView from "../views/HomeView.vue";
import SignupPage from "../views/SignupPage.vue";
import NotFound from "../views/404.vue";
import SupportPage from "../views/SupportPage.vue";
import ProductPage from "../components/ProductView.vue";
import CardView from "@/views/ProductLandingPage.vue";
import LoginView from "@/views/LoginPage.vue";
import CartView from "@/views/Cart.vue";
import { auth } from "@/main";

const getCurrentUser = () => {
  return auth.currentUser;
};

/*
In many programming languages, a single exclamation mark (!) is a logical NOT operator, 
which means it reverses the boolean value of the operand.
Applying it twice (!!) essentially converts any truthy or falsy
value to its corresponding boolean representation. */

const routes = [
  {
    path: "/",
    name: "home",
    component: HomeView,
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
    path: "/login",
    name: "login",
    component: LoginView,
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
  // {
  //   path: "/profile",
  //   name: "profile",
  //   component: ProfileView,
  //   meta: {
  //     requiresAuth: true,
  //   },
  // },
  {
    path: "/cart",
    name: "cart",
    component: CartView,
    meta: {
      requiresAuth: true,
    },
  },

  {
    path: "/reset",
    name: "reset-password",
    component: import("@/views/ResetView.vue"),
    requiresAuth: true,
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

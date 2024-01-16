const cart_add_API = "http://localhost:3000/public/php/add_to_cart.php";

// Add the add to cart functionality
async function addToCart(product, authStore, isLoggedIn) {
  return new Promise((resolve, reject) => {
    if (isLoggedIn) {
      const data = {
        user_id: authStore.user.uid,
        product_id: product.id,
        product_price: product.price,
      };

      fetch(cart_add_API, { method: "POST", body: JSON.stringify(data) })
        .then((resp) => {
          if (!resp.ok) {
            console.error("Fetch Error! HTTP status: ", resp.statusText);
            reject("Fetch error");
          }
          return resp.json();
        })
        .then((result) => {
          if (result.status === "ok") {
            resolve(true);
          } else if (result.status === "error") {
            resolve(false);
          }
        })
        .catch((error) => {
          console.error(error);
          reject(error);
        });
    } else {
      resolve(false); // or reject("User not logged in") based on your preference
    }
  });
}

// Function to update cart items
function updateCartItems(data) {
  const update_cart_API = "http://localhost:3000/public/php/update_cart.php";

  fetch(update_cart_API, {
    body: JSON.stringify(data),
    headers: {
      "Content-Type": "application/json",
    },
    method: "POST",
  })
    .then((resp) => resp.json())
    .then((data) => {
      if ((data.status = "Ok")) {
        return true;
      } else {
        return false;
      }
    })
    .catch((error) => {
      console.error(error);
      return false;
    });
}
export { addToCart, updateCartItems };

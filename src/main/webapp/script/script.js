// script.js

// Function to add a product to the cart
function add_to_cart(pid,pname, pprice) {
    try {
        let cart = localStorage.getItem("cart");
        if (cart == null) {
            // If no cart exists, create a new cart with the first product
            let products = [];
            let product = { productId: pid, productName: pname, productPrice: pprice, productQuantity: 1 };
            products.push(product);
            localStorage.setItem("cart", JSON.stringify(products));
            // console.log("Product Added");
            showToast("Item added to cart");
        } else {
            // If cart exists, parse it and check for the product
            let pcart = JSON.parse(cart);

            let oldProduct = pcart.find(item => item.productId == pid);
            if (oldProduct) {
                // If product already exists, increase its quantity
                oldProduct.productQuantity += 1;
                localStorage.setItem("cart", JSON.stringify(pcart));
                // console.log("Product quantity increased");
                showToast(oldProduct.productName+" quantity increased");
            } else {
                // If product does not exist, add it to the cart
                let product = { productId: pid, productName: pname,productPrice: pprice, productQuantity: 1 };
                pcart.push(product);
                localStorage.setItem("cart", JSON.stringify(pcart));
                // console.log("Product is Added");
                showToast("Product added to cart");
            }
        }
        updateCart();
    } catch (error) {
        console.error("Error adding product to cart:", error);
    }
}

// Function to update the cart display
function updateCart() {
    try {
        let cartString = localStorage.getItem("cart");
        let cart = JSON.parse(cartString);
        if (cart == null || cart.length == 0) {
            console.log("Oops, bag is empty. Let's add something..!");
            // showToast("Oops, bag is empty. Let's add something..!");
            $(".cart-items").html("(0)");
            $(".cart-body").html("<h3>Nothing found in the Bag</h3>");
            $(".checkout-btn").addClass('disabled');
        } else {
            console.log(cart);
            $(".cart-items").html(`(${cart.length})`);
            // Update the cart UI with items

            let table= `
                <table class="table">
                <thead class="thead-light">
                    <tr>
                        <th>Item Name</th>
                        <th>Item Price</th>
                        <th>Item Quantity</th>
                        <th>Total Price</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
            `;

            // Using map to traverse all the items
            let totalPrice = 0;
            cart.map((item) => {
                table += `
                    <tr>
                        <td>${item.productName}</td>
                        <td>${item.productPrice}</td>
                        <td>${item.productQuantity}</td>
                        <td>${item.productQuantity * item.productPrice}</td>
                        <td><button onclick="deleteItemFromCart(${item.productId})" class='btn btn-danger btn-sm'>Remove</button></td>
                    </tr>`;
                totalPrice += item.productPrice * item.productQuantity;
            });

            table += `
                    <tr>
                        <td colspan='5' class='text-right font-weight-bold'>Total Amount : ₹ ${totalPrice}</td>
                    </tr>
                </tbody>
                </table>`;
            $(".cart-body").html(table);
            $(".checkout-btn").removeClass('disabled');
        }
    } catch (error) {
        console.error("Error updating cart:", error);
    }
}

//delete item
function deleteItemFromCart(pid){
    let cart = JSON.parse(localStorage.getItem('cart'));

    let newcart = cart.filter((item) => item.productId != pid)

    localStorage.setItem('cart' , JSON.stringify(newcart))

    updateCart()
    showToast("Item removed");
}

// When the document is ready, update the cart
$(document).ready(function () {
    updateCart();
});

function showToast(content){
    $("#toast").addClass("display");
    $("#toast").html(content);
    setTimeout(()=>{
        $("#toast").removeClass("display");
    } , 2000);
}
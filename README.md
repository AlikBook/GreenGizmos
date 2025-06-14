# This is our GREEN IT project: GreenGuizmos

It is a fullstack application:

- Frontend: Vue.js
- Backend: Node.js + Express

We hosted our website on [Vercel](https://vercel.com) for the Vue.js Frontend and the Node.js Backend.
We hosted our database on [Railway](https://railway.com).

Please find our website with this [link](https://green-it-vuejs.vercel.app/).

# Instructions to configure and run the project

To install the depedencies:

```ssh
cd FrontEnd
npm install
```

You have to create a file named ".env" in the Frontend directory and put the following elements inside:

```ssh
VITE_API_BASE_URL=https://green-it-tau.vercel.app
```

To launch the Vue app:

```ssh
npm run dev
```

# Functionalities of the website

### Home page

There is a quick presentation of the project

### Equipment pages

From computing Equipment to Mobile Gear you can click to see all the products of the category and add to cart if you want.

### Search bar

You can type a string and if this string is contained in one or more products, those products will be display.

### Sign up / Log in

You can create a guest account if you want to buy a product
You can also log in to the admin account and then add or remove products from the database. You can also manage the users of the website
To login as an admin use this credentials

Username: admin
Password : admin123

# Contributors and commit :

Gabriel initialized the Vue application

Ivan and Alexan created the structure of the pages

Gabriel connected the database to the back end

Paul implemented the first filters for the products

Ivan improved the style of the pages

Gabriel developed the option "Add to cart"

Ivan developed the different roles (Guest, User, Admin)

Paul implemented the search bar and the possibility to add and delete a product

Alexan implemented the final version of the display of the products on the pages.

Everyone add some pictures to the database and resolved different bugs.

Ivan hosted the databse on Railway.

Gabriel hosted the frontend and backend on Vercel.

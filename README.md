# This is our GREEN IT project: GreenGuizmos

It is a fullstack application:

- Frontend: Vue.js
- Backend: Node.js + Express
# Instructions to configure and run the project 
## Before starting:

```ssh
node -v
npm -v
```

If you don't have it, install it.

## Then you have to install the packages:

```ssh
cd BackEnd
npm install
```

You have to create a file named ".env" in the Backend directory and put the following elements inside:

```ssh
DB_HOST=localhost
DB_USER=root
DB_PASSWORD="password_of_user"
DB_NAME=greenguizmos
```

Create the database on mysql with the code in database.sql in BackEnd.

To launch the server:

```ssh
npm start
```

We use Nodemon so you only have to save the files and the server will restart itself.

To install the depedencies:

```ssh
cd FrontEnd
npm install
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

Everyone add some pictures to the database

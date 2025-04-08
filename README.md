# This is our GREEN IT project: GreenGuizmos

It is a fullstack application:

- Frontend: Vue.js
- Backend: Node.js + Express

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

You have to create a .env file in the Backend directory and put the following elements inside:

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

// connect to postgres
// import { Client } from 'pg';

// export const connectDB = async () => {

// const client = new Client({
//   connectionString: process.env.POSTGRES_URL,
// });

// client.connect()
//   .then(() => {
//     console.log('✅ Connected to PostgreSQL database!');
//     return client.end();
//   })
//   .catch(err => {
//     console.error('❌ Connection error', err.stack);
//   });
// }

// using pool instead, for routes and queries

import pkg from "pg";

const { Pool } = pkg;

 export const pool = new Pool({
    connectionString: process.env.POSTGRES_URL,
    ssl: false, // Set true if you're connecting remotely and need SSL
  });

export const connectDB = async () => {
 
  pool
    .connect()
    .then(() => console.log("✅ Connected to PostgreSQL"))
    .catch((err) => console.error("❌ PostgreSQL connection error:", err));
};

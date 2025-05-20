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

 const pool = new Pool({
    connectionString: process.env.POSTGRES_URL,
    ssl: false, // Set true if you're connecting remotely and need SSL
    max: 20,   // max no of clients in the pool 
    idleTimeoutMillis: 30000, // close idle clients after 30 seconds
    connectionTimeoutMillis: 2000 // return an error after 2 seconds if connection could not be established
  });

  // emit error on idle clients
  pool.on("error", (err, client) => {
    console.error("Unexpected error on idle client", err);
    process.exit(-1);
  })

  // function to excute queries
  const executeQuery = async (query:string, params?: any[]) => {
    const client = await pool.connect();
    try {
      const res = await client.query(query, params);
       console.log('\nQuery:', query);
        console.log('Results:', res.rows);
        return res.rows;
    } catch (err) {
      console.error("Error executing query", err);
      throw err;
    } finally {
      client.release();
    }
  }

  // test connection
export const connectDB = async () => {
  try {
    const client = await pool.connect();
    console.log("✅ Connected to PostgreSQL");
    client.release(); // release immediately after checking
  } catch (err) {
    console.error("❌ PostgreSQL connection error:", err);
    process.exit(1);
  }
};


export {pool, executeQuery};

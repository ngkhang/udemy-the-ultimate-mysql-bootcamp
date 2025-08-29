import { faker } from '@faker-js/faker';
import mysql from 'mysql2/promise';
import 'dotenv/config';

async function main() {
  try {
    // Create the connection
    const connection = await mysql.createConnection({
      host: process.env.DB_HOST,
      user: process.env.DB_USER,
      password: process.env.DB_PASSWORD,
      database: process.env.DB_NAME,
      // waitForConnections: true,
      // connectionLimit: 10,
    });

    // Example 1: Selecting data
    // const query = 'SELECT * FROM users';
    // const [result, field] = await connection.query(query);
    // console.log("Example: Selecting data: ", result)

    // Example 2: Inserting a single data - Approach VALUES()
    // const query = 'INSERT INTO `users` (`email`) VALUES (?)';
    // const value = [faker.internet.email()];
    // const [result, field] = await connection.query(query, value);
    // console.log("Example: Inserting a single data: ", result);

    // Example 3: Inserting a single data - Approach SET()
    // const query = 'INSERT INTO `users` SET ?';
    // const value = {
    //   email: faker.internet.email(),
    // };
    // const [result, field] = await connection.query(query, value);
    // console.log("Example: Inserting a single data: ", result);

    // Example 4: Inserting a multi data
    const query = 'INSERT INTO `users` (`email`, `created_at`) VALUES ?';

    const values = [];

    for (let i = 0; i < 1; i++) {
      const email = faker.internet.email();
      const createdAt = faker.date.past();
      values.push([email, createdAt]);
    };

    const result = await connection.query(
      query,
      [values],
    );
    console.log("Example: Inserting multiple data: ", result);

    // Close the connection
    await connection.end();
  } catch (error) {
    console.log(error);
    throw new Error("Something went wrong");
  }
}

await main();
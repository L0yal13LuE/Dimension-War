import mysql from "mysql2";
import dotenv from "dotenv";
dotenv.config();

const pool = mysql.createPool({
  host: process.env.MYSQL_HOST,
  user: process.env.MYSQL_USER,
  password: process.env.MYSQL_PASSWORD,
  database: process.env.MYSQL_DATABASE,
}).promise();

async function getCards(params) {
  const [result] = await pool.query("select * from cards");
  return result;
}

async function getCard(id) {
    const [result] = await pool.query(`
        select * 
        from cards
        where number = ?
        `, [id]);

    return result;
  }

const cards = await getCard('C001');
console.log(cards);

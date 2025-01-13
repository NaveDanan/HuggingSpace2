import pkg from 'pg';
import fs from 'fs';
import path from 'path';
import { fileURLToPath } from 'url';
import dotenv from 'dotenv';

dotenv.config();

const { Pool } = pkg;

const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);

const pool = new Pool({
  host: process.env.VITE_PG_HOST,
  port: process.env.VITE_PG_PORT,
  user: process.env.VITE_PG_USER,
  password: process.env.VITE_PG_PASSWORD,
  database: process.env.VITE_PG_DATABASE,
});

const migrate = async () => {
  const client = await pool.connect();
  try {
    const migrationDir = path.join(__dirname, 'supabase/migrations');
    const files = fs.readdirSync(migrationDir).sort();
    for (const file of files) {
      const filePath = path.join(migrationDir, file);
      const sql = fs.readFileSync(filePath, 'utf8');
      await client.query(sql);
      console.log(`Executed ${file}`);
    }
  } catch (err) {
    console.error('Migration failed', err);
  } finally {
    client.release();
  }
};

migrate().then(() => {
  console.log('Migration completed');
  pool.end();
});
import { drizzle } from 'drizzle-orm/postgres-js';
import postgres from 'postgres';
import schema from './schema';

if (!process.env.DATABASE_URL) throw new Error('DATABASE_URL must be defined');
export const connection = postgres(process.env.DATABASE_URL, {});

export const db = drizzle(connection, {
  schema,
  logger: true
});
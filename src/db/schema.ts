import { pgTable, serial, text, decimal, timestamp, json, pgEnum, sql } from 'drizzle-orm/pg-core';

const plantBasedLevelEnum = pgEnum('plant_based_level', ['full', 'partial']);
// const categoryEnum = pgEnum('Italian', 'Mexican', 'Chinese', 'Japanese', 'Mediterranean')
export const location = pgTable('location', {
  id: serial("id").primaryKey(),
  name: text('name'),
  lat: decimal('lat'),
  long: decimal('long'),
  // category relationship
  // tags relationship
  dateUpdated: timestamp('date_updated'),
  menu: json('menu'),
  plantBasedLevel: plantBasedLevelEnum('plant_based_level'),
  address: text('address'),
  editorRating: decimal('editor_rating'), //when drizzle implements CHECK, add it to limit the number between 0 and 5, inclusive.
  userRating: decimal('user_rating'), //when drizzle implements CHECK, add it to limit the number between 0 and 5, inclusive.
});

// export const category = pgTable('category', {
//   id: serial("id").primaryKey(),
//   name: categoryEnum('name'),
// });
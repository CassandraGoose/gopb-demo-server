import { pgTable, serial, text, decimal, integer, timestamp, json, pgEnum } from "drizzle-orm/pg-core";

export const plantBasedLevelEnum = pgEnum("plant_based_level", ["full", "partial"]);
export const tagEnum = pgEnum("tag_name", ["Bakery", "Breakfast", "Lunch", "Dinner", "Confectionery", "Desserts", "Fast", "Fast Casual", "Grocery", "Raw", "Restaurant", "Tapas"]);
export const cuisineEnum = pgEnum("cuisine_name", ["American", "Brazilian", "Cajun & Creole", "Chinese", "Colombian", "Comfort", "Cuban", "Diner", "Ethiopian", "Filipino", "French", "Fusion", "Gluten-free", "Greek", "Hawaiian", "Healthy", "Indian", "Italian", "Japanese", "Korean", "Kosher", "Latin American", "Mediterranean", "Mexican", "Middle Eastern", "Moroccan", "Nepalese", "Paleo", "Peruvian", "Raw", "Soul", "Southern", "Street", "Tex-Mex", "Thai", "Vietnamese"]);
export const categoryEnum = pgEnum("category_type", ["Restaurant", "Grocery", "Other"]);

export const location = pgTable("location", {
  id: serial("id").primaryKey(),
  name: text("name"),
  lat: decimal("lat"),
  long: decimal("long"),
  updatedAt: timestamp("date_updated"),
  menu: json("menu"),
  plantBasedLevel: plantBasedLevelEnum("plant_based_level"),
  address: text("address"),
  editorRating: decimal("editor_rating"), //when drizzle implements CHECK, add it to limit the number between 0 and 5, inclusive.
  userRating: decimal("user_rating"), //when drizzle implements CHECK, add it to limit the number between 0 and 5, inclusive.
});

export const tag = pgTable("tag", {
  id: serial("id").primaryKey(),
  name: tagEnum("tag_name"),
});

export const locationTag = pgTable("location_tag", {
  id: serial("id").primaryKey(),
  locationId: integer("location_id").notNull().references(() => location.id),
  tagId: integer("tag_id").notNull().references(() => tag.id),
});

export const cuisine = pgTable("cuisine", {
  id: serial("id").primaryKey(),
  name: cuisineEnum("cuisine_name"),
});

export const locationCuisine = pgTable("location_cuisine", {
  id: serial("id").primaryKey(),
  locationId: integer("location_id").notNull().references(() => location.id),
  cuisineId: integer("cuisine_id").notNull().references(() => cuisine.id),
});

export const category = pgTable("category", {
  id: serial("id").primaryKey(),
  type: categoryEnum("category_type"),
});

export const locationCategory = pgTable("location_category", {
  id: serial("id").primaryKey(),
  locationId: integer("location_id").notNull().references(() => location.id),
  categoryId: integer("category_id").notNull().references(() => category.id),
});
